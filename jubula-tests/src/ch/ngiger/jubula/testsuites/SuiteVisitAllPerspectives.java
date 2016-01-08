package ch.ngiger.jubula.testsuites;

import org.eclipse.jubula.toolkit.enums.ValueSets.AUTActivationMethod;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Perspectives;
import ch.ngiger.jubula.helpers.Software;

public class SuiteVisitAllPerspectives {

	/** test generating a snapshot of all perspectives */

	@BeforeClass
	public static void setup() throws Exception {
		AUT_run.setUp();
	}

	@Test()
	public void suite_visit_all_perspectives() throws Exception{
		Software.installAllFeatures();
		// We must open Leistungen first, as this take a lot of time
		Perspectives.openLeistungenPerspective();
		Perspectives all = new Perspectives();
		org.eclipse.jubula.toolkit.concrete.components.Application application =
				SwtComponents.createApplication();
			Thread.sleep(1000); // Don't know why this is needed!
			AUT_run.m_aut.execute(application.activate(AUTActivationMethod.titlebar), null);
		all.visit_all_perspectives();
	}

	@AfterClass
	public static void teardown() throws Exception{
		AUT_run.dbg_msg("SuiteVisitAllPerspectives.teardown"); //$NON-NLS-1$
		AUT_run.tearDown();
	}
}
