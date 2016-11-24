package ch.ngiger.jubula.testsuites;

import org.eclipse.jubula.client.AUT;
import org.junit.Assert;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestWatcher;

import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.AutTestWatcher;
import ch.ngiger.jubula.helpers.Utils;

public class Screenshot {

	@Rule
    public TestWatcher watchman = new AutTestWatcher();

	/** test generating a snapshot of the currently active window */
	@Test()
	public void screenshot_active_window() throws Exception{
		AUT_run.setUp();
		AUT m_aut = AUT_run.startAUT();
		Utils.dbg_msg("screenshot_active_window");
		AUT_run.takeScreenshotActiveWindow(m_aut, AUT_run.app, "first_screenshot.png");
		Utils.maximizeElexisWindow();
		Assert.assertTrue(true);
		Utils.dbg_msg("screenshot_active_window done");
	}
}
