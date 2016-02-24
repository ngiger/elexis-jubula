package ch.ngiger.jubula.testsuites;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;

import org.eclipse.jubula.client.exceptions.CheckFailedException;
import org.eclipse.jubula.toolkit.enums.ValueSets.AUTActivationMethod;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Artikelstamm;
import ch.ngiger.jubula.helpers.Common;
import ch.ngiger.jubula.helpers.Eigenleistung;
import ch.ngiger.jubula.helpers.Invoice;
import ch.ngiger.jubula.helpers.Patients;
import ch.ngiger.jubula.helpers.Perspectives;
import ch.ngiger.jubula.helpers.Software;
import ch.ngiger.jubula.helpers.Utils;
import ch.ngiger.jubula.helpers.Views;

public class Screenshot {

	/** test generating a snapshot of the currently active window */
	private static Common runner = new Common(AUT_run.doctor, AUT_run.elexis);

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
			runner.execute(application.activate(AUTActivationMethod.titlebar), null);
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
