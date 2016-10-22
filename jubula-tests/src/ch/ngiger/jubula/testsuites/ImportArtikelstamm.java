package ch.ngiger.jubula.testsuites;

import java.util.HashMap;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.toolkit.concrete.components.Application;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestWatcher;
import org.junit.runner.Description;

import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Artikelstamm;
import ch.ngiger.jubula.helpers.Common;
import ch.ngiger.jubula.helpers.Eigenleistung;
import ch.ngiger.jubula.helpers.Invoice;
import ch.ngiger.jubula.helpers.Patients;
import ch.ngiger.jubula.helpers.Perspectives;
import ch.ngiger.jubula.helpers.Software;
import ch.ngiger.jubula.helpers.Utils;
import ch.ngiger.jubula.helpers.Views;

public class ImportArtikelstamm {
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
	private static boolean install_and_show_sw = true;

	@BeforeClass
	public static void setup() throws Exception{
		AUT_run.setUp();
		Utils.dbg_msg("AUT_run: setup done"); //$NON-NLS-1$
		m_aut = AUT_run.startAUT();
		m_app = AUT_run.app;
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "start_import_artikelstamm.png");

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

	@Test()
	public void importArtikelstamm() throws Exception{
		Utils.dbg_msg("importArtikelstamm Medelexis " + AUT_run.isMedelexis);
		if (install_and_show_sw) {
			software.installAllSW();
		}
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
		Utils.dbg_msg("Smoketest.teardown"); //$NON-NLS-1$
		Utils.dbg_msg(watchedLog);
		AUT_run.stopAut(m_aut);
		AUT_run.tearDown();
	}
}
