package ch.ngiger.jubula.testsuites;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.eclipse.jubula.client.AUT;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestWatcher;
import org.junit.runner.Description;

import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Artikelstamm;
import ch.ngiger.jubula.helpers.Eigenleistung;
import ch.ngiger.jubula.helpers.Invoice;
import ch.ngiger.jubula.helpers.Patients;
import ch.ngiger.jubula.helpers.Perspectives;
import ch.ngiger.jubula.helpers.PreferencePages;
import ch.ngiger.jubula.helpers.Software;
import ch.ngiger.jubula.helpers.Utils;
import ch.ngiger.jubula.helpers.Views;

public class Medelexis {
	public static String SAVE_RESULTS_DIR = null;
	@Rule
	public TestWatcher watchman = new TestWatcher() {
		@Override
		protected void failed(Throwable e, Description description){
			String msg = description + " failed\n";
			Utils.dbg_msg("JUnitTest: " + msg);
			e.printStackTrace(Utils.getWriter());
			if (m_aut != null && m_aut.isConnected()) {
				AUT_run.stopAut(m_aut);
			}
		}

		@Override
		protected void succeeded(Description description){
			String msg = description + " succeeded\n";
			Utils.dbg_msg("JUnitTest: " + msg);
		}
		@Override
		protected void starting(Description description){
			String msg = description + " starting\n";
			Utils.dbg_msg("JUnitTest: " + msg);
		}
	};
	private static Eigenleistung eigenleistung = null;
	private static Artikelstamm artikelstamm = null;
	private static Perspectives perspectives = null;
	private static Software software = null;
	private static Patients pat = null;
	private static Invoice invoice = null;
	private static boolean is_first = true;
	private static AUT m_aut = null;

	@BeforeClass
	public static void setupClass() throws Exception{
		AUT_run.setUp();
		Utils.dbg_msg("AUT_run: setup done"); //$NON-NLS-1$
		m_aut = AUT_run.startAUT();
		is_first = true;

		perspectives = new Perspectives(AUT_run.m_aut, AUT_run.app);
		software = new Software(AUT_run.m_aut, AUT_run.app);
		eigenleistung = new Eigenleistung(AUT_run.m_aut, AUT_run.app);
		pat = new Patients(AUT_run.m_aut, AUT_run.app);
		invoice = new Invoice(AUT_run.m_aut, AUT_run.app);
		artikelstamm = new Artikelstamm(AUT_run.m_aut, AUT_run.app, perspectives);
		perspectives.initialSetup();
	}
	@Before
	public void setup() throws Exception{
		Utils.dbg_msg("AUT_run: m_aut.isConnected() " + m_aut.isConnected()); //$NON-NLS-1$
		if (!m_aut.isConnected()) {
			m_aut = AUT_run.startAUT();
		}

		perspectives = new Perspectives(AUT_run.m_aut, AUT_run.app);
		software = new Software(AUT_run.m_aut, AUT_run.app);
		eigenleistung = new Eigenleistung(AUT_run.m_aut, AUT_run.app);
		pat = new Patients(AUT_run.m_aut, AUT_run.app);
		invoice = new Invoice(AUT_run.m_aut, AUT_run.app);
		artikelstamm = new Artikelstamm(AUT_run.m_aut, AUT_run.app, perspectives);
		perspectives.initialSetup();
	}

	@Test()
	public void suite_visit_all_perspectives() throws Exception{
		Perspectives p = new Perspectives(AUT_run.m_aut, AUT_run.app);
		p.initialSetup();
		p.visit_all_perspectives();
	}

	@Test()
	public void suite_visit_all_preferencePages() throws Exception{
		PreferencePages pp = new PreferencePages(AUT_run.m_aut, AUT_run.app);
		pp.visit_all_preferencePages();
	}

	// TODO: @Test()
	public void suite_visit_all_views() throws Exception{
		Views v = new Views(AUT_run.m_aut, AUT_run.app);
		v.visit_all_views();
	}

	@Test()
	public void medelexis_smoketest() throws Exception{
		boolean with_artikelstamm = false;
		Utils.dbg_msg("medelexis_smoketest with_artikelstamm " + with_artikelstamm);
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

		String leistungs_name = "Motorfaehigkeit testen";
		String leistung_short = "mfk";
		eigenleistung.createEigenleistung(leistung_short, leistungs_name, 5000, 8000, 10);

		pat.createPatient("Testperson", "ArmesWesen", "31.01.1990");
		perspectives.openPatientenPerspective();

		// We need swiss base feature to be able to invoice!
		pat.createCase("KVG", "Husten", "Testperson", "Nr. 34.56", "24.12.14");
		pat.createConsultation("Scheint ein Simulant zu sein", "Kann gut fabulieren");

		if (with_artikelstamm) {
			pat.artikelstammItemVerrechnen(artikelstamm, "CYKLOKAPRON");
		}

		pat.eigenleistungVerrechnen(eigenleistung, leistung_short, leistungs_name);
		pat.invoiceActiveConsultation();
		String test = invoice.getInvoicesAsString("invoice/after_first_invoice.png");
		Pattern p = Pattern.compile("[0-9]{4}.*Testperson.*ArmesWesen.*1990");
		Matcher m = p.matcher(test);
		boolean found = m.find();
		Utils.dbg_msg("getInvoicesAsString Testing >" + test + "< matches <" + p
			+ "> returns found " + found);
		Assert.assertTrue(found);
		Utils.dbg_msg("medelexis_smoketest.finished successfully!"); //$NON-NLS-1$
	}

	@After
	public void teardown() throws Exception{
		Utils.dbg_msg("Smoketest.teardown"); //$NON-NLS-1$
		// AUT_run.stopAut(m_aut);
		// AUT_run.tearDown();
	}
	@AfterClass
	public static void teardownFinal() throws Exception{
		Utils.dbg_msg("Smoketest.teardownFinal"); //$NON-NLS-1$
		AUT_run.stopAut(m_aut);
		AUT_run.tearDown();
	}
}
