package ch.ngiger.jubula.testsuites;

import org.eclipse.jubula.toolkit.enums.ValueSets.AUTActivationMethod;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.VisitAllPerspectives;

public class SuiteVisitAllPerspectives {
	/** the logger */
	private static Logger log = LoggerFactory.getLogger(Screenshot.class);

	/** test generating a snapshot of all perspectives */

	static private AUT_run runner = null;
	@BeforeClass
	public static void setup() throws Exception {
		log.info("setup");
		runner = new AUT_run();
		AUT_run.setUp();
		log.info("setup done");
	}

	@Test()
	public void suite_visit_all_perspectives() throws Exception{
		VisitAllPerspectives all = new VisitAllPerspectives();
		org.eclipse.jubula.toolkit.concrete.components.Application application =
				SwtComponents.createApplication();
			Thread.sleep(1000); // Don't know why this is needed!
			AUT_run.m_aut.execute(application.activate(AUTActivationMethod.titlebar), null);
		all.visit_all_perspectives(runner);
	}

	@AfterClass
	public static void teardown() throws Exception {
		runner.tearDown();
	}
}
