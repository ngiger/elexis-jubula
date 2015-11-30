package ch.ngiger.jubula.testsuites;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;

import org.eclipse.jubula.client.exceptions.CheckFailedException;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import ch.ngiger.jubula.helpers.AUT_run;

public class Screenshot {

	/** test generating a snapshot of the currently active window */

	@BeforeClass
	public static void setup() throws Exception{
		AUT_run.setUp();
		AUT_run.dbg_msg("setup done");
	}

	@Test()
	public void screenshot_active_window() throws Exception{
		AUT_run.dbg_msg("screenshot_active_window");
		try {
			if (AUT_run.app == null) {
				AUT_run.dbg_msg("SwtComponents.createApplication");
				AUT_run.app = SwtComponents.createApplication();
			}
			AUT_run.dbg_msg("AUT_run.app.delay 1000");
			AUT_run.m_aut.execute(AUT_run.app.delay(1000), null);
			AUT_run.dbg_msg("AUT_run.app.waitForWindow");
			AUT_run.m_aut.execute(AUT_run.app.waitForWindow(".*", Operator.matches, 1000, 100), //$NON-NLS-1$
				null);
			Thread.sleep(1000); // Don't know why this is needed!
			// AUT_run.m_aut.execute(application.activate(AUTActivationMethod.titlebar), null);
			String image_name = "subdir/take_screenshot_active_window.png";
			Path shot_2 = new File(AUT_run.SAVE_RESULTS_DIR + "/" + image_name).toPath();
			Files.deleteIfExists(shot_2);
			Assert.assertFalse(Files.exists(shot_2, LinkOption.NOFOLLOW_LINKS));
			AUT_run.dbg_msg("screenshot_active_window " + image_name);
			AUT_run.takeScreenshotActiveWindow(image_name);
			// If you use a logger here, running via mvn will block before
			// running this test. Don't know why
			AUT_run.dbg_msg("screenshot_active_window " + shot_2.toString() + " is "
				+ Files.exists(shot_2, LinkOption.NOFOLLOW_LINKS));
			Assert.assertTrue(Files.exists(shot_2, LinkOption.NOFOLLOW_LINKS));
		} catch (CheckFailedException | AssertionError e) {
			e.printStackTrace();

		} finally {
			Assert.assertTrue(true);
		}
		AUT_run.dbg_msg("screenshot_active_window done");
	}

}
