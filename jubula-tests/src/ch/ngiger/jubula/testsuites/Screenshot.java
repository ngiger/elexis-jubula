package ch.ngiger.jubula.testsuites;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;

import org.eclipse.jubula.client.exceptions.CheckFailedException;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Common;
import ch.ngiger.jubula.helpers.Utils;

public class Screenshot extends Common {

	/** test generating a snapshot of the currently active window */

	@BeforeClass
	public static void setup() throws Exception {
		AUT_run.setUp();
		Utils.dbg_msg("setup done");
	}

	@Test()
	public void screenshot_active_window() throws Exception{
		Utils.dbg_msg("screenshot_active_window");
		try {
			org.eclipse.jubula.toolkit.concrete.components.Application application =
				SwtComponents.createApplication();
			Thread.sleep(1000); // Don't know why this is needed!
			String image_name = "subdir/take_screenshot_active_window.png";
			Path shot_2 = new File(Utils.SAVE_RESULTS_DIR + "/" + image_name).toPath();
			Files.deleteIfExists(shot_2);
			Assert.assertFalse(Files.exists(shot_2, LinkOption.NOFOLLOW_LINKS));
			Utils.takeScreenshotActiveWindow(image_name);
			// If you use a logger here, running via mvn will block before
			// running this test. Don't know why
			Utils.dbg_msg("screenshot_active_window " + shot_2.toString()+" is "+ Files.exists(shot_2, LinkOption.NOFOLLOW_LINKS));
			Assert.assertTrue(Files.exists(shot_2, LinkOption.NOFOLLOW_LINKS));
		} catch (CheckFailedException e) {
			e.printStackTrace();

		} finally {
			Assert.assertTrue(true);
		}
		Utils.dbg_msg("screenshot_active_window done");
	}

	@AfterClass
	public static void teardown() throws Exception{
		Utils.dbg_msg("Screenshot.teardown"); //$NON-NLS-1$
		AUT_run.tearDown();
	}
}
