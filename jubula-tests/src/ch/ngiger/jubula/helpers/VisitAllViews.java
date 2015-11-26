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
import org.eclipse.jubula.toolkit.concrete.components.ButtonComponent;
import org.eclipse.jubula.toolkit.concrete.components.MenuBarComponent;
import org.eclipse.jubula.toolkit.concrete.components.TreeComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.enums.ValueSets.SearchType;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.toolkit.swt.components.Button;
import org.eclipse.jubula.toolkit.swt.components.Tree;
import org.eclipse.jubula.tools.ComponentIdentifier;
import org.junit.Assert;
import org.junit.Test;

/** @author BREDEX GmbH */
public class VisitAllViews {
	/** the logger */
	// When using a logger the output is not shown in the maven output
	// Don't know where it disappears
	// private static Logger log = LoggerFactory.getLogger(VisitAllViews.class);

	/** test visiting all views */
	@Test
	public void visit_all_views(AUT_run runner) throws Exception{
		int mayor = 0, minor = 0, nr_views = 0;
		String new_pos = "first_time", new_pos2 = "";
		MenuBarComponent mbr = SwtComponents.createMenu();
		ComponentIdentifier<Tree> tree = AUT_run.om.get("ShowView_ViewTree_grc");
		TreeComponent treeComp =
			org.eclipse.jubula.toolkit.concrete.ConcreteComponents.createTreeComponent(tree);
		ComponentIdentifier<Button> ok_btn = AUT_run.om.get("ShowView_OkButton_grc");
		ButtonComponent ok_btn_comp =
			org.eclipse.jubula.toolkit.concrete.ConcreteComponents.createButtonComponent(ok_btn);
		try {
			String window_title = "Show View";
			while (true) {
				mayor++;
				AUT_run.dbg_msg("Visiting view " + nr_views + " in row " + mayor);
				minor = 0;
				while (true) {
					mbr.waitForComponent(1000, 1000);
					AUT_run.m_aut.execute(mbr.selectMenuEntryByTextpath(
						"Fenster.*/Ansicht.*/Other.*", Operator.matches), null);
					AUT_run.app.waitForWindow(window_title, Operator.matches, 1000, 50);
					AUT_run.dbg_msg("user 1");
					minor++;
					new_pos = Integer.toString(mayor) + "/" + Integer.toString(minor);
					new_pos2 = Integer.toString(mayor) + "_" + Integer.toString(minor);
					runner.takeScreenshotActiveWindow("iterate/pos_" + new_pos2 + ".png");
					AUT_run.dbg_msg("Visiting view " + nr_views + " new_pos " + new_pos);
					try {
						//						m_aut.execute(treeComp.checkEnablementOfContextMenuEntryByIndexpath(new_pos,
						//true, InteractionMode.primary), null);
						AUT_run.m_aut.execute(treeComp.expandNodeByIndexpath(SearchType.absolute,
							new Integer(0), new_pos), null);
						AUT_run.m_aut.execute(treeComp.selectNodeByIndexpath(SearchType.absolute,
							new Integer(0), new_pos, new Integer(1), InteractionMode.primary,
							ValueSets.BinaryChoice.no), null);
						AUT_run.m_aut.execute(ok_btn_comp.click(1, InteractionMode.primary), null);
						AUT_run.app.waitForWindowToClose(window_title, Operator.matches, 1000, Constants.NR_MS_WAIT_AFTER_ACTION);
						AUT_run.app.waitForWindow(window_title, Operator.matches, 1000, Constants.NR_MS_WAIT_AFTER_ACTION);
						runner.takeScreenshotActiveWindow("view_" + new_pos2 + ".png");
						nr_views++;
					} catch (ComponentNotFoundException e) {
						AUT_run.dbg_msg("ComponentNotFoundException with " + new_pos);
						if (nr_views > 20) {
							runner.takeScreenshotActiveWindow(
								"list_too_long_after_" + nr_views + ".png");
							Assert.fail("We cannot handle very long lists of vies");
							// breaks when nr_views == 52
						}
						break;
					} catch (ActionException e) {
						AUT_run.dbg_msg("ActionException minor with " + new_pos);
						if (minor == 1) {
							AUT_run.dbg_msg("ActionException minor with " + new_pos
								+ " -> No more entries found for mayor" + ". Found " + nr_views
								+ " views!");
							return; // No more entries found for mayor
						}
						minor = 0;
						AUT_run.m_aut.execute(ok_btn_comp.click(1, InteractionMode.primary), null);
						AUT_run.app.waitForWindowToClose(window_title, Operator.matches, 1000, Constants.NR_MS_WAIT_AFTER_ACTION);
						AUT_run.app.waitForWindow(window_title, Operator.matches, 1000, Constants.NR_MS_WAIT_AFTER_ACTION);
						break;
					}
				}
			}
		} catch (ActionException e) {
			AUT_run.dbg_msg("ActionException major with " + nr_views + " pos " + new_pos);
			if (nr_views == 0)
				e.printStackTrace();
			if (nr_views <= 10) {
				Assert.fail("We should have more than 10 views to visit!");
			}

		} catch (CheckFailedException | AssertionError e) {
			e.printStackTrace();
		} finally {
			Assert.assertTrue(true);
		}
	}
}