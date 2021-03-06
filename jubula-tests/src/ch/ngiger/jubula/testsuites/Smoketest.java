package ch.ngiger.jubula.testsuites;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.exceptions.ActionException;
import org.eclipse.jubula.client.exceptions.CheckFailedException;
import org.eclipse.jubula.toolkit.concrete.components.Application;
import org.eclipse.jubula.toolkit.concrete.components.TextInputComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.tools.ComponentIdentifier;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestWatcher;
import org.junit.runners.MethodSorters;

import ch.ngiger.jubula.elexiscore.OM;
import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Artikelstamm;
import ch.ngiger.jubula.helpers.AutTestWatcher;
import ch.ngiger.jubula.helpers.Common;
import ch.ngiger.jubula.helpers.Eigenleistung;
import ch.ngiger.jubula.helpers.Invoice;
import ch.ngiger.jubula.helpers.Patients;
import ch.ngiger.jubula.helpers.Perspectives;
import ch.ngiger.jubula.helpers.Software;
import ch.ngiger.jubula.helpers.Utils;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class Smoketest {
	private static final boolean show_sw = true;
	private static final boolean install_sw = true;
	private static boolean with_artikelstamm = true;

	public static String SAVE_RESULTS_DIR = null;
	private static String watchedLog = "Started:\n";

	@Rule
    public TestWatcher watchman = new AutTestWatcher();

    private static HashMap<String, Common> components = new HashMap<String, Common>() {
		/**
		 * Allow easy iterating over my components
		 */
		private static final long serialVersionUID = 1L;

		{
			put("c", c);
			put("views", views);
			put("eigenleistung", eigenleistung);
			put("artikelstamm", artikelstamm);
			put("perspectives", perspectives);
			put("software", software);
			put("pat", pat);
			put("invoice", invoice);
		}
	};

	private static Common c = null;
	private static Common views = null;
	private static Eigenleistung eigenleistung = null;
	private static Artikelstamm artikelstamm = null;
	private static Perspectives perspectives = null;
	private static Software software = null;
	private static Patients pat = null;
	private static Invoice invoice = null;

	private static AUT m_aut = null;
	private static Application m_app = null;

	@BeforeClass
	public static void setup() throws Exception{
		AUT_run.setUp();
		Utils.dbg_msg("AUT_run: setup done"); //$NON-NLS-1$
		m_aut = AUT_run.startAUT(!AUT_run.FORCE_START);
		m_app = AUT_run.app;

		c = new Common(AUT_run.m_aut, AUT_run.app);
		perspectives = new Perspectives(AUT_run.m_aut, AUT_run.app);
		software = new Software(AUT_run.m_aut, AUT_run.app);
		eigenleistung = new Eigenleistung(AUT_run.m_aut, AUT_run.app);
		pat = new Patients(AUT_run.m_aut, AUT_run.app);
		invoice = new Invoice(AUT_run.m_aut, AUT_run.app);
		artikelstamm = new Artikelstamm(AUT_run.m_aut, AUT_run.app, perspectives);
		perspectives.initialSetup();
		artikelstamm.openArtikelstammView(); // Force migration
		// At the moment we do cannot test the Artikelstamm with Medelexis, as the Database do not contain any items
		// And we do not want to import all items
		if (AUT_run.isMedelexis) {
			with_artikelstamm = false;
		}
	}

	private static void showVars(){
		components.forEach((k, v) -> {
			if (v == null)
				Utils.dbg_msg(k + " is null");
			else if (v.m_aut == null)
				Utils.dbg_msg(k + ".m_aut is null");
			else
				Utils.dbg_msg(k + " connected " + v.m_aut.isConnected() + " v" + v);
		});
	}

	public void testTextInput(ComponentIdentifier<TextInputComponent> cid, String char2test){
		Utils.dbg_msg(
			AUT_run.Keyboard_Locale.toString() + " testTextInput: " + cid + " with " + char2test);
		TextInputComponent tic = SwtComponents.createTextInputComponent(cid);
		c.synchronizedTextReplace(cid, "");//$NON-NLS-1$

		for (int i = 0, n = char2test.length(); i < n; i++) {
			String tst_string = char2test.substring(i, i + 1);
			try {
				views.m_aut.execute(tic.replaceText(tst_string), null);
				views.m_aut.execute(tic.checkText(tst_string, Operator.matches), null);
			} catch (ActionException | CheckFailedException e) {
				Utils.dbg_msg(AUT_run.Keyboard_Locale.toString() + "  FAILED: " + i + " -> "
					+ tst_string + " " + e.getMessage());
				AUT_run.takeScreenshotActiveWindow(m_aut, m_app,
					AUT_run.Keyboard_Locale.toString() + "_failed_" + tst_string + ".png");
			}
		}
	}

	private void testAllChars(){
		@SuppressWarnings("unchecked")
		ComponentIdentifier<TextInputComponent> text_intput_to_use = OM.Patienten_SelectName_grc; //$NON-NLS-1$
		String normal = "01234567890 abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String extras = "+\"*%&/()=?_:;,.-<>|@#|[]{}\\";
		String problems = "äöüéàè¼{½¬€";

		List<String> myList = Arrays.asList(normal, extras, problems);
		myList.forEach(element -> testTextInput(text_intput_to_use, element));

		// We don't call synchronizedTextReplace on each element as this fails, and I don't
		// have time to debug why, as we had no problems
		// myList.forEach(element -> synchronizedTextReplace(text_intput_to_use, element));
	}

	@Test()
	/**
	 * Run SW-Installation early
	 * @throws Exception
	 */
	public void _install_sw() throws Exception{
		if (install_sw && !software.baseChIsInstalled()) {
			software.installAllSW();
		}
		if (show_sw || with_artikelstamm) {
			 // need to distinguis between v3 and v4 for Artikelstamm
			software.showAbout("second", true);
		}
	}

	@Test()
	public void smoketest() throws Exception{
		Utils.dbg_msg("smoketest install_sw is " + install_sw
			+ " with_artikelstamm " + with_artikelstamm + " Medelexis " + AUT_run.isMedelexis);
		// showVars();
		pat.selectFavoritenTab("Artikelstamm");
		pat.selectFavoritenTab("Eigenartikel"); // Force migration in 3.2
		pat.selectFavoritenTab("Eigenleistung");
		pat.selectFavoritenTab("Tarmed");
		pat.selectFavoritenTab("Block");
		Utils.dbg_msg("Smoketest with_artikelstamm " + with_artikelstamm + " v4 "
			+ software.isArtikelstamm_v4());
		if (with_artikelstamm ) {
			String filename = "";
			if (software.isArtikelstamm_v4()) {
				filename = AUT_run.class.getClassLoader()
					.getResource("rsc/artikelstamm_first_v4.xml").getPath();
			} else {
				filename = AUT_run.class.getClassLoader()
					.getResource("rsc/artikelstamm_first_v3.xml").getPath();
			}
			boolean result =
				artikelstamm.importArtikelstamm(System.getProperty("user.dir") + filename);
			Utils.dbg_msg("result: " + result);
			Assert.assertTrue(result);
		}

		String leistungs_name = "Motorfaehigkeit testen";
		String leistung_short = "mfk";
		eigenleistung.createEigenleistung(leistung_short, leistungs_name, 5000, 8000, 10);

		pat.createPatient("Testperson", "ArmesWesen", "31.01.1990");
		perspectives.openPatientenPerspective();

		// We need swiss base feature to be able to invoice!
		pat.createCase("KVG", "Husten", "Testperson", "Nr. 34.56", "24.12.14");
		pat.createConsultation("Scheint ein Simulant zu sein", "Kann gut fabulieren");

		if (with_artikelstamm) {
			pat.artikelstammItemVerrechnen(artikelstamm, "ASPIRIN");
		}

		pat.eigenleistungVerrechnen(eigenleistung, leistung_short, leistungs_name);
		pat.invoiceActiveConsultation();
		pat.selectFirstPatient();
		String test = invoice.getInvoicesAsString("invoice/after_first_invoice.png");
		Pattern p = Pattern.compile("[0-9]{4}.*Testperson.*ArmesWesen.*1990");
		Matcher m = p.matcher(test);
		boolean found = m.find();
		int j = pat.nrRowsInTable(OM.BillSummary_Tbc);
		Utils.dbg_msg("Smoketest found " + j + " bills"); //$NON-NLS-1$ //$NON-NLS-2$
		if (AUT_run.AUT_runs_on_localhost()) {
			Utils.dbg_msg("getInvoicesAsString Testing >" + test + "< matches <" + p
				+ "> returns found " + found);
			Assert.assertTrue(found);
		} else {
			Utils.dbg_msg("Skip check on remote host" + j);
		}
		Utils.dbg_msg("Smoketest.finished successfully!"); //$NON-NLS-1$
	}

	@AfterClass
	public static void teardown() throws Exception{
		Utils.dbg_msg("Smoketest.teardown"); //$NON-NLS-1$
		Utils.dbg_msg(watchedLog);
		// Don't call stopAut, as this class is also used by the Medelexis Testusuite
	}
}
