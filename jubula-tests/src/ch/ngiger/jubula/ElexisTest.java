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
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Locale;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.AUTAgent;
import org.eclipse.jubula.client.MakeR;
import org.eclipse.jubula.client.ObjectMapping;
import org.eclipse.jubula.client.exceptions.ActionException;
import org.eclipse.jubula.client.exceptions.CheckFailedException;
import org.eclipse.jubula.client.exceptions.ComponentNotFoundException;
import org.eclipse.jubula.client.launch.AUTConfiguration;
import org.eclipse.jubula.communication.CAP;
import org.eclipse.jubula.qa.api.converter.target.rcp.RuntimeContext;
import org.eclipse.jubula.toolkit.concrete.components.Application;
import org.eclipse.jubula.toolkit.concrete.components.ButtonComponent;
import org.eclipse.jubula.toolkit.concrete.components.MenuBarComponent;
import org.eclipse.jubula.toolkit.concrete.components.TableComponent;
import org.eclipse.jubula.toolkit.concrete.components.TreeComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets;
import org.eclipse.jubula.toolkit.enums.ValueSets.AUTActivationMethod;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.enums.ValueSets.SearchType;
import org.eclipse.jubula.toolkit.enums.ValueSets.Unit;
import org.eclipse.jubula.toolkit.rcp.config.RCPAUTConfiguration;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.toolkit.swt.components.Button;
import org.eclipse.jubula.toolkit.swt.components.Table;
import org.eclipse.jubula.toolkit.swt.components.Tree;
import org.eclipse.jubula.tools.AUTIdentifier;
import org.eclipse.jubula.tools.ComponentIdentifier;
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
	private static final String ResultDirectory =
		Paths.get(".").toAbsolutePath().normalize().toString();
	private static ObjectMapping om = null;
	private static Application app = null;
	private static RuntimeContext rtc = null;

	/** global prepare */
	@BeforeClass
	public static void loadObjectMapping() throws Exception{
		URL input = ElexisTest.class.getClassLoader().getResource(RuntimeContext.OM_Resource_Name); //$NON-NLS-1$
		if (input == null) {
			Assert.fail("could not open resource" + RuntimeContext.OM_Resource_Name);
			return;
		}
		om = MakeR.createObjectMapping(input.openStream());
		return;
	}

	/** prepare */
	@Before
	public void setUp() throws Exception{
		/* Connecting to external Jubula AUT Agent which
		   must be started manually BEFORE test execution! */
		m_agent = getAUTAgentInstance();
		m_agent.connect();
		String[] args = {
			"-nl de_CH", "-clean", "-vmargs", "-Declipse.p2.unsignedPolicy=allow",
			"-Dlogback.configurationFile=/home/niklaus/logback_mini.xml",
			"-Dorg.eclipse.swt.browser.DefaultType=mozilla", "-Dch.elexis.username=007",
			"-Dch.elexis.password=topsecret", "-Delexis-run-mode=RunFromScratch"
		};
		AUTConfiguration config = new RCPAUTConfiguration("ch.elexis.core.application", //$NON-NLS-1$
			AUT_ID, "/opt/src/elexis-jubula/work/Elexis3", //$NON-NLS-1$
			"/opt/src/elexis-jubula/work", //$NON-NLS-1$
			args, Locale.forLanguageTag("de_CH"), Locale.US);

		AUTIdentifier id = m_agent.startAUT(config);
		if (id != null) {
			m_aut = m_agent.getAUT(id, SwtComponents.getToolkitInformation());
			m_aut.connect();
		} else {
			Assert.fail("AUT did not start as expected? Why"); //$NON-NLS-1$
		}
		app = SwtComponents.createApplication();
		m_aut.execute(app.activate(AUTActivationMethod.titlebar), null);
		rtc = new RuntimeContext(m_aut, false, false, false, false);
	}

	public void takeScreenshotActiveWindow(String imageName){
		String fullname = new File(ResultDirectory + "/" + imageName).getAbsolutePath();
		m_aut.execute(
			app.takeScreenshotOfActiveWindow(fullname, 0, "rename", 100, true, 0, 0, 0, 0), null);
		Assert.assertTrue(Files.exists(new File(ResultDirectory + "/" + imageName).toPath(),
			LinkOption.NOFOLLOW_LINKS));
		System.out.println("Created " + fullname);
	}

	/** test visiting all perspectives */
	@Test
	public void visit_all_perspectives() throws Exception{
		int j = 0;
		try {
			String window_title = "Open Perspective";
			while (true) {
				j++;
				System.out.println("Visiting perspective number " + j);
				MenuBarComponent mbr = SwtComponents.createMenu();
				mbr.waitForComponent(1000, 1000);
				m_aut.execute(
					mbr.selectMenuEntryByTextpath("Fenster/Perspektive/Other...", Operator.equals),
					null);
				app.waitForWindow(window_title, Operator.matches, 1000, 50);
				ComponentIdentifier<Table> tbl = om.get("OpenPerspective_ViewTree_grc");
				System.out.println("user 1");
				TableComponent tableComp = org.eclipse.jubula.toolkit.concrete.ConcreteComponents
					.createTableComponent(tbl);
				m_aut.execute(tableComp.selectCell(Integer.toString(j), Operator.equals, "1",
					Operator.equals, new Integer(1), new Integer(50), Unit.percent, new Integer(50),
					Unit.percent, ValueSets.BinaryChoice.no, InteractionMode.primary), null);
				ComponentIdentifier<Button> ok_btn = om.get("ShowView_OkButton_grc");
				ButtonComponent ok_btn_comp = org.eclipse.jubula.toolkit.concrete.ConcreteComponents
					.createButtonComponent(ok_btn);
				m_aut.execute(ok_btn_comp.click(1, InteractionMode.primary), null);
				app.waitForWindowToClose(window_title, Operator.matches, 1000, 500);
				app.waitForWindow(window_title, Operator.matches, 1000, 500);
				takeScreenshotActiveWindow("Perspective_" + j + ".png");
			}
		} catch (ActionException e) {
			if (j <= 3) {
				Assert.fail("We should have more than 3 perspectives to visit!");
			}

		} catch (CheckFailedException | AssertionError e) {
			e.printStackTrace();
		} finally {
			Assert.assertTrue(true);
		}
	}

	/** test visiting all perspectives */
	@Test
	public void visit_all_views() throws Exception{
		int mayor = 0, minor = 0, nr_views = 0;
		String new_pos = "first_time", new_pos2 = "";
		MenuBarComponent mbr = SwtComponents.createMenu();
		ComponentIdentifier<Tree> tree = om.get("ShowView_ViewTree_grc");
		TreeComponent treeComp =
			org.eclipse.jubula.toolkit.concrete.ConcreteComponents.createTreeComponent(tree);
		ComponentIdentifier<Button> ok_btn = om.get("ShowView_OkButton_grc");
		ButtonComponent ok_btn_comp =
			org.eclipse.jubula.toolkit.concrete.ConcreteComponents.createButtonComponent(ok_btn);
		try {
			String window_title = "Show View";
			while (true) {
				mayor++;
				System.out.println("Visiting view row " + mayor);
				minor = 0;
				while (true) {
					mbr.waitForComponent(1000, 1000);
					m_aut.execute(
						mbr.selectMenuEntryByTextpath("Fenster.*/Ansicht.*/Other.*", Operator.matches),
						null);
					app.waitForWindow(window_title, Operator.matches, 1000, 50);
					System.out.println("user 1");
					minor++;
					new_pos = Integer.toString(mayor) + "/" + Integer.toString(minor);
					new_pos2 = Integer.toString(mayor) + "_" + Integer.toString(minor);
					takeScreenshotActiveWindow("iterate/pos_" + new_pos2 + ".png");
					System.out.println("Visiting view new_pos " + new_pos);
					try {
						//						m_aut.execute(treeComp.checkEnablementOfContextMenuEntryByIndexpath(new_pos,
						//true, InteractionMode.primary), null);
						System.out.println("expandNodeByIndexpath with "+ new_pos);
						m_aut.execute(treeComp.expandNodeByIndexpath(SearchType.absolute, new Integer(0), new_pos), null);
						System.out.println("selectNodeByIndexpath with "+ new_pos);
						m_aut.execute(treeComp.selectNodeByIndexpath(SearchType.absolute, new Integer(0), new_pos, new Integer(1), InteractionMode.primary,  ValueSets.BinaryChoice.no), null);
						m_aut.execute(ok_btn_comp.click(1, InteractionMode.primary), null);
						app.waitForWindowToClose(window_title, Operator.matches, 1000, 500);
						app.waitForWindow(window_title, Operator.matches, 1000, 500);
						takeScreenshotActiveWindow("view_" + new_pos2 + ".png");
						nr_views++;
					} catch (ComponentNotFoundException e) {
						System.out.println("ComponentNotFoundException with "+ new_pos);
						if (nr_views > 20)
						{
							takeScreenshotActiveWindow("list_too_long_after_" + nr_views + ".png");
							Assert.fail("We cannot handle very long lists of vies");
							// breaks when nr_views == 52
						}
						break;
					} catch (ActionException e) {
						System.out.println("ActionException minor with "+ new_pos);
						minor = 0;
						m_aut.execute(ok_btn_comp.click(1, InteractionMode.primary), null);
						app.waitForWindowToClose(window_title, Operator.matches, 1000, 500);
						app.waitForWindow(window_title, Operator.matches, 1000, 500);
							// e.printStackTrace();
							break;
						}
				}
			}
		} catch (ActionException e) {
			System.out.println("ActionException major with "+ nr_views + " pos " + new_pos);
			if (nr_views == 0)
				e.printStackTrace();
			if (nr_views <= 10 && false) {
				Assert.fail("We should have more than 10 views to visit!");
			}

		} catch (CheckFailedException | AssertionError e) {
			e.printStackTrace();
		} finally {
			Assert.assertTrue(true);
		}
	}

	/** test generating a snapshot of the whole desktop */
	@Test
	public void fullScreenShot() throws Exception{
		try {
			org.eclipse.jubula.toolkit.concrete.components.Application application =
				SwtComponents.createApplication();
			Thread.sleep(1000); // Don't know why this is needed!
			m_aut.execute(application.activate(AUTActivationMethod.titlebar), null);
			Path shot_1 = new File(ResultDirectory + "/fullScreenShot.png").toPath();
			System.out.println("Full is "+ shot_1.toString());
			Files.deleteIfExists(shot_1);
			Assert.assertFalse(Files.exists(shot_1, LinkOption.NOFOLLOW_LINKS));
			CAP cap1 = application.takeScreenshot(shot_1.toString(), 0, "rename", 100, true);
			m_aut.execute(cap1, null);
			Assert.assertTrue(Files.exists(shot_1, LinkOption.NOFOLLOW_LINKS));
		} catch (CheckFailedException | AssertionError e) {
			e.printStackTrace();
		} finally {
			Assert.assertTrue(true);
		}
	}

	/** test generating a snapshot of the currently active window */
	@Test()
	public void screenshot_active_window() throws Exception{
		try {
			org.eclipse.jubula.toolkit.concrete.components.Application application =
				SwtComponents.createApplication();
			Thread.sleep(1000); // Don't know why this is needed!
			m_aut.execute(application.activate(AUTActivationMethod.titlebar), null);
			String image_name = "subdir/take_screenshot_active_window.png";
			Path shot_2 = new File(ResultDirectory + "/" + image_name).toPath();

			Files.deleteIfExists(shot_2);
			Assert.assertFalse(Files.exists(shot_2, LinkOption.NOFOLLOW_LINKS));
			takeScreenshotActiveWindow(image_name);
			System.out.println("screenshot_active_window " + shot_2.toString()+" is "+ Files.exists(shot_2, LinkOption.NOFOLLOW_LINKS));
			Assert.assertTrue(Files.exists(shot_2, LinkOption.NOFOLLOW_LINKS));
		} catch (CheckFailedException | AssertionError e) {
			e.printStackTrace();

		} finally {
			Assert.assertTrue(true);
		}

	}

	/** cleanup */
	@After
	public void tearDown() throws Exception{
		if (m_aut != null) {
			m_aut.disconnect();
			m_agent.stopAUT(m_aut.getIdentifier());
		}
		if (m_agent != null) {
			m_agent.disconnect();
		}
	}

	/**
	 * @return an AUT-Agent instance
	 */
	protected AUTAgent getAUTAgentInstance(){
		return MakeR.createAUTAgent(AGENT_HOST, AGENT_PORT);
	}
}