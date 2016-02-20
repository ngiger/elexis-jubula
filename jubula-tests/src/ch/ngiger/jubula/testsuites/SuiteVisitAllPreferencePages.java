package ch.ngiger.jubula.testsuites;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Common;
import ch.ngiger.jubula.helpers.PreferencePages;

public class SuiteVisitAllPreferencePages {
	/** test generating a snapshot of the currently active window */
	
	@BeforeClass
	public static void setup() throws Exception{
		AUT_run.setUp();
	}
	
	@Test()
	public void suite_visit_all_preferencePages() throws Exception{
		Common.initialWorkWithRunFromScatch();
		PreferencePages all = new PreferencePages();
		all.visit_all_preferencePages();
	}
	
	@AfterClass
	public static void teardown() throws Exception{
		AUT_run.tearDown();
	}
}
