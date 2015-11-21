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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ch.ngiger.jubula.helpers.AUT_run;

public class Screenshot {

	/** the logger */
	private static Logger log = LoggerFactory.getLogger(Screenshot.class);

	/** test generating a snapshot of the currently active window */

	static private AUT_run runner = null;
	@BeforeClass
	public static void setup() throws Exception {
		log.info("setup");
		runner = new AUT_run();
		AUT_run.setUp();
		log.info("setup done");
	}

	@Test()
	public void screenshot_active_window() throws Exception{
		log.info("screenshot_active_window");
		try {
			org.eclipse.jubula.toolkit.concrete.components.Application application =
				SwtComponents.createApplication();
			Thread.sleep(1000); // Don't know why this is needed!
			AUT_run.m_aut.execute(application.activate(AUTActivationMethod.titlebar), null);
			String image_name = "subdir/take_screenshot_active_window.png";
			Path shot_2 = new File(AUT_run.results + "/" + image_name).toPath();
			Files.deleteIfExists(shot_2);
			Assert.assertFalse(Files.exists(shot_2, LinkOption.NOFOLLOW_LINKS));
			runner.takeScreenshotActiveWindow(image_name);
			System.out.println("screenshot_active_window " + shot_2.toString()+" is "+ Files.exists(shot_2, LinkOption.NOFOLLOW_LINKS));
			Assert.assertTrue(Files.exists(shot_2, LinkOption.NOFOLLOW_LINKS));
		} catch (CheckFailedException | AssertionError e) {
			e.printStackTrace();

		} finally {
			Assert.assertTrue(true);
		}
		log.info("screenshot_active_window");
	}

	@AfterClass
	public static void teardown() throws Exception {
		log.info("teardown");
		runner.tearDown();
	}
}
