package ch.ngiger.jubula.helpers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Hashtable;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.commons.lang.SystemUtils;
import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.AUTAgent;
import org.eclipse.jubula.client.MakeR;
import org.eclipse.jubula.client.exceptions.ActionException;
import org.eclipse.jubula.client.exceptions.CommunicationException;
import org.eclipse.jubula.client.launch.AUTConfiguration;
import org.eclipse.jubula.toolkit.concrete.components.Application;
import org.eclipse.jubula.toolkit.enums.ValueSets.AUTActivationMethod;
import org.eclipse.jubula.toolkit.rcp.config.RCPAUTConfiguration;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.tools.AUTIdentifier;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

public class AUT_run {
	/** the AUT-Agent */
	private static AgentThread agent_thread = null;
	public static AUTAgent m_agent;
	/** the AUT */
	public static AUT m_aut;
	public static String SAVE_RESULTS_DIR = null;
	public static Application app = null;

	/** the logger */
	// private static Logger log = LoggerFactory.getLogger(AUT_run.class);
	public static final String AUT_ID = "elexis_3_1"; //$NON-NLS-1$
	public static Map<String, String> config = new Hashtable<>();
	public static final String USER_DIR = System.getProperty("user.dir");
	public static final Locale Keyboard_Locale = Locale.GERMANY;// Locale.US;
	private static AUTConfiguration aut_config = null;
	private static java.nio.file.Path ElexisLog =
		Paths.get(System.getProperty("user.home") + "/elexis/logs/elexis-3.log");
	public static boolean isMedelexis = false;
	private static String agent_port = "6333"; // Default
	private static final String console_port = "8752";
	private static boolean stopping_autagent = false;
	private static boolean starting_autagent = false;
	private static Path exe_file;
	private static boolean setup_done = false;

	/**
	 * * Setups all the config constant for Elexis or Medelexis.
	 *
	 * * Checks whether they are overridden via properties or environment variables
	 *
	 * * Calculate load/dump commands for selecte database
	 *
	 */
	private static void setupConfig(){
		config.put(Constants.DB_CONNECTION, "h2");
		config.put(Constants.DB_LOAD_SCRIPT, "");
		config.put(Constants.WORK_DIR, USER_DIR);
		config.put(Constants.AGENT_HOST, "localhost");
		if  (System.getenv("agent_port") != null) {
			agent_port =  System.getenv("agent_port");
		}
		config.put(Constants.AGENT_PORT, agent_port);
		config.put(Constants.AUT_VM_ARGS, ""); //	"-Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=8000");
		Path elexis3 = Paths.get(USER_DIR + "/../work/Elexis3");
		Path medelexis3 = null;
		if (elexis3.toFile().canExecute()) {
			// config.put(Constants.AUT_EXE, elexis3.toAbsolutePath().normalize().toString());
			config.put(Constants.AUT_EXE, elexis3.toAbsolutePath().normalize().toString());
			config.put(Constants.AUT_ARGS,	"");
			exe_file = elexis3;
		} else {
			String variant = System.getenv("VARIANT");
			if (variant == null || variant.equals("")) { variant = "snapshot"; }
			medelexis3 = Paths.get(USER_DIR + "/../work/Medelexis").toAbsolutePath();
			exe_file = medelexis3;
			if (!medelexis3.toFile().canExecute())
			{
			  	String msg = "Could neither find Elexis3 nor Medelexis executable. Check config";
			  	Utils.dbg_msg(msg);
			  	Assert.fail(msg);
			}
			isMedelexis = true;
			config.put(Constants.AUT_ARGS,	" -eclipse.password ~/.medelexis.dummy.password ");
			config.put(Constants.AUT_VM_ARGS, " -Dprovisioning.UpdateRepository=" + variant + " ");
	    	Path prefs_dir = Paths.get(USER_DIR + "/../work/configuration/.settings");
	    	Path prefs = Paths.get(prefs_dir + "/MedelexisDesk.prefs");
			try {
				Utils.dbg_msg("setupConfig: prefs are " +prefs);
				if (!Files.isDirectory(prefs_dir, LinkOption.NOFOLLOW_LINKS))
		    	{
		    		Files.createDirectory(prefs_dir);
		    	}
				List<String> lines = Arrays.asList(new String[] {
					"eclipse.preferences.version=1",
					"usageConditionAcceptanceDate=" + LocalDateTime.now().toString(),
					"usageConditionAccepted=true"
				});
				Files.write(prefs, lines);
				Utils.dbg_msg("setupConfig created " + prefs.toAbsolutePath());
			} catch (IOException e) {
				Utils.dbg_msg("setupConfig: failed to create " + prefs);
			}

	    	Path source  = Paths.get(System.getProperty("user.home") + "/medelexis_jubula_license.xml");
		    try {
		    	Path elexis_dir = Paths.get(System.getProperty("user.home") + "/elexis");
		    	Path license = Paths.get(elexis_dir + "/license.xml");
		    	if (!Files.isDirectory(elexis_dir, LinkOption.NOFOLLOW_LINKS))
		    	{
		    		Files.createDirectory(elexis_dir);
		    	}
		    	if (!Files.isReadable(license))
		    	{
		    		Files.copy(source, license);
		    	}
				Utils.dbg_msg("setupConfig: "+license + " file is present");
			} catch (IOException e) {
				String msg = "setupConfig: Could not create elexis/license.xml. Missing? " + source;
				Utils.dbg_msg(msg);
				Assert.fail(msg);
			}
			config.put(Constants.AUT_EXE, medelexis3.toString());
			// Utils.install_sw_medelexis(medelexis3, variant, Utils.SAVE_RESULTS_DIR.toString());
		}

		config.put(Constants.AUT_RUN_FROM_SCRATCH, "");
		config.put(Constants.AUT_LOCALE, "de_DE");
		config.put(Constants.AUT_ID, "elexis");
		// with the following String I started on wheezy
		// ./Medelexis -eclipse.password ~/.medelexis.dummy.password -clean
		// -debug -consoleLog -vmargs -Delexis-run-mode=RunFromScratch
		// -Dch.elexis.username=007 -Dch.elexis.password=topsecret
		Utils.dbg_msg(config.get(Constants.AUT_VM_ARGS));
		// TODO: For elexis in docker must pass -vm /usr/bin/java
		config.put(Constants.AUT_ARGS, "-clean -console " + console_port + " -nl " + config.get(Constants.AUT_LOCALE)
			+ config.get(Constants.AUT_ARGS) + " -consoleLog -debug dropins/.options ");
		config.put(Constants.AUT_VM_ARGS, " -Declipse.p2.unsignedPolicy=allow" + " -Dautagent_port="
				+ config.get(Constants.AGENT_PORT) + " -Dautagent_host="
				+ config.get(Constants.AGENT_HOST)
				+ " -Dorg.eclipse.equinox.p2.reconciler.dropins.directory=dropins/ "
				+ config.get(Constants.AUT_VM_ARGS)); //  osgi.locking=none
		config.put(Constants.AUT_KEYBOARD, "de_DE");
		overrideConfigWithEnvAndProperties();
		AUT_db.checkAndLoadDatabase(config);
		Runtime.getRuntime().addShutdownHook(new Thread() {
		    @Override
			public void run() {
		    	// at this point we cannot take any screenshot, as the
		    	// communication with the Jubula Agent is already stopped
				Utils.dbg_msg("ShutdownElexis began");
				try {
					tearDown();
				} catch (Exception e) {
					Utils.dbg_msg("ShutdownElexis Exception " + e.getMessage());
				}
				// The next lines does not appear in the log file!
				Utils.dbg_msg("ShutdownElexis finished");

		    }
		});
		dumpConfig("setupConfig finished");
	}

	private static void overrideConfigWithEnvAndProperties(){
		for (Map.Entry<String, String> entry : config.entrySet()) {
			String from_env = System.getenv(entry.getKey());
			if (from_env != null) {
				config.put(entry.getKey(), from_env);
				Utils.dbg_msg("Config : override from env " + from_env + " for " + entry.getKey()
					+ " was: " + entry.getValue());
			}
			String value = System.getProperty(entry.getKey());
			if (value != null) {
				Utils.dbg_msg("Config : override from property for " + entry.getKey() + " was: "
					+ entry.getValue() + " set now to " + value);
				config.put(entry.getKey(), value);
			}
		}
	}

	private static void dumpConfig(String info){
		Utils.dbg_msg(info);
		for (Map.Entry<String, String> entry : config.entrySet()) {
			Utils.dbg_msg("Config: " + entry.getKey() + " => " + entry.getValue());
		}
		Utils.getWriter().flush();
	}

	public static class AgentThread extends Thread {

		@Override
		public void run(){
			Utils.dbg_msg("In AgentThread run");
			if (!(SystemUtils.IS_OS_LINUX && System.getProperty("os.arch").equals("amd64"))) {
				String name = System.getProperty("os.name");
				String version = System.getProperty("os.version");
				String arch = System.getProperty("os.arch");
				String msg = "Unsupported os" + name + " version" + version + " " + arch;
				Utils.dbg_msg(msg);
				System.exit(1);
			} else {
				java.nio.file.Path rPath = Paths
					.get(
						"../org.eclipse.jubula.product.autagent.start/target/products/org.eclipse.jubula.product.autagent.start/linux/gtk/x86_64/autagent")
					.toAbsolutePath().normalize();
				String msg =
					"autagent " + rPath.toFile().canExecute() + " " + rPath.toAbsolutePath();
				Utils.dbg_msg(msg);
				if (!rPath.toFile().canExecute()){
					Utils.dbg_msg(rPath + " is not executable");
				}
				Assert.assertTrue(rPath.toFile().canExecute());
				Utils.run_system_cmd(rPath.toString() + " -vm /usr/bin/java -v -l -p "
					+ config.get(Constants.AGENT_PORT) + " ", "start_autagent");
				if (!stopping_autagent & !starting_autagent) {
					Utils.dbg_msg("Premature stop of autagent. Why?");
					// Assert.fail("Premature stop of autagent");
				}
				Utils.dbg_msg("Autagent finished");
			}
		}
	}

	private static void startAutagent(){
		Utils.dbg_msg("Calling startAutagent ");
		agent_thread = new AgentThread();
		agent_thread.start();
	}

	public static void activate(AUT aut){
		Utils.dbg_msg("Calling activate " + aut);
		aut.execute(app.activate(AUTActivationMethod.autDefault), null);
		Utils.dbg_msg("Calling activate done");
	}

	public static AUT startAUT(){
		if (m_aut != null && m_aut.isConnected()) {
			return m_aut; // Don't restart automatically!!
		}
		/*
		if (isMedelexis){
			jubula_rc_rcp_thread = new StartJubulaRcRcpThread();
			jubula_rc_rcp_thread.start();
		}
		*/
		starting_autagent = true;
		AUTIdentifier aut_id = null;
		AUT new_aut = null;
		Utils.dbg_msg("startAUT: aut_config" +  aut_config + " m_agent.isConnected " + m_agent.isConnected());
		try {
			int j = 0;
			while (j < 120 && !m_agent.isConnected()) {
				Utils.dbg_msg("startAUT: calling startAUT " + j + " m_agent.isConnected " + m_agent.isConnected());
				Utils.sleep1second();
			}
			Utils.sleep1second();
			j = 0;
			while (j < 3) {
				try {
					j++;
					Utils.dbg_msg("try " + j + ": startAUT"); //$NON-NLS-1$
					aut_id = m_agent.startAUT(aut_config);
					Utils.dbg_msg("try " + j + ": startAUT. Got aut_id " + aut_id); //$NON-NLS-1$
					break;
				} catch (ActionException | CommunicationException e) {
					Utils.dbg_msg("startAUT:  failed: " + e.getMessage()); //$NON-NLS-1$
				}
			}
			Utils.dbg_msg("startAUT: Calling startAUT returned " + aut_id);
			if (aut_id != null) {
				Utils.dbg_msg("startAUT: started AUT as " + aut_id.getID());
				new_aut = m_agent.getAUT(aut_id, SwtComponents.getToolkitInformation());
				Utils.dbg_msg("startAUT: AUT will connect");
				new_aut.connect();
				Utils.dbg_msg("startAUT: AUT connected");
			} else {
				Assert.fail("startAUT did not start as expected? Why"); //$NON-NLS-1$
			}
			Utils.dbg_msg("startAUT: activate via titlebar");
			activate(new_aut);

			Utils.dbg_msg("startAUT: AUT created and activated");
		} catch (ActionException | CommunicationException e) {
			Utils.dbg_msg("startAUT: Action Exception startAUT reason: " + e.getMessage()); //$NON-NLS-1$
			takeScreenshot(m_aut, app, "start_aut_failed.png");
			Assert.fail("startAUT: unable to start AUT"); //$NON-NLS-1$

		}
		m_aut = new_aut;
		starting_autagent = false;
		return new_aut;
	}

	@BeforeClass
	public static void setUp() throws Exception{
		if (setup_done) return;
		Utils.setupResultDir();
		try {
			java.nio.file.Files.delete(ElexisLog);
			Utils.dbg_msg("setUp: deleted old " + ElexisLog.toAbsolutePath());
		} catch (IOException e) {
			Utils.dbg_msg("setup: did not delete " + ElexisLog.toAbsolutePath());
		}
		setupConfig();

		/*
		 * Connecting to external Jubula AUT Agent which must be started
		 * manually BEFORE test execution!
		 */
		m_agent = MakeR.createAUTAgent(config.get(Constants.AGENT_HOST),
			new Integer(config.get(Constants.AGENT_PORT)));

		try {
			m_agent.connect();
		} catch (org.eclipse.jubula.client.exceptions.CommunicationException e) {
			Utils.sleep1second(); // Give it some time to start.
			// Needed some times when starting without a running agent
			startAutagent();
			Utils.sleepMs(Constants.ONE_SECOND * 5); // Give it some time to
														// start up
			Utils.dbg_msg("after sleep: connect to " + config.get(Constants.AGENT_HOST) + " port "
				+ config.get(Constants.AGENT_PORT));
			m_agent.connect();
		}
		if (config.get(Constants.AGENT_HOST) == null
			&& !(new File(config.get(Constants.AUT_EXE))).canExecute()) {
			Assert.fail("EXE File " + config.get(Constants.AUT_EXE)
				+ " does not exist or cannot be executed");
		}
		String[] args = {
			config.get(Constants.AUT_ARGS),
			" -vmargs ",
			config.get(Constants.AUT_VM_ARGS),
		};
		String args_as_string = config.get(Constants.AUT_ARGS) +  " -vmargs "+ config.get(Constants.AUT_VM_ARGS);
		Utils.dbg_msg("AUT_ARGS is " + config.get(Constants.AUT_ARGS));
		Utils.dbg_msg("AUT_VM_ARGS is " + config.get(Constants.AUT_VM_ARGS));
		Utils.dbg_msg("AUT_ID is " + config.get(Constants.AUT_ID));
		Utils.dbg_msg("WORK_DIR3 is " + config.get(Constants.WORK_DIR) + " replaced by " + exe_file.getParent().toAbsolutePath().toString());
		Utils.dbg_msg("Default is " + Locale.getDefault());
		Utils.dbg_msg("German is " + Locale.GERMANY + " " + Locale.GERMAN);
		Utils.dbg_msg("Swiss_German is " + Locale.forLanguageTag("de_CH"));
		Utils.dbg_msg("Keyboard_Locale: " + Keyboard_Locale.toString());
		Utils.dbg_msg("cmd: " + config.get(Constants.AUT_EXE) + " " + args_as_string);
		aut_config = new RCPAUTConfiguration("ch.elexis.core.application", //$NON-NLS-1$
			config.get(Constants.AUT_ID), config.get(Constants.AUT_EXE),
			// config.get(Constants.WORK_DIR),
			exe_file.getParent().toString(),
			args, Locale.US);
		Utils.dbg_msg("setup: Got aut_config as " + aut_config.getLaunchInformation());
		Thread.sleep(1000);
		Utils.dbg_msg("setup: createApplication");
		app = SwtComponents.createApplication();
		setup_done = true;
	}

	public static void takeScreenshotActiveWindow(AUT aut, Application app, String imageName){
		if (!aut.isConnected()) {
			Utils.dbg_msg("Request takeScreenshot failed (not connected) for " + imageName);
			return;
		}
		String fullname =
			new File(config.get(Constants.RESULT_DIR) + "/" + imageName).getAbsolutePath();
		Utils.dbg_msg("Request takeScreenshotActiveWindow " + fullname + " for " + imageName);
		try {
			aut.execute(
				app.takeScreenshotOfActiveWindow(fullname, 0, "rename", 100, true, 0, 0, 0, 0),
				null);
		} catch (ActionException e) {
			Utils.dbg_msg("Action Exception " + fullname + " reason: " + e.getMessage());
		}
	}

	public static void takeScreenshot(AUT aut, Application app, String imageName){
		if (aut == null || !aut.isConnected()) {
			Utils.dbg_msg("Request takeScreenshot failed (not connected) for " + imageName);
			return;
		}
		String fullname =
			new File(config.get(Constants.RESULT_DIR) + "/" + imageName).getAbsolutePath();
		Utils.dbg_msg("Request takeScreenshot " + fullname + " for " + imageName);
		try {
			if (aut == null || app == null) {
				Utils.dbg_msg("skip as null for m_aut " + m_aut + " or app " + app);
			} else {

				aut.execute(app.takeScreenshot(fullname, 1000, "rename", 100, true), null);
				boolean foundFile = Files.exists(
					new File(config.get(Constants.RESULT_DIR) + "/" + imageName).toPath(),
					LinkOption.NOFOLLOW_LINKS);
				Utils.dbg_msg("Created " + fullname + " exists " + foundFile);
				Assert.assertTrue(foundFile);
			}
		} catch (ActionException e) {
			Utils.dbg_msg("Action Exception " + fullname + " reason: " + e.getMessage());
			// Assert.fail("Unable to create screenshot " + imageName);
		}
	}

	public static void stopAut(AUT aut){
		stopping_autagent = true;
		Utils.dbg_msg("stopAut " + aut + " isCon " + aut.isConnected());
		if (aut != null && aut.isConnected()) {
			aut.disconnect();
			m_agent.stopAUT(aut.getIdentifier());
		}
		Utils.dbg_msg("stoppedAut " + aut);
	}

	@Test
	/**
	 * Add AUT_run as the last class to your TestSuite. Then the tearDown method will stop Elexis
	 */
	public void dummyUnitTest() {
		Assert.assertTrue("Dummy Test to be able to use the AfterClass Teardown", true);
	}

	/** cleanup */
	public static void tearDown() throws Exception{
		stopping_autagent = true;
		if (m_aut != null) {
			Utils.dbg_msg("AUT_run.tearDown " + m_aut + " isCon " + m_aut.isConnected());
		}
		if (m_aut != null && m_aut.isConnected()) {
			m_agent.stopAUT(m_aut.getIdentifier());
			m_aut.disconnect();
		}

		if (agent_thread != null) {
			Utils.dbg_msg("Stopping agent_thread");
			agent_thread.interrupt();
			// agent_thread.stop();
			Utils.dbg_msg("Stopped agent_thread");
		} else if (m_agent != null && m_agent.isConnected()) {
			m_agent.disconnect();
		}
		AUT_db.dumpDatabase();
		Utils.getWriter().close();
		saveLogs();
	}

	private static void saveLogs(){
		java.nio.file.Path save_to = Paths.get(AUT_run.config.get(Constants.RESULT_DIR));
		try {
			java.nio.file.Files.copy(ElexisLog, save_to);
		} catch (IOException e) {
			// Just ignore this error, probably we had no elexis log
		}
	}

	public static boolean AUT_runs_on_localhost() {
		 return config.get(Constants.AGENT_HOST).equals("localhost");
	}
	public static AUT restartApp(AUT aut){
		Utils.dbg_msg(
			"AUT_run.restartApp " + aut + " aut " + (aut != null ? aut.isConnected() : "null"));
		if (aut != null) {
			m_agent.stopAUT(aut.getIdentifier());
			Utils.dbg_msg("AUT_run.stoppedAUT aut_id is null now? " + aut);
			aut = null;
		}
		Utils.sleep1second();
		return startAUT();
	}

}
