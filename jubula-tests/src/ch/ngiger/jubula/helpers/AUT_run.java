package ch.ngiger.jubula.helpers;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.management.ManagementFactory;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Paths;
import java.nio.file.attribute.FileAttribute;
import java.nio.file.attribute.PosixFilePermission;
import java.nio.file.attribute.PosixFilePermissions;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Hashtable;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.SystemUtils;
import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.AUTAgent;
import org.eclipse.jubula.client.MakeR;
import org.eclipse.jubula.client.exceptions.ActionException;
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
	/** the AUT */
	public static AUT m_aut;
	public static String SAVE_RESULTS_DIR = null;

	/** the logger */
	// private static Logger log = LoggerFactory.getLogger(AUT_run.class);
	public static final String AUT_ID = "elexis_3_1"; //$NON-NLS-1$
	public static Application app = null;
	public static Map<String, String> config = new Hashtable<String, String>();
	public static final String USER_DIR = System.getProperty("user.dir");
	public static String RESULT_DIR = null;
	public static final Locale Keyboard_Locale = Locale.GERMANY;// Locale.US;
	public static PrintWriter writer = null;
	private static AUTIdentifier aut_id = null;
	private static AUTConfiguration aut_config = null;
	private static java.nio.file.Path ElexisLog =
		Paths.get(System.getProperty("user.home") + "/elexis/logs/elexis-3.log");

	public static void dbg_msg(String msg){
		String timeStamp =
			new SimpleDateFormat("dd.MM.yyyy HH:mm:ss").format(Calendar.getInstance().getTime());
		// log.info(msg);
		if (writer == null) {
			String log_name = null;
			if (SAVE_RESULTS_DIR != null) {
				log_name = SAVE_RESULTS_DIR + "/AUT_run_"
					+ ManagementFactory.getRuntimeMXBean().getName() + ".log";
			} else {
				log_name = USER_DIR + "/AUT_run.log";
			}
			try {
				writer = new PrintWriter(log_name, "UTF-8");
			} catch (FileNotFoundException | UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			System.out.println("log_name writer is: " + log_name);
		}
		// System.out.println(timeStamp + ": dbg_msg " + msg);
		writer.println(timeStamp + ": " + msg);
		writer.flush();
	}

	public static boolean run_system_cmd(String args[]){
		String s = null;

		try {
			dbg_msg("run_system_cmd: " + StringUtils.join(args, " "));
			Process p = Runtime.getRuntime().exec(args);

			BufferedReader stdInput = new BufferedReader(new InputStreamReader(p.getInputStream()));

			BufferedReader stdError = new BufferedReader(new InputStreamReader(p.getErrorStream()));

			// read the output from the command
			// dbg_msg("Here is the standard output of the command:\n");
			while ((s = stdInput.readLine()) != null) {
				dbg_msg(s);
			}

			// read any errors from the attempted command
			// dbg_msg("Here is the standard error of the command (if any):\n");
			while ((s = stdError.readLine()) != null) {
				dbg_msg(s);
			}
			return true;
		} catch (IOException e) {
			dbg_msg("exception happened - here's what I know: ");
			e.printStackTrace();
			return false;
			// System.exit(-1);
		}
	}

	private static void setupResultDir(){
		java.nio.file.Path rPath = Paths.get("../results").toAbsolutePath().normalize();
		config.put(Constants.RESULT_DIR, rPath.toString());
		boolean foundFile = Files.exists(rPath, LinkOption.NOFOLLOW_LINKS);
		if (foundFile) {
			SAVE_RESULTS_DIR = rPath.toString();
		} else {
			Set<PosixFilePermission> perms = PosixFilePermissions.fromString("rwxr-x---");
			FileAttribute<Set<PosixFilePermission>> attr =
				PosixFilePermissions.asFileAttribute(perms);
			try {
				Files.createDirectories(rPath, attr);
				SAVE_RESULTS_DIR = rPath.toString();
			} catch (IOException e) {
				e.printStackTrace();
				Assert.fail("Could not create " + rPath.toString());
			}
		}
		System.out.println("SAVE_RESULTS_DIR is: " + SAVE_RESULTS_DIR);
	}

	private static void setupConfig(){
		dbg_msg("Niklaus setupConfig 2");
		config.put(Constants.AGENT_HOST, "localhost");
		config.put(Constants.AGENT_PORT, "6333");
		config.put(Constants.WORK_DIR, USER_DIR);
		config.put(Constants.AUT_EXE,
			Paths.get(USER_DIR + "/../work/Elexis3").toAbsolutePath().normalize().toString());
		config.put(Constants.AUT_LOCALE, "de_DE");
		config.put(Constants.AUT_ID, "elexis");
		config.put(Constants.AUT_PROGRAM_ARGS,
			"-Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=8000");

		config.put(Constants.AUT_VM_ARGS,
			"-nl " + config.get(Constants.AUT_LOCALE)
				+ " -clean -vmargs -Declipse.p2.unsignedPolicy=allow" + " -Dautagent_port="
				+ config.get(Constants.AGENT_PORT) + " -Dautagent_host="
				+ config.get(Constants.AGENT_HOST)
				+ " -Dorg.eclipse.swt.browser.DefaultType=mozilla -Dch.elexis.username=007"
				+ " -Dch.elexis.password=topsecret -Delexis-run-mode=RunFromScratch");
		config.put(Constants.AUT_KEYBOARD, "de_DE");
		for (Map.Entry<String, String> entry : config.entrySet()) {
			String from_env = System.getenv(entry.getKey());
			if (from_env != null) {
				config.put(entry.getKey(), from_env);
				dbg_msg("Config : from env " + from_env + " for " + entry.getKey() + " is: "
					+ entry.getValue());
			}
			String value = System.getProperty(entry.getKey());
			if (value != null) {
				dbg_msg("Config : from property " + value + " for " + entry.getKey() + " is: "
					+ entry.getValue());
				config.put(entry.getKey(), value);
			}
			dbg_msg("Config : " + entry.getKey() + " is: " + entry.getValue());
		}
	}

	public static class AgentThread extends Thread {

		@Override
		public void run(){
			dbg_msg("In AgentThread run");
			if ( !(SystemUtils.IS_OS_LINUX && System.getProperty("os.arch").equals("amd64")))
			{
				String name = System.getProperty("os.name");
				String version = System.getProperty("os.version");
				String arch = System.getProperty("os.arch");
				String msg = "Unsupported os" + name + " version" + version + " " + arch;
				dbg_msg(msg);
				System.exit(1);
			} else
			{
				java.nio.file.Path rPath = Paths
					.get(
						"../org.eclipse.jubula.product.autagent.start/target/products/org.eclipse.jubula.product.autagent.start/linux/gtk/x86_64/autagent")
					.toAbsolutePath().normalize();
				String msg =
					"autagent " + rPath.toFile().canExecute() + " " + rPath.toAbsolutePath();
				dbg_msg(msg);
				Assert.assertTrue(rPath.toFile().canExecute());
				run_system_cmd(new String[] {
					rPath.toString(), "-vm", "/usr/bin/java", "-l", "-p",
					config.get(Constants.AGENT_PORT)
				});
				dbg_msg("Autagent finished");
			}
		}
	}

	private static void startAutagent(){
		dbg_msg("Calling startAutagent ");
		agent_thread = new AgentThread();
		agent_thread.start();
	}

	private static void startAUT(){
		dbg_msg("Calling startAUT ");
		aut_id = m_agent.startAUT(aut_config);
		if (aut_id != null) {
			dbg_msg("started AUT as " + aut_id.getID() + " will sleep 2 seconds");
			Common.sleep1second();
			Common.sleep1second();
			m_aut = m_agent.getAUT(aut_id, SwtComponents.getToolkitInformation());
			dbg_msg("AUT will connect");
			Common.sleep1second();
			m_aut.connect();
			dbg_msg("AUT connected");
		} else {
			Assert.fail("AUT did not start as expected? Why"); //$NON-NLS-1$
		}
		Common.sleep1second();
		dbg_msg("AUT createApplication");
		app = SwtComponents.createApplication();
		dbg_msg("AUT activate via titlebar");
		m_aut.execute(app.activate(AUTActivationMethod.titlebar), null);
		Common.sleep1second();
		run_system_cmd(new String[] {
			"/bin/ps", "-f", "-C", "Elexis3"
		});
		dbg_msg("AUT created and activated");

	}

	@BeforeClass
	public static void setUp() throws Exception{
		setupResultDir();
		setupConfig();
		try {
			java.nio.file.Files.delete(ElexisLog);
			dbg_msg("Deleted old " + ElexisLog.toAbsolutePath());
		} catch (IOException e) {
			dbg_msg("Did not delete " + ElexisLog.toAbsolutePath());
		}

		/* Connecting to external Jubula AUT Agent which
		   must be started manually BEFORE test execution! */
		String msg = "AUT_run.setup port : " + Constants.AGENT_PORT + " is: "
			+ config.get(Constants.AGENT_PORT) + " env: "
			+ System.getenv().get(Constants.AGENT_PORT) + " property: "
			+ System.getProperty(Constants.AGENT_PORT);
		dbg_msg(msg);
		startAutagent();
		Common.sleepMs(Constants.ONE_SECOND * 5); // Give it some time to start up
		dbg_msg("after sleep: connect to " + config.get(Constants.AGENT_HOST) + " port "
			+ config.get(Constants.AGENT_PORT));
		m_agent = MakeR.createAUTAgent(config.get(Constants.AGENT_HOST),
			new Integer(config.get(Constants.AGENT_PORT)));
		m_agent.connect();
		String[] args = {
			config.get(Constants.AUT_VM_ARGS)
		};
		dbg_msg("Start AUT: arg " + args[0] + "\n   exe: " + config.get(Constants.AUT_EXE)
			+ "\n  workdir:" + config.get(Constants.WORK_DIR) + "\n  AUT_ID: "
			+ config.get(Constants.AUT_ID));
		if (!(new File(config.get(Constants.AUT_EXE))).canExecute()) {
			Assert.fail("EXE File " + config.get(Constants.AUT_EXE)
				+ " does not exist or cannot be executed");
		}
		System.out.println("Languageis " + config.get(Constants.AUT_LOCALE));
		System.out.println("Keyboard Layout is " + config.get(Constants.AUT_KEYBOARD));
		System.out.println("Default is " + Locale.getDefault());
		System.out.println("German is " + Locale.GERMANY + " " + Locale.GERMAN);
		System.out.println("Swiss_German is " + Locale.forLanguageTag("de_CH"));
		System.out.println("Keyboard_Locale: " + Keyboard_Locale.toString());
		aut_config = new RCPAUTConfiguration("ch.elexis.core.application", //$NON-NLS-1$
			config.get(Constants.AUT_ID), config.get(Constants.AUT_EXE),
			config.get(Constants.WORK_DIR), args, Locale.getDefault(), Keyboard_Locale);
		// config.get(Constants.WORK_DIR), args, Locale.getDefault(), Locale.getDefault());
		//		config.get(Constants.WORK_DIR), args, Locale.GERMANY, Locale.getDefault());
		dbg_msg("Got aut_config as " + aut_config.getLaunchInformation());
		Thread.sleep(1000);

		startAUT();
	}

	public static void takeScreenshotActiveWindow(String imageName){
		String fullname =
			new File(config.get(Constants.RESULT_DIR) + "/" + imageName).getAbsolutePath();
		dbg_msg("Request takeScreenshotActiveWindow " + fullname + " for " + imageName);
		// m_aut.execute(app.activate(AUTActivationMethod.none), null);
		try {
			m_aut.execute(
				app.takeScreenshotOfActiveWindow(fullname, 0, "rename", 100, true, 0, 0, 0, 0),
				null);
			boolean foundFile =
				Files.exists(new File(config.get(Constants.RESULT_DIR) + "/" + imageName).toPath(),
					LinkOption.NOFOLLOW_LINKS);
			dbg_msg("Created " + fullname + " exists " + foundFile);
			Assert.assertTrue(foundFile);
		} catch (ActionException e) {
			dbg_msg("Action Exception " + fullname + " reason: " + e.getMessage());
			//			Assert.fail("Unable to create screenshot " + imageName);
		}
	}

	/** cleanup */
	@SuppressWarnings("deprecation")
	@AfterClass
	public void tearDown() throws Exception{
		dbg_msg("AUT_run.tearDown ");
		writer.close();
		if (m_aut != null && m_aut.isConnected()) {
			m_aut.disconnect();
			m_agent.stopAUT(m_aut.getIdentifier());
		}
		if (m_agent != null && m_agent.isConnected()) {
			m_agent.disconnect();
		}
		if (agent_thread != null) {
			dbg_msg("Stopping agent_thread");
			agent_thread.interrupt();
			// agent_thread.stop();
			dbg_msg("Stopped agent_thread");
		}
		saveLogs();
	}

	private void saveLogs(){
		java.nio.file.Path newdir = Paths.get(SAVE_RESULTS_DIR, "elexis-3.log");
		try {
			java.nio.file.Files.copy(ElexisLog, newdir);
		} catch (IOException e) {
			// Just ignore this error, probably we had no elexis log
		}
	}

	public static void restartApp(){
		dbg_msg("AUT_run.restartApp ");
		m_agent.stopAUT(aut_id);
		dbg_msg("AUT_run.stoppedAUT ");
		m_agent.disconnect();
		dbg_msg("m_agent.disconnected ");
		m_agent.connect();
		dbg_msg("m_agent.connected ");
		startAUT();
	}

}
