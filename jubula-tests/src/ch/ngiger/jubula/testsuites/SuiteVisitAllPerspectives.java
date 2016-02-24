package ch.ngiger.jubula.testsuites;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Common;
import ch.ngiger.jubula.helpers.Perspectives;
import ch.ngiger.jubula.helpers.Utils;

public class SuiteVisitAllPerspectives {

	private static Perspectives perspectives = null;
	private static Common runner = null;

	/** test generating a snapshot of all perspectives */
	@BeforeClass
	public static void setup() throws Exception {
		AUT_run.setUp();
		perspectives = new Perspectives(AUT_run.doctor, AUT_run.elexis);
		runner = new Common(AUT_run.doctor, AUT_run.elexis);
	}

	@Test()
	public void suite_visit_all_perspectives() throws Exception{
		runner.initialWorkWithRunFromScatch();
		perspectives.visit_all_perspectives();
	}

	@AfterClass
	public static void teardown() throws Exception{
		Utils.dbg_msg("SuiteVisitAllPerspectives.teardown"); //$NON-NLS-1$
		AUT_run.tearDown();
	}
}
