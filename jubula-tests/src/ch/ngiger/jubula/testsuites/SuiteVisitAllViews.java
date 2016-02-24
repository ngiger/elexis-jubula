package ch.ngiger.jubula.testsuites;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Common;
import ch.ngiger.jubula.helpers.Utils;
import ch.ngiger.jubula.helpers.Views;

public class SuiteVisitAllViews {
	/** test generating a snapshot of the currently active window */
	private static Common runner = new Common(AUT_run.doctor, AUT_run.elexis);
	private static Views views = null;

	@BeforeClass
	public static void setup() throws Exception{
		AUT_run.setUp();
		views = new Views(AUT_run.doctor, AUT_run.elexis);
	}

	@Test()
	public void suite_visit_all_views() throws Exception{
		runner.initialWorkWithRunFromScatch();
		views.visit_all_views();
	}

	@AfterClass
	public static void teardown() throws Exception{
		Utils.dbg_msg("SuiteVisitAllViews.teardown"); //$NON-NLS-1$
		AUT_run.tearDown();
	}
}
