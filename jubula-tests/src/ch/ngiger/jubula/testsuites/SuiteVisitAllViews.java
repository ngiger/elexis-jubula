package ch.ngiger.jubula.testsuites;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.tools.AUTIdentifier;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Perspectives;
import ch.ngiger.jubula.helpers.Views;

public class SuiteVisitAllViews {
	/** test generating a snapshot of the currently active window */
	private static Perspectives p = null;
	private static Views v = null;
	private static AUTIdentifier aut_id = null;

	@BeforeClass
	public static void setup() throws Exception{
		AUT_run.setUp();

	}
	@Test()
	public void suite_visit_all_views() throws Exception{
		AUT m_aut = AUT_run.startAUT();
		p = new Perspectives(AUT_run.m_aut, AUT_run.app);
		p.initialSetup();
		v = new Views(AUT_run.m_aut, AUT_run.app);
		v.visit_all_views();
		AUT_run.stopAut(m_aut);
	}

	@AfterClass
	public static void teardown() throws Exception{
		AUT_run.tearDown();
	}
}
