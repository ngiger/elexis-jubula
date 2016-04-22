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
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestWatcher;
import org.junit.runner.Description;

import ch.ngiger.jubula.elexiscore.OM;
import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Artikelstamm;
import ch.ngiger.jubula.helpers.Common;
import ch.ngiger.jubula.helpers.Constants;
import ch.ngiger.jubula.helpers.Eigenleistung;
import ch.ngiger.jubula.helpers.Invoice;
import ch.ngiger.jubula.helpers.Patients;
import ch.ngiger.jubula.helpers.Perspectives;
import ch.ngiger.jubula.helpers.Software;
import ch.ngiger.jubula.helpers.Utils;
import ch.ngiger.jubula.helpers.Views;

public class Smoketest {
	public static String SAVE_RESULTS_DIR = null;
	private static String watchedLog = "Started:\n";
	@Rule
	public TestWatcher watchman = new TestWatcher() {
		@Override
		protected void failed(Throwable e, Description description){
			String msg = description + " failed\n";
			watchedLog += msg;
			Utils.dbg_msg("JUnitTest: " + msg);
			e.printStackTrace(Utils.getWriter());

		}

		@Override
		protected void succeeded(Description description){
			String msg = description + " succeeded\n";
			watchedLog += msg;
			Utils.dbg_msg("JUnitTest: " + msg);
		}
		@Override
		protected void starting(Description description){
			String msg = description + " starting\n";
			watchedLog += msg;
			Utils.dbg_msg("JUnitTest: " + msg);
		}
	};


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
	private static Views views = null;
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
		m_aut = AUT_run.startAUT();
		m_app = AUT_run.app;

		c = new Common(AUT_run.m_aut, AUT_run.app);
		perspectives = new Perspectives(AUT_run.m_aut, AUT_run.app);
		views = new Views(AUT_run.m_aut, AUT_run.app);
		software = new Software(AUT_run.m_aut, AUT_run.app);
		eigenleistung = new Eigenleistung(AUT_run.m_aut, AUT_run.app);
		pat = new Patients(AUT_run.m_aut, AUT_run.app);
		invoice = new Invoice(AUT_run.m_aut, AUT_run.app);
		artikelstamm = new Artikelstamm(AUT_run.m_aut, AUT_run.app, perspectives);

		perspectives.initialSetup();
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

	private static final boolean install_and_show_sw = true;
	private static final boolean with_artikelstamm = false;

	@Test()
	public void smoketest() throws Exception{
		Utils.dbg_msg("smoketest install_and_show_sw is " + install_and_show_sw
			+ " with_artikelstamm " + with_artikelstamm + " Medelexis " + AUT_run.isMedelexis);
		Utils.dbg_msg("Calling importArtikelstamm" + AUT_run.config.get(Constants.AUT_EXE));
		// showVars();
		if (AUT_run.isMedelexis) {
			Utils.dbg_msg("AUT_EXE is medelexis: " + AUT_run.config.get(Constants.AUT_EXE));
			c.clickComponent(OM.Medelexis_Abo_perspective_tbi);
			Utils.sleepMs(5 * 1000); // wait 5 seconds: TODO: should wait till populated
		}

		if (install_and_show_sw) {
			//			showVars();
			//software.showAbout("first");
			if (AUT_run.isMedelexis) {
				Utils.dbg_msg("AUT_EXE is medelexis" + AUT_run.config.get(Constants.AUT_EXE));
				c.openMenu("Datei/Beenden");
			} else {
				software.installAllFeatures();
				Utils.dbg_msg("Smoketest calling restart");
				AUT_run.restartApp(m_aut);
				Utils.dbg_msg("Smoketest restarted");
				AUT_run.takeScreenshotActiveWindow(AUT_run.m_aut, AUT_run.app, "after_restart.png");
				Utils.dbg_msg("Smoketest restarted");
				perspectives.initialSetup();
			}
			showVars();
			software.showAbout("second");
			Utils.dbg_msg("Calling importArtikelstamm" + AUT_run.config.get(Constants.AUT_EXE));
		}
		Utils.dbg_msg("Smoketest with_artikelstamm " + with_artikelstamm + " v4 "
			+ software.isArtikelstamm_v4());
		if (with_artikelstamm) {
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

		String leisungs_name = "Motorfaehigkeit testen";
		eigenleistung.createEigenleistung("mfk", leisungs_name, 5000, 8000, 10);

		pat.createPatient("Testperson", "ArmesWesen", "31.01.1990");
		perspectives.openPatientenPerspective();

		// We need swiss base feature to be able to invoice!
		pat.createCase("KVG", "Husten", "Testperson", "Nr. 34.56", "24.12.14");
		pat.createConsultation("Scheint ein Simulant zu sein", "Kann gut fabulieren");

		if (with_artikelstamm) {
			pat.artikelstammItemVerrechnen(artikelstamm, "CYKLOKAPRON");
		}
		pat.eigenleistungVerrechnen(eigenleistung, leisungs_name.substring(0, 4));

		pat.invoiceActiveConsultation();
		String test = invoice.getInvoicesAsString("invoice/after_first_invoice.png");
		Pattern p = Pattern.compile("[0-9]{4}.*Testperson.*ArmesWesen.*1990");
		Matcher m = p.matcher(test);
		boolean found = m.find();
		Utils.dbg_msg("getInvoicesAsString Testing >" + test + "< matches <" + p
			+ "> returns found " + found);
		Assert.assertTrue(found);
		Utils.dbg_msg("Smoketest.finished successfully!"); //$NON-NLS-1$
	}

	@AfterClass
	public static void teardown() throws Exception{
		Utils.dbg_msg("Smoketest.teardown"); //$NON-NLS-1$
		Utils.dbg_msg(watchedLog);
		AUT_run.stopAut(m_aut);
		AUT_run.tearDown();
	}
}
