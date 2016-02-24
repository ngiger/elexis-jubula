package ch.ngiger.jubula.helpers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Hashtable;
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
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;

public class AUT_run {
	/** the AUT-Agent */
	private static AgentThread agent_thread = null;
	public static AUTAgent m_agent;
	/** the logger */
	// private static Logger log = LoggerFactory.getLogger(AUT_run.class);
	public static final String AUT_ID = "elexis_3_1"; //$NON-NLS-1$

	/**
	 * The AUT for the supported Role: doctor
	 */
	public static AUT doctor = null;

	/**
	 * The AUT for the supported Role: assistant.
	 * It is not yet use, but will be needed to test whether
	 * Changes by the assistant affect the view of the doctor.
	 */
	public static AUT mpa = null;


	static AUT m_aut;

	/**
	 * Elexis is always started with the same parameters.
	 */
	public static Application elexis = null;
	public static Map<String, String> config = new Hashtable<String, String>();
	public static final String USER_DIR = System.getProperty("user.dir");
	public static final Locale Keyboard_Locale = Locale.GERMANY;// Locale.US;
	private static AUTIdentifier aut_id = null;
	private static AUTConfiguration aut_config = null;
	private static java.nio.file.Path ElexisLog =
		Paths.get(System.getProperty("user.home") + "/elexis/logs/elexis-3.log");
	public static boolean isMedelexis = false;

	private static void setupConfig(){
		config.put(Constants.AGENT_HOST, "localhost");
		config.put(Constants.AGENT_PORT, "6333");
		config.put(Constants.WORK_DIR, USER_DIR);
		Path elexis3 = Paths.get(USER_DIR + "/../work/Elexis3");
		Path medelexis3 = Paths.get(USER_DIR + "/../work/Medelexis");
		if (elexis3.toFile().canExecute()) {
			config.put(Constants.AUT_EXE, elexis3.toAbsolutePath().normalize().toString());
		} else {
			if (medelexis3.toFile().canExecute()) {
				isMedelexis = true;
				config.put(Constants.AUT_EXE, medelexis3.toAbsolutePath().normalize().toString());
			} else {
				Utils.dbg_msg(
					"Could not find an executable Elexis3  " + elexis3.toAbsolutePath().toString()
						+ " nor " + medelexis3.toAbsolutePath().toString());
			}
		}
		config.put(Constants.AUT_LOCALE, "de_DE");
		config.put(Constants.AUT_ID, "elexis");
		config.put(Constants.AUT_PROGRAM_ARGS,
			"-Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=8000");
		// with the following String I started on wheezy
		// ./Medelexis -eclipse.password ~/.medelexis.dummy.password -clean -debug -consoleLog -vmargs -Delexis-run-mode=RunFromScratch -Dch.elexis.username=007 -Dch.elexis.password=topsecret
		config.put(Constants.AUT_VM_ARGS,
			"-nl " + config.get(Constants.AUT_LOCALE)
				+ " -clean -vmargs -Declipse.p2.unsignedPolicy=allow" + " -Dautagent_port="
				+ config.get(Constants.AGENT_PORT) + " -Dautagent_host="
				+ config.get(Constants.AGENT_HOST)
				+ " -Dch.elexis.username=007 -Dch.elexis.password=topsecret "
				+ " -Delexis-run-mode=RunFromScratch");
		if (isMedelexis) {
			String variant = System.getenv("VARIANT");
			if (variant == null) {
				variant = "snapshot";
			}
			config.put(Constants.AUT_VM_ARGS,
				"-eclipse.password ~/.medelexis.dummy.password " + config.get(Constants.AUT_VM_ARGS)
					+ " -Dprovisioning.UpdateRepository=" + variant);
		}

		config.put(Constants.AUT_KEYBOARD, "de_DE");
		for (Map.Entry<String, String> entry : config.entrySet()) {
			String from_env = System.getenv(entry.getKey());
			if (from_env != null) {
				config.put(entry.getKey(), from_env);
				Utils.dbg_msg("Config : from env " + from_env + " for " + entry.getKey() + " is: "
					+ entry.getValue());
			}
			String value = System.getProperty(entry.getKey());
			if (value != null) {
				Utils.dbg_msg("Config : from property " + value + " for " + entry.getKey() + " is: "
					+ entry.getValue());
				config.put(entry.getKey(), value);
			}
			Utils.dbg_msg("Config : " + entry.getKey() + " is: " + entry.getValue());
		}
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
				Assert.assertTrue(rPath.toFile().canExecute());
				Utils.run_system_cmd(new String[] {
					rPath.toString(), "-vm", "/usr/bin/java", "-l", "-p",
					config.get(Constants.AGENT_PORT)
				});
				Utils.dbg_msg("Autagent finished");
			}
		}
	}

	private static void startAutagent(){
		Utils.dbg_msg("Calling startAutagent ");
		agent_thread = new AgentThread();
		agent_thread.start();
	}

	private static void startAUT(){
		try {
			int j = 0;
			while (j< 10 && ! m_agent.isConnected())
			{
				Utils.dbg_msg("Calling startAUT "+ j + " isConnected " + m_agent.isConnected());
				Utils.sleep1second();
				j++;
			}
			Utils.sleep1second();
			aut_id = m_agent.startAUT(aut_config);
			Utils.dbg_msg("Calling startAUT returned " + aut_id);
			if (aut_id != null) {
				Utils.dbg_msg("started AUT as " + aut_id.getID() + " will sleep 2 seconds");
				m_aut = m_agent.getAUT(aut_id, SwtComponents.getToolkitInformation());
				Utils.dbg_msg("AUT will connect");
				m_aut.connect();
				Utils.dbg_msg("AUT connected");
			} else {
				Assert.fail("AUT did not start as expected? Why"); //$NON-NLS-1$
			}
			Utils.dbg_msg("AUT activate via titlebar");
			m_aut.execute(elexis.activate(AUTActivationMethod.titlebar), null);
			Utils.dbg_msg("AUT created and activated");
		} catch (ActionException | CommunicationException e) {
			Utils.dbg_msg("Action Exception startAUT reason: " + e.getMessage()); //$NON-NLS-1$
			Utils.takeScreenshot("start_aut_failed.png");
			Assert.fail("unable to start AUT"); //$NON-NLS-1$
		}

	}

	@BeforeClass
	public static void setUp() throws Exception{
		Utils.setupResultDir();
		setupConfig();
		try {
			java.nio.file.Files.delete(ElexisLog);
			Utils.dbg_msg("Deleted old " + ElexisLog.toAbsolutePath());
		} catch (IOException e) {
			Utils.dbg_msg("Did not delete " + ElexisLog.toAbsolutePath());
		}

		/* Connecting to external Jubula AUT Agent which
		   must be started manually BEFORE test execution! */
		String msg = "AUT_run.setup port : " + Constants.AGENT_PORT + " is: "
			+ config.get(Constants.AGENT_PORT) + " env: "
			+ System.getenv().get(Constants.AGENT_PORT) + " property: "
			+ System.getProperty(Constants.AGENT_PORT);
		Utils.dbg_msg(msg);
		startAutagent();
		Utils.sleepMs(Constants.ONE_SECOND * 5); // Give it some time to start up
		Utils.dbg_msg("after sleep: connect to " + config.get(Constants.AGENT_HOST) + " port "
			+ config.get(Constants.AGENT_PORT));
		m_agent = MakeR.createAUTAgent(config.get(Constants.AGENT_HOST),
			new Integer(config.get(Constants.AGENT_PORT)));
		m_agent.connect();
		String[] args = {
			config.get(Constants.AUT_VM_ARGS)
		};
		Utils.dbg_msg("Start AUT: arg " + args[0] + "\n   exe: " + config.get(Constants.AUT_EXE)
			+ "\n  workdir:" + config.get(Constants.WORK_DIR) + "\n  AUT_ID: "
			+ config.get(Constants.AUT_ID));
		if (!(new File(config.get(Constants.AUT_EXE))).canExecute()) {
			Assert.fail("EXE File " + config.get(Constants.AUT_EXE)
				+ " does not exist or cannot be executed");
		}
		System.out.println("Language is " + config.get(Constants.AUT_LOCALE));
		System.out.println("Keyboard Layout is " + config.get(Constants.AUT_KEYBOARD));
		System.out.println("Default is " + Locale.getDefault());
		System.out.println("German is " + Locale.GERMANY + " " + Locale.GERMAN);
		System.out.println("Swiss_German is " + Locale.forLanguageTag("de_CH"));
		System.out.println("Keyboard_Locale: " + Keyboard_Locale.toString());
		aut_config = new RCPAUTConfiguration("ch.elexis.core.application", //$NON-NLS-1$
			config.get(Constants.AUT_ID), config.get(Constants.AUT_EXE),
			config.get(Constants.WORK_DIR), args, Locale.US);
		Utils.dbg_msg("Got aut_config as " + aut_config.getLaunchInformation());
		Thread.sleep(1000);
		Utils.dbg_msg("AUT createApplication");
		elexis = SwtComponents.createApplication();
		startAUT();
	}

	/** cleanup */
	@AfterClass
	public static void tearDown() throws Exception{
		Utils.dbg_msg("AUT_run.tearDown ");
		Utils.writer.close();
		if (m_aut != null && m_aut.isConnected()) {
			m_aut.disconnect();
			m_agent.stopAUT(m_aut.getIdentifier());
		}
		if (m_agent != null && m_agent.isConnected()) {
			m_agent.disconnect();
		}
		if (agent_thread != null) {
			Utils.dbg_msg("Stopping agent_thread");
			agent_thread.interrupt();
			// agent_thread.stop();
			Utils.dbg_msg("Stopped agent_thread");
		}
		saveLogs();
	}

	private static void saveLogs(){
		java.nio.file.Path newdir = Paths.get(Utils.SAVE_RESULTS_DIR, "elexis-3.log");
		try {
			java.nio.file.Files.copy(ElexisLog, newdir);
		} catch (IOException e) {
			// Just ignore this error, probably we had no elexis log
		}
	}

	public static void restartApp(){
		Utils.dbg_msg("AUT_run.restartApp without disconnetc ");
		m_agent.stopAUT(aut_id);
		Utils.dbg_msg("AUT_run.stoppedAUT ");
		Utils.sleep1second();
		/*
		m_agent.disconnect();
		dbg_msg("m_agent.disconnected ");
		m_agent.connect();
		Utils.sleep1second();
		dbg_msg("m_agent.connected ");
		*/
		startAUT();
	}

}
