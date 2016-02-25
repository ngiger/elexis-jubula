package ch.ngiger.jubula.testsuites;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Perspectives;
import ch.ngiger.jubula.helpers.PreferencePages;
import ch.ngiger.jubula.helpers.Utils;

public class SuiteVisitAllPreferencePages extends PreferencePages {
	/** test generating a snapshot of the currently active window */
	private static Perspectives perspectives = null;
	@BeforeClass
	public static void setup() throws Exception{
		AUT_run.setUp();
		Utils.dbg_msg("setup done"); //$NON-NLS-1$
		perspectives = new Perspectives();
	}

	@Test()
	public void suite_visit_all_preferencePages() throws Exception{
		Utils.initialWorkWithRunFromScatch(perspectives);
		visit_all_preferencePages();
	}

	@AfterClass
	public static void teardown() throws Exception{
		AUT_run.tearDown();
	}
}
