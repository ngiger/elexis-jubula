package ch.ngiger.jubula.testsuites;

import java.util.HashMap;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.toolkit.concrete.components.Application;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestWatcher;
import org.junit.runners.MethodSorters;

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
public class ImportArtikelstamm {
	public static String SAVE_RESULTS_DIR = null;
	public static String watchedLog = "Started:\n";
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
	private static boolean install_and_show_sw = true;

	@BeforeClass
	public static void setup() throws Exception{
		AUT_run.setUp();
		Utils.dbg_msg("AUT_run: setup done"); //$NON-NLS-1$
		m_aut = AUT_run.startAUT(!AUT_run.FORCE_START);
		m_app = AUT_run.app;
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "start_import_artikelstamm.png");

		c = new Common(AUT_run.m_aut, AUT_run.app);
		perspectives = new Perspectives(AUT_run.m_aut, AUT_run.app);
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
	@Test()
	/**
	 * Run SW-Installation early
	 * @throws Exception
	 */
	public void _install_sw() throws Exception{
		if (install_and_show_sw) {
			software.showAbout("first", false);
		}
		if (install_and_show_sw && !software.baseChIsInstalled()) {
			software.installAllSW();
		}
		if (install_and_show_sw ) {
			 // need to distinguis between v3 and v4 for Artikelstamm
			software.showAbout("second", true);
		}
	}

	@Test()
	public void importArtikelstamm() throws Exception{
		Utils.dbg_msg("importArtikelstamm Medelexis " + AUT_run.isMedelexis);
		software.showAbout("artikel", true); // needed to get info whether
		Utils.dbg_msg("importArtikelstamm v4 " + software.isArtikelstamm_v4());
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
		Utils.dbg_msg("importArtikelstamm.finished successfully!"); //$NON-NLS-1$
	}

	@AfterClass
	public static void teardown() throws Exception{
		Utils.dbg_msg("importArtikelstamm.teardown"); //$NON-NLS-1$
		Utils.dbg_msg(watchedLog);
	}
}
