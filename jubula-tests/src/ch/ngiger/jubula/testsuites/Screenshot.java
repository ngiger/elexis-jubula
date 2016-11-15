package ch.ngiger.jubula.testsuites;

import org.eclipse.jubula.client.AUT;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Utils;
import ch.ngiger.jubula.helpers.Views;

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
		AUT_run.takeScreenshotActiveWindow(m_aut, AUT_run.app, "first_screenshot.png");
		Views views = new Views(m_aut, AUT_run.app);
		Utils.maximizeElexisWindow();

		Assert.assertTrue(true);
		Utils.dbg_msg("screenshot_active_window done");
	}

	@AfterClass
	public static void teardown() throws Exception{
		Utils.dbg_msg("Screenshot.teardown"); //$NON-NLS-1$
		AUT_run.tearDown();
	}
}
