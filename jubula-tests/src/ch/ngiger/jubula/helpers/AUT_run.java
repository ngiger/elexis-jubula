package ch.ngiger.jubula.helpers;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Date;
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
	public static Application app = null;

	/** the logger */
	// private static Logger log = LoggerFactory.getLogger(AUT_run.class);
	public static final String AUT_ID = "elexis_3_1"; //$NON-NLS-1$
	public static Map<String, String> config = new Hashtable<String, String>();
	public static final String USER_DIR = System.getProperty("user.dir");
	public static final Locale Keyboard_Locale = Locale.GERMANY;// Locale.US;
	private static AUTConfiguration aut_config = null;
	private static java.nio.file.Path ElexisLog =
		Paths.get(System.getProperty("user.home") + "/elexis/logs/elexis-3.log");
	public static boolean isMedelexis = false;
	private static String dump_command = null;
	static String dump_to_file;
	private static String load_command;
	private static String db_user_pw =
		" -Dch.elexis.dbUser=elexisTest -Dch.elexis.dbPw=elexisTest ";

	private static void setupConfig(){
		config.put(Constants.DB_CONNECTION, "h2");
		config.put(Constants.DB_LOAD_SCRIPT, "");
		config.put(Constants.AGENT_HOST, "localhost");
		config.put(Constants.AGENT_PORT, "6333");
		config.put(Constants.WORK_DIR, USER_DIR);
		Path elexis3 = Paths.get(USER_DIR + "/../work/Elexis3");
		Path medelexis3 = null;
		if (elexis3.toFile().canExecute()) {
			config.put(Constants.AUT_EXE, elexis3.toAbsolutePath().normalize().toString());
		} else {
			String variant = System.getenv("VARIANT");
			medelexis3 = Paths.get(USER_DIR + "/../work/Medelexis");
			isMedelexis = true;
			config.put(Constants.AUT_EXE, medelexis3.toAbsolutePath().normalize().toString());
			config.put(Constants.AUT_VM_ARGS,
				"-eclipse.password ~/.medelexis.dummy.password " + config.get(Constants.AUT_VM_ARGS)
					+ " -Dprovisioning.UpdateRepository=" + variant);
			Path prefs =
				Paths.get(USER_DIR + "/../work/configuration/.settings/MedelexisDesk.prefs");
			if (!prefs.toFile().canRead()) {
				List<String> lines = Arrays.asList(new String[] {
					"eclipse.preferences.version=1",
					"usageConditionAcceptanceDate=" + LocalDateTime.now().toString(),
					"usageConditionAccepted=true"
				});
				try {
					Files.write(prefs, lines);
				} catch (IOException e) {}
			}
		}
		config.put(Constants.AUT_LOCALE, "de_DE");
		config.put(Constants.AUT_ID, "elexis");
		config.put(Constants.AUT_PROGRAM_ARGS,
			"-Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=8000");
		// with the following String I started on wheezy
		// ./Medelexis -eclipse.password ~/.medelexis.dummy.password -clean
		// -debug -consoleLog -vmargs -Delexis-run-mode=RunFromScratch
		// -Dch.elexis.username=007 -Dch.elexis.password=topsecret
		config.put(Constants.AUT_VM_ARGS,
			"-nl " + config.get(Constants.AUT_LOCALE)
				+ " --clean -vmargs -Declipse.p2.unsignedPolicy=allow" + " -Dautagent_port="
				+ config.get(Constants.AGENT_PORT) + " -Dautagent_host="
				+ config.get(Constants.AGENT_HOST)
				+ " -Dch.elexis.username=007 -Dch.elexis.password=topsecret "); //  osgi.locking=none
		config.put(Constants.AUT_KEYBOARD, "de_DE");
		overrideConfigWithEnvAndProperties();
		checkAndLoadDatabase();
		dumpConfig("After setupConfig");
	}

	/**
	 *
	 * @param db_variant
	 *            e.g. h2, mysql, postresql
	 * @param filename
	 *            either absolute path or basename for directory rsc/db/<db_variant>
	 * @return absolute path of file or null if not found
	 */

	static String getDatabaseFile(String db_variant, String filename){
		String path = AUT_run.class.getProtectionDomain().getCodeSource().getLocation().getPath();
		Utils.dbg_msg("Find " + filename + " config.get(Constants.WORK_DIR) "
			+ config.get(Constants.WORK_DIR));
		if (new File(filename).canRead()) {
			Utils.dbg_msg("Cannot read the db file: " + filename);
			return filename;
		}
		String decodedPath = null;
		try {
			decodedPath = URLDecoder.decode(path, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			Utils.dbg_msg("Cannot decode: " + path);
			return null;
		}
		Utils.dbg_msg("decodedPath is: " + decodedPath);
		String desired = config.get(Constants.WORK_DIR) + "/rsc/db/" + db_variant + "/" + filename;
		if (new File(desired).canRead()) {
			Utils.dbg_msg(
				"desired is readable: " + desired + " -> " + desired.replaceAll("//", "/"));
			return desired.replaceAll("//", "/");
		}
		Utils.dbg_msg("CANNOT read desired: " + desired);
		return null;
	}

	/**
	 * if Constants.DB_LOAD_SCRIPT is set: <br>
	 * * loads the specified SQL script <br>
	 * * set variables dump_to_file, load_command, dump_command <br>
	 * * dump_command will be called in the teardown to create <sql_script>_after.sql file.
	 */
	private static void checkAndLoadDatabase(){
		String db_connection = config.get(Constants.DB_CONNECTION);
		db_user_pw = " -Dch.elexis.dbUser=elexisTest -Dch.elexis.dbPw=elexisTest ";
		Utils.dbg_msg("db_connection ist: " + db_connection);
		String vmargs_db_flavor = null;
		if (db_connection == null || db_connection.equals("h2")) {
			config.put(Constants.AUT_VM_ARGS,
				config.get(Constants.AUT_VM_ARGS) + " -Delexis-run-mode=RunFromScratch");
			Utils.dbg_msg("AUT_VM_ARGS are: " + config.get(Constants.AUT_VM_ARGS));
			return;
		}
		String cleanURI = db_connection.substring(db_connection.indexOf(":") + 1);
		URI uri = URI.create(cleanURI);
		if (uri == null)
			return;
		Utils.dbg_msg("uri ist: " + uri);
		String db_variant =
			(uri != null && uri.getScheme() != null) ? uri.getScheme().toLowerCase() : "h2";
		int db_port = uri.getPort();
		String db_host = uri.getHost();
		Utils.dbg_msg(db_connection + ": -> " + db_variant + ", " + db_host + ", " + db_port + ", "
			+ uri.getPath());

		vmargs_db_flavor =
			" -Dch.elexis.dbFlavor=" + db_variant + " -Dch.elexis.dbSpec=" + db_connection;

		Utils.dbg_msg(config.get(Constants.DB_LOAD_SCRIPT));
		String file_to_load = getDatabaseFile(db_variant, config.get(Constants.DB_LOAD_SCRIPT));
		if (file_to_load == null) {
			Utils.dbg_msg("file_to_load is null. There setting elexis-run-mode RunFromScratch for "
				+ db_variant);
			config.put(Constants.AUT_VM_ARGS,
				config.get(Constants.AUT_VM_ARGS) + " -Delexis-run-mode=RunFromScratch");
			System.exit(3);
		} else {
			dump_to_file = file_to_load + "_after.sql";
			if (db_variant.equals("h2")) {
				// Testing using the test-arguments -Ddb_connection="jdbc:h2:~/elexis-jubula" -Ddb_load_script=scratch.sql
				// This will not work if you run the agent on a different host!
				java.nio.file.Path j2_jar_file =
					Paths.get("../work/plugins/org.h2_1.3.170.jar").toAbsolutePath().normalize();
				String start = "java -cp " + j2_jar_file;
				String middle = " -url " + db_connection + " -user sa -script ";
				load_command = start + " org.h2.tools.RunScript " + middle + file_to_load;
				dump_command = start + " org.h2.tools.Script " + middle + dump_to_file;

			} else if (db_variant.equals("mysql")) {
				config.put(Constants.AUT_VM_ARGS, config.get(Constants.AUT_VM_ARGS) + db_user_pw);
				load_command = "/usr/bin/mysql " + " --host=" + db_host
					+ " --user=elexisTest --password=elexisTest ";
				if (db_port > 0) {
					load_command += " --protocol=TCP " + String.format(" --port=%d ", db_port);
				}
				String db_name = uri.getPath().replace("/", "");
				dump_command = load_command.replace("/bin/mysql ", "/bin/mysqldump ");
				load_command += db_name;
				load_command = "/bin/cat " + file_to_load + " | " + load_command;
				dump_command += " --add-drop-table " + db_name + " > " + dump_to_file;
				Utils.dbg_msg(dump_command);
			} else if (db_variant.equals("postgresql")) {
				String set_pw = "export PGPASSWORD=elexisTest\n";
				// PG user elexisTest must be downcased to allow login! Niklaus Giger, 22.04.2016
				// but the password remains mixed case.
				db_user_pw = " -Dch.elexis.dbUser=elexistest -Dch.elexis.dbPw=elexisTest ";
				vmargs_db_flavor = " -Dch.elexis.dbFlavor=" + db_variant + " -Dch.elexis.dbSpec="
					+ db_connection.toLowerCase();

				String connect_cmd = " --host=" + db_host + " --user=elexisTest ".toLowerCase();
				if (db_port > 0) {
					connect_cmd += String.format(" --port=%d ", db_port);
				}
				String db_name = uri.getPath().replace("/", "").toLowerCase();
				connect_cmd += db_name;
				load_command =
					set_pw + "/bin/cat " + file_to_load + " | /usr/bin/psql " + connect_cmd;
				dump_command = set_pw + "pg_dump --clean " + connect_cmd + " > " + dump_to_file;

			} else {
				Assert.fail(Constants.DB_CONNECTION + " unsupported type " + db_variant
					+ " from config " + config.get(Constants.DB_CONNECTION));
			}
			if (!Utils.run_system_cmd(load_command)) {
				String error = "loading database failed: " + dump_command;
				Utils.dbg_msg(error);
				Assert.fail(error);
			}
			dump_command = "rm -f " + dump_to_file + "; " + dump_command;
			Utils.dbg_msg("dump_command: " + dump_command);
		}
		Utils.dbg_msg("checkAndLoadDatabase vmargs_db_flavor: " + vmargs_db_flavor);
		Utils.dbg_msg("checkAndLoadDatabase db_user_pw: " + db_user_pw);
		config.put(Constants.AUT_VM_ARGS,
			config.get(Constants.AUT_VM_ARGS) + vmargs_db_flavor + " " + db_user_pw);
	}

	private static void dumpDatabase(){
		if (dump_command != null) {
			Utils.run_system_cmd(dump_command);
		}
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
				Assert.assertTrue(rPath.toFile().canExecute());
				Utils.run_system_cmd(rPath.toString() + " -vm /usr/bin/java -l -p "
					+ config.get(Constants.AGENT_PORT) + " &");
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
		AUTIdentifier aut_id = null;
		AUT new_aut = null;
		Utils.dbg_msg("Calling startAUT: aut_config" + aut_config);
		try {
			int j = 0;
			while (j < 60 && !m_agent.isConnected()) {
				Utils.dbg_msg("Calling startAUT " + j + " isConnected " + m_agent.isConnected());
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
					Utils.dbg_msg("startAUT failed: " + e.getMessage()); //$NON-NLS-1$
				}
			}
			Utils.dbg_msg("Calling startAUT returned " + aut_id);
			if (aut_id != null) {
				Utils.dbg_msg("started AUT as " + aut_id.getID());
				new_aut = m_agent.getAUT(aut_id, SwtComponents.getToolkitInformation());
				Utils.dbg_msg("AUT will connect");
				new_aut.connect();
				Utils.dbg_msg("AUT connected");
			} else {
				Assert.fail("AUT did not start as expected? Why"); //$NON-NLS-1$
			}
			Utils.dbg_msg("AUT activate via titlebar");
			activate(new_aut);

			Utils.dbg_msg("AUT created and activated");
		} catch (ActionException | CommunicationException e) {
			Utils.dbg_msg("Action Exception startAUT reason: " + e.getMessage()); //$NON-NLS-1$
			takeScreenshot(m_aut, app, "start_aut_failed.png");
			Assert.fail("unable to start AUT"); //$NON-NLS-1$

		}
		m_aut = new_aut;
		return new_aut;
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
			config.get(Constants.AUT_VM_ARGS)
		};
		String args_as_string = config.get(Constants.AUT_VM_ARGS);
		Utils.dbg_msg("Start AUT: aut_id  " + config.get(Constants.AUT_ID) + "\ncd "
			+ config.get(Constants.WORK_DIR) + "\n" + "\n" + config.get(Constants.AUT_EXE) + " "
			+ args_as_string);
		Utils.dbg_msg("Default is " + Locale.getDefault());
		Utils.dbg_msg("German is " + Locale.GERMANY + " " + Locale.GERMAN);
		Utils.dbg_msg("Swiss_German is " + Locale.forLanguageTag("de_CH"));
		Utils.dbg_msg("Keyboard_Locale: " + Keyboard_Locale.toString());
		aut_config = new RCPAUTConfiguration("ch.elexis.core.application", //$NON-NLS-1$
			config.get(Constants.AUT_ID), config.get(Constants.AUT_EXE),
			config.get(Constants.WORK_DIR), args, Locale.US);
		Utils.dbg_msg("Got aut_config as " + aut_config.getLaunchInformation());
		Thread.sleep(1000);
		Utils.dbg_msg("AUT createApplication");
		app = SwtComponents.createApplication();
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
			String agent_host = config.get(Constants.AGENT_HOST);
			if (agent_host.toLowerCase().equals("localhost")) {
				boolean foundFile = Files.exists(
					new File(config.get(Constants.RESULT_DIR) + "/" + imageName).toPath(),
					LinkOption.NOFOLLOW_LINKS);
				Utils.dbg_msg("Created " + fullname + " exists " + foundFile);
				Assert.assertTrue(foundFile);
			}
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
		Utils.dbg_msg("stopAut " + aut + " isCon " + aut.isConnected());
		if (aut != null && aut.isConnected()) {
			aut.disconnect();
			m_agent.stopAUT(aut.getIdentifier());
		}
		Utils.dbg_msg("stoppedAut " + aut);
	}

	/** cleanup */
	@AfterClass
	public static void tearDown() throws Exception{
		if (m_aut != null) {
			Utils.dbg_msg("AUT_run.tearDown " + m_aut + " isCon " + m_aut.isConnected());
		}
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
		dumpDatabase();
		Utils.getWriter().close();
		saveLogsAndDump();
	}

	private static void saveLogsAndDump(){
		java.nio.file.Path save_to = Paths.get(AUT_run.config.get(Constants.RESULT_DIR));
		try {
			if (dump_to_file != null && new File(dump_to_file).canRead()) {
				DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd_HH.mm");
				Date date = new Date();
				java.nio.file.Files.copy(Paths.get(dump_to_file), Paths.get(save_to.toString(),
					"after_" + dateFormat.format(date).toString() + ".sql"));
			}
			java.nio.file.Files.copy(ElexisLog, save_to);
		} catch (IOException e) {
			// Just ignore this error, probably we had no elexis log
		}
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
