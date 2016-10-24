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
package ch.ngiger.jubula.helpers;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.exceptions.ActionException;
import org.eclipse.jubula.client.exceptions.CheckFailedException;
import org.eclipse.jubula.client.exceptions.CommunicationException;
import org.eclipse.jubula.client.exceptions.ExecutionException;
import org.eclipse.jubula.toolkit.concrete.ConcreteComponents;
import org.eclipse.jubula.toolkit.concrete.components.Application;
import org.eclipse.jubula.toolkit.concrete.components.TableComponent;
import org.eclipse.jubula.toolkit.concrete.components.TreeComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets;
import org.eclipse.jubula.toolkit.enums.ValueSets.BinaryChoice;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.enums.ValueSets.SearchType;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.toolkit.swt.components.Tree;
import org.eclipse.jubula.toolkit.swt.components.TreeTable;
import org.eclipse.jubula.tools.ComponentIdentifier;
import org.junit.Assert;
import org.junit.Test;

import ch.ngiger.jubula.Messages;
import ch.ngiger.jubula.elexiscore.OM;

/** @author BREDEX GmbH */
public class Views extends Common {

	public Views(AUT aut, Application app){
		super(aut, app);
		Utils.dbg_msg("Views init " + m_aut + " app " + m_app);
	}

	void openViewByName(String name){
		openMenu("Fenster.*/Ansicht.*/Other.*");
		if (!waitForWindow("Show View", 5 * Constants.ONE_SECOND)) {
			Assert.fail("finishInstallSelectedSW: Unable to open Show View");
		}

		@SuppressWarnings("unchecked")
		org.eclipse.jubula.toolkit.concrete.components.TextInputComponent viewTxt =
			ConcreteComponents.createTextInputComponent(OM.ShowView_SelView_cti);
		viewTxt.replaceText(name);
		@SuppressWarnings("unchecked")
		TableComponent tableComp =
			ConcreteComponents.createTableComponent(OM.ShowView_ViewTree_grc);//$NON-NLS-1$
		@SuppressWarnings("unchecked")
		TreeTable tbl2 = SwtComponents.createTreeTable(OM.ShowView_ViewTree_grc);//$NON-NLS-1$
		tbl2.waitForComponent(Constants.ONE_SECOND, 10);
		AUT_run.m_aut.execute(tableComp.click(new Integer(1), InteractionMode.primary), null);
		AUT_run.m_aut.execute(tbl2.selectNodeByTextpath(SearchType.absolute, new Integer(0), name,
			Operator.matches, 1, InteractionMode.primary, BinaryChoice.no), null);

		clickComponent(OM.ShowView_OkButton_grc);
		Utils.sleep1second();
		waitForElexisMainWindow(Constants.ONE_SECOND);
	}

	private void closeAndReturnToElexis(){
		clickComponent(OM.ShowView_OkButton_grc); //$NON-NLS-1$
		waitForElexisMainWindow();
	}

	/** test visiting all views */
	@Test
	@SuppressWarnings("unchecked")
	public void visit_all_views() throws Exception{
		int major = 0, minor = 0, nr_views = 0;
		int restart_after = 25; // On my wheezy with a relatively small window I could open 37 view
		// With the Medelexis I had problems after 26 windows
		String new_pos = "first_time", new_pos2 = ""; //$NON-NLS-1$ //$NON-NLS-2$
		ComponentIdentifier<Tree> tree = OM.ShowView_ViewTree_grc; //$NON-NLS-1$
		Assert.assertNotNull("ShowView_ViewTree_grc may not be null", tree);
		TreeComponent treeComp =
			org.eclipse.jubula.toolkit.concrete.ConcreteComponents.createTreeComponent(tree);
		try {
			String window_title = Messages.getString("VisitAllViews.4"); //$NON-NLS-1$
			while (true) {
				try {
					major++;
					Utils.dbg_msg(
						String.format("Visiting view %d in row %d open %s", nr_views, major, //$NON-NLS-1$
							Messages.getString("VisitAllViews.7")));//$NON-NLS-1$
					minor = 0;
					while (true) {
						minor++;
						if (nr_views % restart_after == (restart_after - 1)) {
							Utils.dbg_msg("Restarting app as nr_views is: " + nr_views);
							AUT_run.takeScreenshotActiveWindow(m_aut, m_app,
								"window/before_restart_after_" + nr_views + ".png"); //$NON-NLS-1$ //$NON-NLS-2$
							m_aut = AUT_run.restartApp(m_aut);
							AUT_run.activate(m_aut);
							Utils.dbg_msg("After restarting app as nr_views is: " + nr_views);
							treeComp = org.eclipse.jubula.toolkit.concrete.ConcreteComponents
								.createTreeComponent(tree);
						}
						Utils.dbg_msg(String.format(
							"Visiting inner view %d in row major %d minor %d ", nr_views, major, //$NON-NLS-1$
							minor));//$NON-NLS-1$
						openMenu(Messages.getString("VisitAllViews.7")); //$NON-NLS-1$
						waitForWindow(window_title);
						new_pos = Integer.toString(major) + "/" + Integer.toString(minor); //$NON-NLS-1$
						new_pos2 = Integer.toString(major) + "_" + Integer.toString(minor); //$NON-NLS-1$
						try {
							AUT_run.m_aut.execute(treeComp.expandNodeByIndexpath(
								SearchType.absolute, new Integer(0), new_pos), null);
						} catch (ExecutionException | CommunicationException
								| IllegalArgumentException e) {
							Utils.dbg_msg("expandNodeByIndexpath for " + window_title + " new_pos "
								+ new_pos + " FAILED " + e.toString());
							if (minor == 1) {
								return;
							}
							closeAndReturnToElexis();
							minor = -1;
							break;
						}
						AUT_run.m_aut.execute(treeComp.selectNodeByIndexpath(SearchType.absolute,
							new Integer(0), new_pos, new Integer(1), InteractionMode.primary,
							ValueSets.BinaryChoice.no), null);
						nr_views++;
						closeAndReturnToElexis();
						maximixeView();
						// TODO: get name of selected view
						// Result<Object> txt = m_aut.execute(treeComp.readValue(), null);
						// String name = txt.getReturnValue();

						Utils.sleep1second();
						AUT_run.takeScreenshotActiveWindow(m_aut, m_app,
							"window/view_" + new_pos2 + ".png"); //$NON-NLS-1$ //$NON-NLS-2$
					}
				} catch (ActionException e) {
					Utils.dbg_msg(String.format(
						"ActionException2  new_pos %d major %d minor %d. After nr_views  %d", //$NON-NLS-1$
						new_pos, major, minor, nr_views));
					if (minor == 1) {
						Utils.dbg_msg(String.format(
							"ActionException2 minor with %s -> No more entries found for %d %d. Found  %d views.", //$NON-NLS-1$
							new_pos, major, minor, nr_views));
						return; // No more entries found for mayor
					}
				}
			}
		} catch (ActionException e) {
			Utils.dbg_msg(String.format("ActionException3 major with %d pos %s. Having %d views", //$NON-NLS-1$
				nr_views, new_pos, nr_views));
			if (nr_views == 0)
				e.printStackTrace();
			e.printStackTrace();

		} catch (CheckFailedException e) {
			Utils.dbg_msg("visit_all_views: error was " + e.getMessage());
			e.printStackTrace(Utils.getWriter());
			AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "window/CheckFailedException.png"); //$NON-NLS-1$
			e.printStackTrace();
		} finally

		{
			Utils.dbg_msg("my m-aut" + AUT_run.m_aut + " AUT_runs is " + AUT_run.m_aut);
			Utils.dbg_msg("visit_all_views: done. Found views: " + nr_views);
			Assert.assertTrue("We should have more than 10 views to visit!", nr_views >= 10); //$NON-NLS-1$
		}
	}
}