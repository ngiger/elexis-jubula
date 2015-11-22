package ch.ngiger.jubula.helpers;

import java.io.File;
import java.io.IOException;
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
import org.eclipse.jubula.qa.api.converter.target.rcp.RuntimeContext;
import org.eclipse.jubula.toolkit.concrete.components.Application;
import org.eclipse.jubula.toolkit.enums.ValueSets.AUTActivationMethod;
import org.eclipse.jubula.toolkit.rcp.config.RCPAUTConfiguration;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.tools.AUTIdentifier;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class AUT_run {
	/** the AUT-Agent */
	public static AUTAgent m_agent;
	/** the AUT */
	public static AUT m_aut;
	public static ObjectMapping om = null;
	public static String results = null;

	/** the logger */
	private static Logger log = LoggerFactory.getLogger(AUT_run.class);
	public static final String AUT_ID = "elexis_3_1"; //$NON-NLS-1$
	public static Application app = null;
	public static Map<String, String> config = new Hashtable<String, String>();
	public static final String USER_DIR = System.getProperty("user.dir");

	private static void setupConfig(){
		config.put(Constants.AGENT_HOST, "localhost");
		config.put(Constants.AGENT_PORT, "6333");
		java.nio.file.Path rPath = Paths.get("../results").toAbsolutePath().normalize();
		config.put(Constants.RESULT_DIR, rPath.toString());
		boolean foundFile = Files.exists(rPath, LinkOption.NOFOLLOW_LINKS);
		if (!foundFile) {
			Set<PosixFilePermission> perms = PosixFilePermissions.fromString("rwxr-x---");
			FileAttribute<Set<PosixFilePermission>> attr =
				PosixFilePermissions.asFileAttribute(perms);
			try {
				Files.createDirectories(rPath, attr);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Assert.fail("Could not create " + rPath.toString());
			}
		}
		dbg_msg("RESULT DIR " + config.get(Constants.RESULT_DIR) + " exists? " + foundFile);
		results = config.get(Constants.RESULT_DIR);
		config.put(Constants.WORK_DIR, USER_DIR);
		config.put(Constants.AUT_EXE,
			Paths.get(USER_DIR + "/../work/Elexis3").toAbsolutePath().normalize().toString());
		config.put(Constants.AUT_LOCALE, "de_CH");
		config.put(Constants.AUT_ID, "elexis");
		config.put(Constants.AUT_ARGS,
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

	public static void dbg_msg(String msg){
		String timeStamp =
			new SimpleDateFormat("dd.MM.yyyy HH:mm:ss").format(Calendar.getInstance().getTime());
		System.out.println(timeStamp + ": " + msg);
		log.info(msg);
	}

	@BeforeClass
	public static void setUp() throws Exception{
		setupConfig();
		String logback_test = "logback-test.xml";
		URL logback = AUT_run.class.getClassLoader().getResource(logback_test); //$NON-NLS-1$
		if (logback == null) {
			Assert.fail("could not open resource: " + logback_test);
			return;
		}
		System.out.println(
			"Testing logback_test" + logback_test + " user.dir " + System.getProperty("user.dir"));
		dbg_msg("Testing logback_test" + logback_test);
		URL input = AUT_run.class.getClassLoader().getResource(RuntimeContext.OM_Resource_Name); //$NON-NLS-1$
		if (input == null) {
			Assert.fail("could not open resource: " + RuntimeContext.OM_Resource_Name);
			return;
		}
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
			config.get(Constants.AUT_ARGS)
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

		AUTIdentifier id = m_agent.startAUT(aut_config);
		if (id != null) {
			m_aut = m_agent.getAUT(id, SwtComponents.getToolkitInformation());
			m_aut.connect();
		} else {
			Assert.fail("AUT did not start as expected? Why"); //$NON-NLS-1$
		}
		app = SwtComponents.createApplication();
		dbg_msg("AUT created");
		m_aut.execute(app.activate(AUTActivationMethod.titlebar), null);
		Thread.sleep(1000);
		dbg_msg("AUT created and activated");
	}

	public void takeScreenshotActiveWindow(String imageName){
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
		if (m_aut != null && m_aut.isConnected()) {
			m_aut.disconnect();
			m_agent.stopAUT(m_aut.getIdentifier());
		}
		if (m_agent != null && m_agent.isConnected()) {
			m_agent.disconnect();
		}
	}

}
