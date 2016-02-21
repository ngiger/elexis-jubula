package ch.ngiger.jubula.testsuites;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Common;
import ch.ngiger.jubula.helpers.Perspectives;

public class SuiteVisitAllPerspectives {

	/** test generating a snapshot of all perspectives */

	@BeforeClass
	public static void setup() throws Exception {
		AUT_run.setUp();
	}

	@Test()
	public void suite_visit_all_perspectives() throws Exception{
		Common.initialWorkWithRunFromScatch();
		Perspectives all = new Perspectives();
		all.visit_all_perspectives();
	}

	@AfterClass
	public static void teardown() throws Exception{
		AUT_run.dbg_msg("SuiteVisitAllPerspectives.teardown"); //$NON-NLS-1$
		AUT_run.tearDown();
	}
}
