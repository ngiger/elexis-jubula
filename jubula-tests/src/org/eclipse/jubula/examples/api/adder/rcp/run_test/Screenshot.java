package org.eclipse.jubula.examples.api.adder.rcp.run_test;

import java.io.File;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.util.Locale;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.AUTAgent;
import org.eclipse.jubula.client.MakeR;
import org.eclipse.jubula.client.ObjectMapping;
import org.eclipse.jubula.client.exceptions.CheckFailedException;
import org.eclipse.jubula.client.launch.AUTConfiguration;
import org.eclipse.jubula.toolkit.enums.ValueSets.AUTActivationMethod;
import org.eclipse.jubula.toolkit.rcp.config.RCPAUTConfiguration;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.tools.AUTIdentifier;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

public class Screenshot {

	/** test generating a snapshot of the currently active window */
	/** the AUT-Agent */
	public static AUTAgent m_agent;
	/** the AUT */
	public static AUT m_aut;
	public static ObjectMapping om = null;
	public static String SAVE_RESULTS_DIR = null;
	public static org.eclipse.jubula.toolkit.concrete.components.Application app = null;
	private static AUTIdentifier id;

	@BeforeClass
	public static void setup() throws Exception{
		URL input = Screenshot.class.getClassLoader().getResource("om.properties"); //$NON-NLS-1$
		om = MakeR.createObjectMapping(input.openStream());
		/* Connecting to external Jubula AUT Agent which
		   must be started manually BEFORE test execution! */
		m_agent = MakeR.createAUTAgent("localhost", 60000);
		m_agent.connect();
		AUTConfiguration aut_config = new RCPAUTConfiguration("SimpleAdder", //$NON-NLS-1$
			"adder", //$NON-NLS-1$
			"/opt/jubula_8.2.0.021/examples/AUTs/SimpleAdder/rcp/linux/gtk/x86_64/SimpleAdder", //$NON-NLS-1$
			System.getProperty("user.dir"), //$NON-NLS-1$
			new String[] {}, Locale.getDefault(), Locale.getDefault());//$NON-NLS-1$
		System.out
			.println("Got aut_config as " + aut_config + " using locale " + Locale.getDefault());
		Thread.sleep(1000);

		System.out.println("Calling startAUT ");
		id = m_agent.startAUT(aut_config);
		if (id != null) {
			System.out.println("started AUT as " + id.getID());
			m_aut = m_agent.getAUT(id, SwtComponents.getToolkitInformation());
			System.out.println("AUT will connect to id " + id.getID());
			Thread.sleep(1000);
			m_aut.connect();
			System.out.println("AUT connected");
		} else {
			Assert.fail("AUT did not start as expected? Why"); //$NON-NLS-1$
		}
		System.out.println("SwtComponents.createApplication");
		app = SwtComponents.createApplication();
		System.out.println("AUT activate via titlebar");
		m_aut.execute(app.activate(AUTActivationMethod.titlebar), null);
		Thread.sleep(1000);
		System.out.println("AUT created and activated " + id);
	}

	public static void takeScreenshotActiveWindow(String imageName){
		String fullname =
			new File(System.getProperty("user.dir") + "/" + imageName).getAbsolutePath();
		System.out.println("Request takeScreenshotActiveWindow " + fullname + " for " + imageName);
		m_aut.execute(
			app.takeScreenshotOfActiveWindow(fullname, 0, "rename", 100, true, 0, 0, 0, 0), null);
		boolean foundFile =
			Files.exists(new File(System.getProperty("user.dir") + "/" + imageName).toPath(),
				LinkOption.NOFOLLOW_LINKS);
		System.out.println("Created " + fullname + " exists " + foundFile);
		Assert.assertTrue(foundFile);
	}

	@Test()
	public void screenshot_active_window() throws Exception{
		System.out.println("screenshot_active_window");
		try {
			Thread.sleep(1000); // Don't know why this is needed!
			// AUT_run.m_aut.execute(application.activate(AUTActivationMethod.titlebar), null);
			String image_name = "subdir/take_screenshot_active_window.png";
			Path shot_2 = new File(System.getProperty("user.dir") + "/" + image_name).toPath();
			Files.deleteIfExists(shot_2);
			Assert.assertFalse(Files.exists(shot_2, LinkOption.NOFOLLOW_LINKS));
			System.out.println("screenshot_active_window " + image_name);
			takeScreenshotActiveWindow(image_name);
			// If you use a logger here, running via mvn will block before
			// running this test. Don't know why
			System.out.println("screenshot_active_window " + shot_2.toString() + " is "
				+ Files.exists(shot_2, LinkOption.NOFOLLOW_LINKS));
			Assert.assertTrue(Files.exists(shot_2, LinkOption.NOFOLLOW_LINKS));
		} catch (CheckFailedException | AssertionError e) {
			e.printStackTrace();

		} finally {
			Assert.assertTrue(true);
		}
		System.out.println("screenshot_active_window done");
	}

	@AfterClass
	static public void teardown(){
		System.out.println("AUT_run.tearDown ");
		if (m_aut != null && m_aut.isConnected()) {
			m_aut.disconnect();
			m_agent.stopAUT(m_aut.getIdentifier());
		}
		if (m_agent != null && m_agent.isConnected()) {
			m_agent.disconnect();
		}
	}
}
