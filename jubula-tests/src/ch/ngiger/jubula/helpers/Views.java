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

import org.eclipse.jubula.client.exceptions.ActionException;
import org.eclipse.jubula.client.exceptions.CheckFailedException;
import org.eclipse.jubula.client.exceptions.ComponentNotFoundException;
import org.eclipse.jubula.toolkit.concrete.ConcreteComponents;
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
public class Views {

	static void openViewByName(String name){
		Common.openMenu("Fenster.*/Ansicht.*/Other.*");
		Common.waitForWindow("Show View", Constants.ONE_SECOND);

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

		Common.clickComponent(OM.ShowView_OkButton_grc);
		Common.sleep1second();
		Common.waitForElexisMainWindow(Constants.ONE_SECOND);
	}

	/** test visiting all views */
	@Test
	@SuppressWarnings("unchecked")
	public void visit_all_views(AUT_run runner) throws Exception{
		int major = 0, minor = 0, nr_views = 0;
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
					AUT_run.dbg_msg(
						String.format("Visiting view %d in row %d open %s", nr_views, major, //$NON-NLS-1$
							Messages.getString("VisitAllViews.7")));//$NON-NLS-1$
					minor = 0;
					while (true) {
						minor++;
						Common.openMenu(Messages.getString("VisitAllViews.7")); //$NON-NLS-1$
						Common.waitForWindow(window_title);
						AUT_run.dbg_msg("window_title " + window_title); //$NON-NLS-1$
						new_pos = Integer.toString(major) + "/" + Integer.toString(minor); //$NON-NLS-1$
						new_pos2 = Integer.toString(major) + "_" + Integer.toString(minor); //$NON-NLS-1$
						try {
							//						m_aut.execute(treeComp.checkEnablementOfContextMenuEntryByIndexpath(new_pos,
							//true, InteractionMode.primary), null);
							AUT_run.m_aut.execute(treeComp.expandNodeByIndexpath(
								SearchType.absolute, new Integer(0), new_pos), null);
							AUT_run.m_aut.execute(treeComp.selectNodeByIndexpath(
								SearchType.absolute, new Integer(0), new_pos, new Integer(1),
								InteractionMode.primary, ValueSets.BinaryChoice.no), null);
							Common.clickComponent(OM.ShowView_OkButton_grc); //$NON-NLS-1$
							Common.waitForElexisMainWindow();
							Common.sleep1second(); // give view time to stabilize, eg. load a web page/patient
							Common.maximixeView();
							Common.sleep1second();
							AUT_run.takeScreenshotActiveWindow("view_" + new_pos2 + ".png"); //$NON-NLS-1$ //$NON-NLS-2$
							nr_views++;
						} catch (ComponentNotFoundException e) {
							if (nr_views > 20) {
								AUT_run.takeScreenshotActiveWindow(
									"list_too_long_after_" + nr_views + ".png"); //$NON-NLS-1$ //$NON-NLS-2$
								Assert.fail("We cannot handle very long lists of vies"); //$NON-NLS-1$
								// breaks when nr_views == 52
							}
							break;
						} catch (ActionException e) {
							if (minor == 1) {
								AUT_run.dbg_msg(String.format(
									"ActionException minor with %s -> No more entries found for %d %d. Found  %d", //$NON-NLS-1$
									new_pos, major, minor, nr_views));
								AUT_run.takeScreenshotActiveWindow("minor 1.png"); //$NON-NLS-1$
								return; // No more entries found for mayor
							}
							minor = 0;
							AUT_run.takeScreenshotActiveWindow(new_pos + "_minor 0.png"); //$NON-NLS-1$
							Common.clickComponent(OM.ShowView_OkButton_grc); //$NON-NLS-1$
							Common.waitForWindowClose(window_title);
							break;
						}
					}
				} catch (ActionException e) {
					if (minor == 1) {
						AUT_run.dbg_msg(String.format(
							"ActionException minor with %s -> No more entries found for %d %d. Found  %d views.", //$NON-NLS-1$
							new_pos, major, minor, nr_views));
						return; // No more entries found for mayor
					}
				}
			}
		} catch (ActionException e) {
			AUT_run.dbg_msg(String.format("ActionException major with %d pos %s. Having %d views", //$NON-NLS-1$
				nr_views, new_pos, nr_views));
			if (nr_views == 0)
				e.printStackTrace();
			e.printStackTrace();

		} catch (CheckFailedException | AssertionError e) {
			AUT_run.dbg_msg("visit_all_views: error was " + e.getMessage());
			e.printStackTrace();
			AUT_run.takeScreenshotActiveWindow("CheckFailedException.png"); //$NON-NLS-1$
			e.printStackTrace();
		} finally {
			AUT_run.dbg_msg("visit_all_views: done. Found views: " + nr_views);
			Assert.assertTrue("We should have more than 10 views to visit!", nr_views >= 10 ); //$NON-NLS-1$
		}
	}
}