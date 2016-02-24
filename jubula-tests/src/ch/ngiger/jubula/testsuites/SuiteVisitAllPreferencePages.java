package ch.ngiger.jubula.testsuites;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Artikelstamm;
import ch.ngiger.jubula.helpers.Common;
import ch.ngiger.jubula.helpers.Eigenleistung;
import ch.ngiger.jubula.helpers.Invoice;
import ch.ngiger.jubula.helpers.Patients;
import ch.ngiger.jubula.helpers.Perspectives;
import ch.ngiger.jubula.helpers.PreferencePages;
import ch.ngiger.jubula.helpers.Software;
import ch.ngiger.jubula.helpers.Utils;
import ch.ngiger.jubula.helpers.Views;

public class SuiteVisitAllPreferencePages {
	/** test generating a snapshot of the currently active window */
	private static Common runner = new Common(AUT_run.doctor, AUT_run.elexis);
	private static PreferencePages prefPages = null;

	@BeforeClass
	public static void setup() throws Exception{
		AUT_run.setUp();
		Utils.dbg_msg("setup done"); //$NON-NLS-1$
		prefPages = new PreferencePages(AUT_run.doctor, AUT_run.elexis);
	}

	@Test()
	public void suite_visit_all_preferencePages() throws Exception{
		runner.initialWorkWithRunFromScatch();
		prefPages.visit_all_preferencePages();
	}

	@AfterClass
	public static void teardown() throws Exception{
		AUT_run.tearDown();
	}
}
