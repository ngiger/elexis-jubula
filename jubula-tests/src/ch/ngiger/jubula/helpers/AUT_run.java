package ch.ngiger.jubula.helpers;

import java.io.File;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Paths;
import java.util.Hashtable;
import java.util.Locale;
import java.util.Map;

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

	private static void setupConfig(){
		config.put(Constants.AGENT_HOST, "localhost");
		config.put(Constants.AGENT_PORT, "6333");
		config.put(Constants.RESULT_DIR,
			Paths.get("../results").toAbsolutePath().normalize().toString());
		results = config.get(Constants.RESULT_DIR);
		config.put(Constants.WORK_DIR, "/opt/src/elexis-jubula/work/");
		config.put(Constants.AUT_EXE, "/opt/src/elexis-jubula/work/Elexis3");
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
			log.info("Config : " + entry.getKey() + " is: " + entry.getValue());
		}
	}

	@BeforeClass
	public static void setUp() throws Exception{
		setupConfig();
		URL input = AUT_run.class.getClassLoader().getResource(RuntimeContext.OM_Resource_Name); //$NON-NLS-1$
		if (input == null) {
			Assert.fail("could not open resource" + RuntimeContext.OM_Resource_Name);
			return;
		}
		om = MakeR.createObjectMapping(input.openStream());
		/* Connecting to external Jubula AUT Agent which
		   must be started manually BEFORE test execution! */
		System.out.println("AUT_run.setup port : " + Constants.AGENT_PORT + " is: "
			+ config.get(Constants.AGENT_PORT) + " env: "
			+ System.getenv().get(Constants.AGENT_PORT) + " property: "
			+ System.getProperty(Constants.AGENT_PORT));
		m_agent = MakeR.createAUTAgent(config.get(Constants.AGENT_HOST),
			new Integer(config.get(Constants.AGENT_PORT)));
		m_agent.connect();
		String[] args = {
			config.get(Constants.AUT_ARGS)
		};
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
		m_aut.execute(app.activate(AUTActivationMethod.titlebar), null);
	}

	public void takeScreenshotActiveWindow(String imageName){
		String fullname =
			new File(config.get(Constants.RESULT_DIR) + "/" + imageName).getAbsolutePath();
		m_aut.execute(
			app.takeScreenshotOfActiveWindow(fullname, 0, "rename", 100, true, 0, 0, 0, 0), null);
		boolean foundFile =
			Files.exists(new File(config.get(Constants.RESULT_DIR) + "/" + imageName).toPath(),
				LinkOption.NOFOLLOW_LINKS);
		log.info("Created " + fullname + " exists " + foundFile);
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
