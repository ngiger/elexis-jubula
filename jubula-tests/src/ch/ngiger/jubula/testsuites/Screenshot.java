package ch.ngiger.jubula.testsuites;

import org.eclipse.jubula.client.AUT;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Utils;

public class Screenshot {

	/** test generating a snapshot of the currently active window */

	private static AUT m_aut;

	@BeforeClass
	public static void setup() throws Exception {
		AUT_run.setUp();
		Utils.dbg_msg("setup done");
	}

	@Test()
	public void screenshot_active_window() throws Exception{
		m_aut = AUT_run.startAUT();
		Utils.dbg_msg("screenshot_active_window");
		AUT_run.takeScreenshotActiveWindow(AUT_run.m_aut, AUT_run.app, "first_screenshot.png");
		Assert.assertTrue(true);
		Utils.dbg_msg("screenshot_active_window done");
		AUT_run.stopAut(m_aut);
	}

	@AfterClass
	public static void teardown() throws Exception{
		Utils.dbg_msg("Screenshot.teardown"); //$NON-NLS-1$
		AUT_run.tearDown();
	}
}
