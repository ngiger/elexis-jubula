package ch.ngiger.jubula.testsuites;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Perspectives;
import ch.ngiger.jubula.helpers.Utils;
import ch.ngiger.jubula.helpers.Views;

public class SuiteVisitAllViews {
	/** test generating a snapshot of the currently active window */
	private static Perspectives p = null;
	private static Views v = null;

	@BeforeClass
	public static void setup() throws Exception{
		AUT_run.setUp();
		p = new Perspectives();
		v = new Views();

	}

	@Test()
	public void suite_visit_all_views() throws Exception{
		p.initialSetup();
		v.visit_all_views();
	}

	@AfterClass
	public static void teardown() throws Exception{
		Utils.dbg_msg("SuiteVisitAllViews.teardown"); //$NON-NLS-1$
		AUT_run.tearDown();
	}
}
