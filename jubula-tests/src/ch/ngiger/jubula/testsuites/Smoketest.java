package ch.ngiger.jubula.testsuites;

import org.eclipse.jubula.toolkit.enums.ValueSets.AUTActivationMethod;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Common;
import ch.ngiger.jubula.helpers.Patients;

public class Smoketest {
	/** test generating a snapshot of the currently active window */

	/** the logger */
	private static Logger log = LoggerFactory.getLogger(Smoketest.class);

	static private AUT_run runner = null;

	@BeforeClass
	public static void setup() throws Exception{
		runner = new AUT_run();
		AUT_run.setUp();
		log.info("setup done"); //$NON-NLS-1$
	}

	@Test()
	public void smoketest() throws Exception{
		Common.synchronizedTextReplace("Patienten_SelectName_grc", "Smoketest");//$NON-NLS-1$
		// Das nächste läuft schief!!
		// Common.synchronizedTextReplace("Patienten_SelectName_grc", "äöüèéç/<>$?=*%&(){},.-;:_$£][~");//$NON-NLS-1$

		Patients all = new Patients();
		org.eclipse.jubula.toolkit.concrete.components.Application application =
			SwtComponents.createApplication();
		Thread.sleep(1000); // Don't know why this is needed!
		AUT_run.m_aut.execute(application.activate(AUTActivationMethod.titlebar), null);
		all.createPatient("Testperson", "ArmesWesen", "31.01.1990");
	}

	@AfterClass
	public static void teardown() throws Exception{
		log.info("teardown"); //$NON-NLS-1$
		runner.tearDown();
	}
}
