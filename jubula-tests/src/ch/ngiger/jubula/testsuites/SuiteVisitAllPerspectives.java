package ch.ngiger.jubula.testsuites;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Perspectives;
import ch.ngiger.jubula.helpers.Utils;

public class SuiteVisitAllPerspectives {

	private static Perspectives p = null;

	/** test generating a snapshot of all perspectives */
	@BeforeClass
	public static void setup() throws Exception {
		AUT_run.setUp();
		p = new Perspectives();
	}

	@Test()
	public void suite_visit_all_perspectives() throws Exception{
		Utils.initialWorkWithRunFromScatch(p);
		p.visit_all_perspectives();
	}

	@AfterClass
	public static void teardown() throws Exception{
		Utils.dbg_msg("SuiteVisitAllPerspectives.teardown"); //$NON-NLS-1$
		AUT_run.tearDown();
	}
}
