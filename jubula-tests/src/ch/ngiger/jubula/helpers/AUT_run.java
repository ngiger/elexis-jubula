package ch.ngiger.jubula.helpers;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
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

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.AUTAgent;
import org.eclipse.jubula.client.MakeR;
import org.eclipse.jubula.client.ObjectMapping;
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
	public static AUTAgent m_agent;
	/** the AUT */
	public static AUT m_aut;
	public static ObjectMapping om = null;
	public static String SAVE_RESULTS_DIR = null;
	public static Application app = null;

	/** the logger */
	// private static Logger log = LoggerFactory.getLogger(AUT_run.class);
	public static final String AUT_ID = "elexis_3_1"; //$NON-NLS-1$
	public static Map<String, String> config = new Hashtable<String, String>();
	public static final String USER_DIR = System.getProperty("user.dir");
	public static String RESULT_DIR = null;
	private static PrintWriter writer = null;
	private static AUTIdentifier id = null;

	public static void dbg_msg(String msg){
		String timeStamp =
			new SimpleDateFormat("dd.MM.yyyy HH:mm:ss").format(Calendar.getInstance().getTime());
		// log.info(msg);
		if (writer == null) {
			String log_name = null;
			if (SAVE_RESULTS_DIR != null) {
				log_name = SAVE_RESULTS_DIR + "/AUT_run.log";
			} else {
				log_name = USER_DIR + "/AUT_run.log";
			}
			try {
				writer = new PrintWriter(log_name, "UTF-8");
			} catch (FileNotFoundException | UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("log_name writer is: " + log_name);
		}
		// System.out.println(timeStamp + ": dbg_msg " + msg);
		writer.println(timeStamp + ": " + msg);
		writer.flush();
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
				// TODO Auto-generated catch block
				e.printStackTrace();
				Assert.fail("Could not create " + rPath.toString());
			}
		}
		System.out.println("SAVE_RESULTS_DIR is: " + SAVE_RESULTS_DIR);
	}

	private static void setupConfig(){
		config.put(Constants.AGENT_HOST, "localhost");
		config.put(Constants.AGENT_PORT, "6333");
		config.put(Constants.WORK_DIR, USER_DIR);
		config.put(Constants.AUT_EXE,
			Paths.get(USER_DIR + "/../work/Elexis3").toAbsolutePath().normalize().toString());
		config.put(Constants.AUT_LOCALE, "de_CH");
		config.put(Constants.AUT_ID, "elexis");
		config.put(Constants.AUT_PROGRAM_ARGS, ""); // "-Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=8000");

		config.put(Constants.AUT_VM_ARGS,
			"-nl " + config.get(Constants.AUT_LOCALE)
				+ " -clean -vmargs -Declipse.p2.unsignedPolicy=allow" + " -Dautagent_port="
				+ config.get(Constants.AGENT_PORT) + " -Dautagent_host="
				+ config.get(Constants.AGENT_HOST)
				+ " -Dorg.eclipse.swt.browser.DefaultType=mozilla -Dch.elexis.username=007"
				+ " -Dch.elexis.password=topsecret -Delexis-run-mode=RunFromScratch");
		config.put(Constants.AUT_KEYBOARD, "us");
		for (Map.Entry<String, String> entry : config.entrySet()) {
			String from_env = System.getenv(entry.getKey());
			if (from_env != null) {
				config.put(entry.getKey(), from_env);
			}
			String value = System.getProperty(entry.getKey());
			if (value != null) {
				config.put(entry.getKey(), value);
			}
			dbg_msg("Config : " + entry.getKey() + " is: " + entry.getValue());
		}
	}

	@BeforeClass
	public static void setUp() throws Exception{
		setupResultDir();
		setupConfig();
		URL input = AUT_run.class.getClassLoader().getResource("om.properties"); //$NON-NLS-1$
		om = MakeR.createObjectMapping(input.openStream());
		/* Connecting to external Jubula AUT Agent which
		   must be started manually BEFORE test execution! */
		String msg = "AUT_run.setup port : " + Constants.AGENT_PORT + " is: "
			+ config.get(Constants.AGENT_PORT) + " env: "
			+ System.getenv().get(Constants.AGENT_PORT) + " property: "
			+ System.getProperty(Constants.AGENT_PORT);
		dbg_msg(msg);
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
		AUTConfiguration aut_config = new RCPAUTConfiguration("ch.elexis.core.application", //$NON-NLS-1$
			config.get(Constants.AUT_ID), config.get(Constants.AUT_EXE),
			config.get(Constants.WORK_DIR), args,
			Locale.forLanguageTag(config.get(Constants.AUT_LOCALE)),
			Locale.forLanguageTag(config.get(Constants.AUT_KEYBOARD)));
		dbg_msg("Got aut_config as " + aut_config);
		Thread.sleep(1000);

		dbg_msg("Calling startAUT ");
		id = m_agent.startAUT(aut_config);
		if (id != null) {
			dbg_msg("started AUT as " + id.getID() + " will sleep 2 seconds");
			Thread.sleep(2000);
			m_aut = m_agent.getAUT(id, SwtComponents.getToolkitInformation());
			dbg_msg("AUT will connect to id " + id.getID());
			Thread.sleep(1000);
			m_aut.connect();
			dbg_msg("AUT connected");
		} else {
			Assert.fail("AUT did not start as expected? Why"); //$NON-NLS-1$
		}
		dbg_msg("SwtComponents.createApplication");
		app = SwtComponents.createApplication();
		dbg_msg("AUT activate via titlebar");
		m_aut.execute(app.activate(AUTActivationMethod.titlebar), null);
		Thread.sleep(1000);
		dbg_msg("AUT created and activated " + id);
	}

	public static void takeScreenshotActiveWindow(String imageName){
		String fullname =
			new File(config.get(Constants.RESULT_DIR) + "/" + imageName).getAbsolutePath();
		dbg_msg("Request takeScreenshotActiveWindow " + fullname + " for " + imageName);
		m_aut.execute(
			app.takeScreenshotOfActiveWindow(fullname, 0, "rename", 100, true, 0, 0, 0, 0), null);
		boolean foundFile =
			Files.exists(new File(config.get(Constants.RESULT_DIR) + "/" + imageName).toPath(),
				LinkOption.NOFOLLOW_LINKS);
		dbg_msg("Created " + fullname + " exists " + foundFile);
		Assert.assertTrue(foundFile);
	}

	/** cleanup */
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
	}

}
