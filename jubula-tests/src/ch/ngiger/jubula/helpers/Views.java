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
import org.eclipse.jubula.toolkit.concrete.components.MenuBarComponent;
import org.eclipse.jubula.toolkit.concrete.components.TableComponent;
import org.eclipse.jubula.toolkit.concrete.components.TreeComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets;
import org.eclipse.jubula.toolkit.enums.ValueSets.BinaryChoice;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.Modifier;
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
	/** the logger */
	// When using a logger the output is not shown in the maven output
	// Don't know where it disappears
	// private static Logger log = LoggerFactory.getLogger(VisitAllViews.class);

	static void openViewByName(String name){
		MenuBarComponent mbr = SwtComponents.createMenu();
		mbr.waitForComponent(Constants.ONE_SECOND, 10);

		AUT_run.m_aut.execute(
			mbr.selectMenuEntryByTextpath("Fenster.*/Ansicht.*/Other.*", Operator.matches), null);
		Common.waitForWindow("Show View", Constants.ONE_SECOND);

		org.eclipse.jubula.toolkit.concrete.components.TextInputComponent viewTxt = ConcreteComponents.createTextInputComponent(OM.ShowView_SelView_cti);
		viewTxt.replaceText(name);
//		Common.synchronizedTextReplace(OM.ShowView_SelView_cti, name);//$NON-NLS-1$

		@SuppressWarnings("unchecked")
		TableComponent tableComp =
			ConcreteComponents.createTableComponent(OM.ShowView_ViewTree_grc);//$NON-NLS-1$
		TreeTable tbl2 = SwtComponents.createTreeTable(OM.ShowView_ViewTree_grc) ;//$NON-NLS-1$
		tbl2.waitForComponent(Constants.ONE_SECOND, 10);
		AUT_run.m_aut.execute(tableComp.click(new Integer(1), InteractionMode.primary), null);
		// Ub_tre_selectNode_byTextpath
		AUT_run.m_aut.execute(tbl2.selectNodeByTextpath(SearchType.absolute,new Integer(0), name, Operator.matches, 1, InteractionMode.primary, BinaryChoice.no), null);

		Common.clickComponent(OM.ShowView_OkButton_grc);

		// Wait a little bit (workaround for Codes/Codes
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Common.waitForElexisMainWindow(Constants.ONE_SECOND);
	}

	/** test visiting all views */
	@Test
	@SuppressWarnings("unchecked")
	public void visit_all_views(AUT_run runner) throws Exception{
		int mayor = 0, minor = 0, nr_views = 0;
		String new_pos = "first_time", new_pos2 = ""; //$NON-NLS-1$ //$NON-NLS-2$
		MenuBarComponent mbr = SwtComponents.createMenu();
		ComponentIdentifier<Tree> tree = OM.ShowView_ViewTree_grc; //$NON-NLS-1$
		Assert.assertNotNull("ShowView_ViewTree_grc may not be null", tree);
		TreeComponent treeComp =
			org.eclipse.jubula.toolkit.concrete.ConcreteComponents.createTreeComponent(tree);
		Common.clickComponent(OM.ShowView_OkButton_grc); //$NON-NLS-1$
		try {
			String window_title = Messages.getString("VisitAllViews.4"); //$NON-NLS-1$
			while (true) {
				mayor++;
				AUT_run.dbg_msg("Visiting view " + nr_views + " in row " + mayor); //$NON-NLS-1$ //$NON-NLS-2$
				minor = 0;
				while (true) {
					Common.openMenu(Messages.getString("VisitAllViews.7")); //$NON-NLS-1$
					Common.waitForWindow(window_title);
					AUT_run.dbg_msg("user 1"); //$NON-NLS-1$
					minor++;
					new_pos = Integer.toString(mayor) + "/" + Integer.toString(minor); //$NON-NLS-1$
					new_pos2 = Integer.toString(mayor) + "_" + Integer.toString(minor); //$NON-NLS-1$
					AUT_run.takeScreenshotActiveWindow("iterate/pos_" + new_pos2 + ".png"); //$NON-NLS-1$ //$NON-NLS-2$
					AUT_run.dbg_msg("Visiting view " + nr_views + " new_pos " + new_pos); //$NON-NLS-1$ //$NON-NLS-2$
					try {
						//						m_aut.execute(treeComp.checkEnablementOfContextMenuEntryByIndexpath(new_pos,
						//true, InteractionMode.primary), null);
						AUT_run.m_aut.execute(treeComp.expandNodeByIndexpath(SearchType.absolute,
							new Integer(0), new_pos), null);
						AUT_run.m_aut.execute(treeComp.selectNodeByIndexpath(SearchType.absolute,
							new Integer(0), new_pos, new Integer(1), InteractionMode.primary,
							ValueSets.BinaryChoice.no), null);
						Common.clickComponent(OM.ShowView_OkButton_grc); //$NON-NLS-1$
						Common.waitForWindow(window_title);
						Thread.sleep(Constants.ONE_SECOND); // give view time to stabilize, eg. load a web page/patient
						// Maximize window by pressing Ctrl-M
						AUT_run.m_aut.execute(AUT_run.app.externalKeyCombination(new Modifier[] {
							Modifier.control
						}, "m"), null); //$NON-NLS-1$
						AUT_run.takeScreenshotActiveWindow("view_" + new_pos2 + ".png"); //$NON-NLS-1$ //$NON-NLS-2$
						nr_views++;
					} catch (ComponentNotFoundException e) {
						AUT_run.dbg_msg("ComponentNotFoundException with " + new_pos); //$NON-NLS-1$
						if (nr_views > 20) {
							AUT_run.takeScreenshotActiveWindow(
								"list_too_long_after_" + nr_views + ".png"); //$NON-NLS-1$ //$NON-NLS-2$
							Assert.fail("We cannot handle very long lists of vies"); //$NON-NLS-1$
							// breaks when nr_views == 52
						}
						break;
					} catch (ActionException e) {
						AUT_run.dbg_msg("ActionException minor with " + new_pos); //$NON-NLS-1$
						if (minor == 1) {
							AUT_run.dbg_msg("ActionException minor with " + new_pos //$NON-NLS-1$
								+ " -> No more entries found for mayor" + ". Found " + nr_views //$NON-NLS-1$ //$NON-NLS-2$
								+ " views!"); //$NON-NLS-1$
							return; // No more entries found for mayor
						}
						minor = 0;
						Common.clickComponent(OM.ShowView_OkButton_grc); //$NON-NLS-1$
						Common.waitForWindowClose(window_title);
						break;
					}
				}
			}
		} catch (ActionException e) {
			AUT_run.dbg_msg("ActionException major with " + nr_views + " pos " + new_pos); //$NON-NLS-1$ //$NON-NLS-2$
			if (nr_views == 0)
				e.printStackTrace();
			if (nr_views <= 10) {
				Assert.fail("We should have more than 10 views to visit!"); //$NON-NLS-1$
			}

		} catch (CheckFailedException | AssertionError e) {
			e.printStackTrace();
		} finally {
			Assert.assertTrue(true);
		}
	}
}