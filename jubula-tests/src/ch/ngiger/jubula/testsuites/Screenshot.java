package ch.ngiger.jubula.testsuites;

import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Utils;

public class Screenshot {

	/** test generating a snapshot of the currently active window */

	@BeforeClass
	public static void setup() throws Exception {
		AUT_run.setUp();
		Utils.dbg_msg("setup done");
	}

	@Test()
	public void screenshot_active_window() throws Exception{
		Utils.dbg_msg("screenshot_active_window");
		AUT_run.takeScreenshotActiveWindow("first_screenshot.png");
		Assert.assertTrue(true);
		Utils.dbg_msg("screenshot_active_window done");
	}

	@AfterClass
	public static void teardown() throws Exception{
		Utils.dbg_msg("Screenshot.teardown"); //$NON-NLS-1$
		AUT_run.tearDown();
	}
}
