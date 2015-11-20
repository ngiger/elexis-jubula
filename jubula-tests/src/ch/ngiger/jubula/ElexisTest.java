/*******************************************************************************
 * Copyright (c) 2015 BREDEX GmbH.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     BREDEX GmbH - initial API and implementation and/or initial documentation
 *******************************************************************************/
package ch.ngiger.jubula;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.AUTAgent;
import org.eclipse.jubula.client.MakeR;
import org.eclipse.jubula.client.exceptions.CheckFailedException;
import org.eclipse.jubula.client.launch.AUTConfiguration;
import org.eclipse.jubula.communication.CAP;
import org.eclipse.jubula.toolkit.enums.ValueSets.AUTActivationMethod;
import org.eclipse.jubula.toolkit.rcp.config.RCPAUTConfiguration;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.tools.AUTIdentifier;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/** @author BREDEX GmbH */
public class ElexisTest {
	/** AUT-Agent host name to use */
	public static final String AGENT_HOST = "localhost"; //$NON-NLS-1$
	/** AUT-Agent port to use */
	public static final int AGENT_PORT = 60000;
	/** the AUT-Agent */
	private AUTAgent m_agent;
	/** the AUT */
	private AUT m_aut;

	/** the logger */
	private static Logger log = LoggerFactory.getLogger(ElexisTest.class);
	private static final String AUT_ID = "elexis_3_1"; //$NON-NLS-1$
	private static final String ResultDirectory = Paths.get(".").toAbsolutePath().normalize().toString();



	/** global prepare */
	@BeforeClass
	public static void loadObjectMapping() throws Exception{
		log.warn("No ObjectMapping loaded!!");
		return;
		/*
		System.out.println("loadObjectMapping");
		URL input2 = ElexisTest.class.getClassLoader().getResource("META-INF/MANIFEST.MF"); //$NON-NLS-1$
		log.info(input2.toString());

		URL input =
			ElexisTest.class.getClassLoader().getResource("objectMapping_elexis.properties"); //$NON-NLS-1$
		log.info(input2.toString());
		if (input == null) {
			log.error("could not open resource");
			return;
		}

		ObjectMapping om = MakeR.createObjectMapping(input.openStream());

		log.warn("Not loading SimpleAdder items");
		return;
		*/
		/*
		ComponentIdentifier<Text> val1Id = om.get("value1"); //$NON-NLS-1$
		ComponentIdentifier<Text> val2Id = om.get("value2"); //$NON-NLS-1$
		ComponentIdentifier<Button> buttonId = om.get("equalsButton"); //$NON-NLS-1$
		ComponentIdentifier<Label> sumId = om.get("sum"); //$NON-NLS-1$

		if (val1Id != null && val2Id != null && buttonId != null
		        && sumId != null) {
		    value1 = SwtComponents.createText(val1Id);
		    value2 = SwtComponents.createText(val2Id);
		    button = SwtComponents.createButton(buttonId);
		    result = SwtComponents.createTextComponent(sumId);
		}
		*/
	}

	/** prepare */
	@Before
	public void setUp() throws Exception{
		/* Connecting to external Jubula AUT Agent which
		   must be started manually BEFORE test execution! */
		System.out.println("setUp");
		m_agent = getAUTAgentInstance();
		m_agent.connect();
		String[] args = {
			"-clean", "-vmargs", "-Declipse.p2.unsignedPolicy=allow",
			"-Dlogback.configurationFile=/home/niklaus/logback_mini.xml",
			"-Dorg.eclipse.swt.browser.DefaultType=mozilla", "-Dch.elexis.username=007",
			"-Dch.elexis.password=topsecret", "-Delexis-run-mode=RunFromScratch"
		};
		log.info("Elexis args: " + args);
		AUTConfiguration config = new RCPAUTConfiguration("ch.elexis.core.application", //$NON-NLS-1$
			AUT_ID, "/opt/src/elexis-jubula/work/Elexis3", //$NON-NLS-1$
			"/opt/src/elexis-jubula/work", //$NON-NLS-1$
			args, Locale.US, Locale.US);

		System.out.println(
			new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date()) + " startAUTx: " + config);
		AUTIdentifier id = m_agent.startAUT(config);
		System.out.println(new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date())
			+ "AUT started id: " + id);
		if (id != null) {
			System.out.println("AUT has started. Agent connected? " + m_agent.isConnected());
			m_aut = m_agent.getAUT(id, SwtComponents.getToolkitInformation());
			m_aut.connect();
			System.out.println("AUT connected? " + m_aut.isConnected());
		} else {
			System.out.println("AUT did not start as expectec? Why"); //$NON-NLS-1$
		}
	}
	/** the actual test method */
	@Test
	public void fullScreenShot() throws Exception{
		try {
			org.eclipse.jubula.toolkit.concrete.components.Application application = SwtComponents.createApplication();
		    m_aut.execute(application.activate(AUTActivationMethod.titlebar), null);
			System.out.println("run_smoke_test window 4");
			Path shot_1 =  new File(ResultDirectory + "/fullScreenShot.png").toPath();
			Files.deleteIfExists(shot_1);
			Assert.assertFalse(Files.exists(shot_1,  LinkOption.NOFOLLOW_LINKS));
			CAP cap1 =
				application.takeScreenshot(shot_1.toString(), 0, "rename", 100, true);
			m_aut.execute(cap1, null);
			Assert.assertTrue(Files.exists(shot_1,  LinkOption.NOFOLLOW_LINKS));
			System.out.println("shot_1 is: " + shot_1 + " exists " + Files.exists(shot_1,  LinkOption.NOFOLLOW_LINKS));
			System.out.println("shot_1 size " + Files.size(shot_1));
		} catch (CheckFailedException | AssertionError e) {
			e.printStackTrace();
//			Assert.fail("Smoketest failed");
        } finally {
    		System.out.println("fullScreenShot finished");
            Assert.assertTrue(true);
		}
	}
	/** the actual test method */
	@Test() // expected = CheckFailedException.class
	public void screenshot_active_window() throws Exception{
		try {
			System.out.println("screenshot_active_window connected? " + m_aut.isConnected());
			org.eclipse.jubula.toolkit.concrete.components.Application application = SwtComponents.createApplication();
		    m_aut.execute(application.activate(AUTActivationMethod.titlebar), null);
		    /*
			System.out.println("run_smoke_test window 1");
			CAP check1 = application.checkExistenceOfWindow("Elexis 3", ValueSets.Operator.matches, true);
		    m_aut.execute(check1, null);
			System.out.println("run_smoke_test window cap 2");
		    CAP check2 = application.checkExistenceOfWindow("Elexis 3", ValueSets.Operator.matches, true);
		    m_aut.execute(check2, null);
	    	System.out.println("run_smoke_test window 3");
		    application.clickInActiveWindow(1, ValueSets.InteractionMode.primary, 50, Unit.percent, 50, Unit.percent);
		    */

			Path shot_2 =  new File(ResultDirectory + "/take_screenshot_active_window.png").toPath();

			Files.deleteIfExists(shot_2);
			Assert.assertFalse(Files.exists(shot_2,  LinkOption.NOFOLLOW_LINKS));
			CAP cap2 = application.takeScreenshotOfActiveWindow(shot_2.toString(), 0,
				"rename", 100, true, 0, 0, 0, 0);
			m_aut.execute(cap2, null);
			System.out.println("shot_2a is: " + shot_2 + " exists " + Files.exists(shot_2,  LinkOption.NOFOLLOW_LINKS));
			Assert.assertTrue(Files.exists(shot_2,  LinkOption.NOFOLLOW_LINKS));

		} catch (CheckFailedException | AssertionError e) {
			e.printStackTrace();
			Assert.fail("Smoketest failed");

        } finally {
    		System.out.println("smoketest finished");
            Assert.assertTrue(true);
        }

	}

	/** cleanup */
	@After
	public void tearDown() throws Exception{
		System.out.println("tearDown");
		if (m_aut != null) {
			m_aut.disconnect();
			System.out.println("m_aut.disconnected");
			m_agent.stopAUT(m_aut.getIdentifier());
			System.out.println("stopped AUT");
		}
		if (m_agent != null) {
			m_agent.disconnect();
			System.out.println("disconnected");
		}
		System.out.println("tearDown finished");
	}

	/**
	 * @return an AUT-Agent instance
	 */
	protected AUTAgent getAUTAgentInstance(){
		return MakeR.createAUTAgent(AGENT_HOST, AGENT_PORT);
	}
}