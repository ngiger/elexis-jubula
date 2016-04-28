package ch.ngiger.jubula.testsuites;

import org.eclipse.jubula.client.AUT;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Perspectives;
import ch.ngiger.jubula.helpers.PreferencePages;

public class SuiteVisitAllPreferencePages {
	/** test generating a snapshot of the currently active window */

	@BeforeClass
	public static void setup() throws Exception{
		AUT_run.setUp();
	}

	@Test()
	public void suite_visit_all_preferencePages() throws Exception{
		AUT m_aut = AUT_run.startAUT();
		PreferencePages pp = new PreferencePages(AUT_run.m_aut, AUT_run.app);
		Perspectives p = null;
		p = new Perspectives(AUT_run.m_aut, AUT_run.app);
		p.initialSetup();
		pp.visit_all_preferencePages();
		AUT_run.stopAut(m_aut);
	}

	@AfterClass
	public static void teardown() throws Exception{
		AUT_run.tearDown();
	}
}
