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

import ch.ngiger.jubula.Messages;

/** @author BREDEX GmbH */
public class PreferencePages {
	/** the logger */
	// When using a logger the output is not shown in the maven output
	// Don't know where it disappears
	// private static Logger log = LoggerFactory.getLogger(VisitAllPreferencePages.class);

	private boolean gotoPreferencPage(AUT_run runner, String position) {
		String window_title = Messages.getString("VisitAllPreferencePages.4"); //$NON-NLS-1$
		String elexisMainWindow = ".*Elexis.*";
		try  {
		AUT_run.app.waitForWindowToClose(window_title, Operator.matches, 1000,
			Constants.NR_MS_WAIT_AFTER_ACTION);
		AUT_run.app.waitForWindow(elexisMainWindow, Operator.matches, 1000,
			Constants.NR_MS_WAIT_AFTER_ACTION);

		mbr.waitForComponent(Constants.ONE_SECOND, Constants.NR_MS_WAIT_AFTER_ACTION);
		mbr.waitForComponent(Constants.ONE_SECOND, Constants.NR_MS_WAIT_AFTER_ACTION);
		AUT_run.m_aut.execute(mbr.selectMenuEntryByTextpath(
			Messages.getString("VisitAllPreferencePages.7"), Operator.matches), null); //$NON-NLS-1$
		AUT_run.m_aut.execute(treeComp.selectNodeByIndexpath(SearchType.absolute,
			                                                       new Integer(0), position, new Integer(1), InteractionMode.primary,
			                                                       ValueSets.BinaryChoice.no), null);
		} catch (ActionException e) {
			// AUT_run.dbg_msg("gotoPreferencPage " + position + " msg: " + e.getMessage()); //$NON-NLS-1$
			return false;
		}
		return true;
	}
	TreeComponent treeComp = null;
	ButtonComponent ok_btn_comp = null;
	MenuBarComponent mbr = SwtComponents.createMenu();

	/** test visiting all preferencePages */
	@SuppressWarnings("unchecked")
	@Test
	public void visit_all_preferencePages(AUT_run runner) throws Exception{
		String new_pos = "first_time", new_pos2 = ""; //$NON-NLS-1$ //$NON-NLS-2$
		ComponentIdentifier<Tree> tree = AUT_run.om.get("Preferences_ItemChoice_tre"); //$NON-NLS-1$
		treeComp =
			org.eclipse.jubula.toolkit.concrete.ConcreteComponents.createTreeComponent(tree);
		ComponentIdentifier<Button> ok_btn = AUT_run.om.get("Preferences_OkButton_grc"); //$NON-NLS-1$
		ComponentIdentifier<Button> apply_btn = AUT_run.om.get("Preferences_ApplyButton_grc"); //$NON-NLS-1$
		ComponentIdentifier<Button> cancel_btn = AUT_run.om.get("Preferences_Cancel_btn"); //$NON-NLS-1$
		ComponentIdentifier<Button> reset_btn = AUT_run.om.get("ResetPerspektive_OkButton_grc"); //$NON-NLS-1$
		Assert.assertNotNull("Preferences_OkButton_grc may not be null", ok_btn);
		Assert.assertNotNull("Preferences_ApplyButton_grc may not be null", apply_btn);
		Assert.assertNotNull("Preferences_Cancel_btn may not be null", cancel_btn);
		Assert.assertNotNull("ResetPerspektive_OkButton_grc", reset_btn);
		ok_btn_comp =
			org.eclipse.jubula.toolkit.concrete.ConcreteComponents.createButtonComponent(ok_btn);
		try {
			int mayor = 1, nr_preferencePages = 0;
			while (true) {
				int minor = 1;
				new_pos = Integer.toString(mayor); //$NON-NLS-1$
				if (!gotoPreferencPage(runner, new_pos))
				{
					AUT_run.m_aut.execute(ok_btn_comp.click(1, InteractionMode.primary), null);
					break;
				}
				nr_preferencePages++;
				runner.takeScreenshotActiveWindow("preferences/page_" + new_pos + ".png"); //$NON-NLS-1$ //$NON-NLS-2$
				AUT_run.m_aut.execute(ok_btn_comp.click(1, InteractionMode.primary), null);
				while (true) {
					new_pos = Integer.toString(mayor) + "/" + Integer.toString(minor); //$NON-NLS-1$
					if (!gotoPreferencPage(runner, new_pos))
					{
						AUT_run.m_aut.execute(ok_btn_comp.click(1, InteractionMode.primary), null);
						break;
					}
					nr_preferencePages++;
					runner.takeScreenshotActiveWindow("preferences/page_" + new_pos.replace("/", "_") + ".png"); //$NON-NLS-1$ //$NON-NLS-2$
					AUT_run.m_aut.execute(ok_btn_comp.click(1, InteractionMode.primary), null);
					minor++;
				}
				mayor++;
			}
		} finally {
			Assert.assertTrue(true);
		}
	}
}