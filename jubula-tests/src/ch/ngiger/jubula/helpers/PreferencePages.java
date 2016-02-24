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
import org.eclipse.jubula.client.exceptions.ComponentNotFoundException;
import org.eclipse.jubula.client.exceptions.ConfigurationException;
import org.eclipse.jubula.toolkit.concrete.components.Application;
import org.eclipse.jubula.toolkit.concrete.components.ButtonComponent;
import org.eclipse.jubula.toolkit.concrete.components.TreeComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.SearchType;
import org.eclipse.jubula.toolkit.swt.components.Button;
import org.eclipse.jubula.toolkit.swt.components.Tree;
import org.eclipse.jubula.tools.ComponentIdentifier;
import org.eclipse.jubula.tools.internal.exception.AssertException;
import org.junit.Assert;
import org.junit.Test;

import ch.ngiger.jubula.Messages;
import ch.ngiger.jubula.elexiscore.OM;

/** @author BREDEX GmbH */
@SuppressWarnings("restriction")
public class PreferencePages {

	private Common runner = null;

	public PreferencePages(AUT aut, Application app){
		runner = new Common(aut, app);
	}

	boolean gotoPreferencPage(String position){
		String window_title = Messages.getString("VisitAllPreferencePages.4"); //$NON-NLS-1$
		// AUT_run.dbg_msg("gotoPreferencPage: " + position);
		runner.waitForWindowClose(window_title);
		runner.waitForElexisMainWindow(Constants.ONE_SECOND);
		runner.openMenu(Messages.getString("VisitAllPreferencePages.7")); //$NON-NLS-1$
		try {
			AUT_run.m_aut.execute(
				treeComp.selectNodeByIndexpath(SearchType.absolute, new Integer(0), position,
					new Integer(1), InteractionMode.primary, ValueSets.BinaryChoice.no),
				null);
		} catch (ActionException e) {
			Utils.dbg_msg("gotoPreferencPage " + position + " msg: " + e.getMessage()); //$NON-NLS-1$
			return false;
		}
		// AUT_run.dbg_msg("gotoPreferencPage " + position + " done"); //$NON-NLS-1$
		return true;
	}

	TreeComponent treeComp = null;
	ButtonComponent ok_btn_comp = null;

	/** test visiting all preferencePages */
	@SuppressWarnings({
		"unchecked"
	})
	@Test
	public void visit_all_preferencePages() throws Exception{
		String new_pos = "first_time"; //$NON-NLS-1$ //$NON-NLS-2$
		int nr_preferencePages = 0;
		ComponentIdentifier<Tree> tree = OM.Preferences_ItemChoice_tre; //$NON-NLS-1$
		treeComp = org.eclipse.jubula.toolkit.concrete.ConcreteComponents.createTreeComponent(tree);
		ComponentIdentifier<Button> ok_btn = OM.Preferences_OkButton_grc; //$NON-NLS-1$
		ComponentIdentifier<Button> apply_btn = OM.Preferences_ApplyButton_grc; //$NON-NLS-1$
		ComponentIdentifier<Button> cancel_btn = OM.Preferences_Cancel_btn; //$NON-NLS-1$
		ComponentIdentifier<Button> reset_btn = OM.ResetPerspektive_OkButton_grc; //$NON-NLS-1$
		Assert.assertNotNull("Preferences_OkButton_grc may not be null", ok_btn);
		Assert.assertNotNull("Preferences_ApplyButton_grc may not be null", apply_btn);
		Assert.assertNotNull("Preferences_Cancel_btn may not be null", cancel_btn);
		Assert.assertNotNull("ResetPerspektive_OkButton_grc", reset_btn);
		ok_btn_comp =
			org.eclipse.jubula.toolkit.concrete.ConcreteComponents.createButtonComponent(ok_btn);
		try {
			int major = 1;
			while (true) {
				int minor = 1;
				new_pos = Integer.toString(major); //$NON-NLS-1$
				if (!gotoPreferencPage(new_pos)) {
					runner.clickComponent(ok_btn);
					break;
				}
				nr_preferencePages++;
				Utils.takeScreenshotActiveWindow("preferences/page_" + new_pos + ".png"); //$NON-NLS-1$ //$NON-NLS-2$
				runner.clickComponent(ok_btn);
				while (true) {
					new_pos = Integer.toString(major) + "/" + Integer.toString(minor); //$NON-NLS-1$
					if (!gotoPreferencPage(new_pos)) {
						runner.clickComponent(ok_btn);
						break;
					}
					nr_preferencePages++;
					Utils.takeScreenshotActiveWindow(
						"preferences/page_" + new_pos.replace("/", "_") + ".png"); //$NON-NLS-1$ //$NON-NLS-2$
					try {
						runner.clickComponent(ok_btn);
					} catch (ActionException e) {
						// happens with security!
						Utils.dbg_msg("visit_all_preferencePages. must cancel. Got exception: " + e.getMessage());
						Utils.takeScreenshotActiveWindow(
							"preferences/cancel_" + new_pos.replace("/", "_") + ".png"); //$NON-NLS-1$ //$NON-NLS-2$
						runner.clickComponent(cancel_btn);
					}
					minor++;
				}
				major++;
			}
		} catch (ComponentNotFoundException | CommunicationException | ConfigurationException
				| CheckFailedException | ActionException | AssertException e) {
			Utils.dbg_msg("Got exception: " + e.getMessage());
			Utils.takeScreenshotActiveWindow("preferences/exception.png"); //$NON-NLS-1$
			e.printStackTrace(Utils.writer);

		} finally {
			Utils.dbg_msg("visit_all_preferencePages done. nr_preferencePages  is " + nr_preferencePages);
		}
		Utils.takeScreenshotActiveWindow("preferences/last_page.png"); //$NON-NLS-1$
		Assert.assertTrue("Must visit at least 10 preferences", nr_preferencePages > 10);
	}
}