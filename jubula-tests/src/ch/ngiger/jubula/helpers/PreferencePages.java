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
import org.eclipse.jubula.client.Result;
import org.eclipse.jubula.client.exceptions.ActionException;
import org.eclipse.jubula.client.exceptions.CheckFailedException;
import org.eclipse.jubula.client.exceptions.CommunicationException;
import org.eclipse.jubula.client.exceptions.ComponentNotFoundException;
import org.eclipse.jubula.client.exceptions.ConfigurationException;
import org.eclipse.jubula.toolkit.concrete.components.Application;
import org.eclipse.jubula.toolkit.concrete.components.TreeComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.SearchType;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.toolkit.swt.components.Button;
import org.eclipse.jubula.toolkit.swt.components.Tree;
import org.eclipse.jubula.tools.ComponentIdentifier;
import org.eclipse.jubula.tools.internal.exception.AssertException;
import org.junit.Assert;

import ch.ngiger.jubula.Messages;
import ch.ngiger.jubula.elexiscore.OM;

/**
 * @author BREDEX GmbH
 */
@SuppressWarnings("restriction")
public class PreferencePages extends Common {

	public PreferencePages(AUT aut, Application app){
		super(aut, app);
		Utils.dbg_msg("Perspectives init " + m_aut + " app " + m_app);
	}

	boolean gotoPreferencPage(String position){
		String window_title = Messages.getString("VisitAllPreferencePages.4"); //$NON-NLS-1$
		Assert.assertTrue("gotoPreferencPage: waitForWindowClose " + window_title, waitForWindowClose(window_title));
		Assert.assertTrue("gotoPreferencPage: Elexis-MainWindow", waitForElexisMainWindow(Constants.ONE_SECOND));
		openMenu(Messages.getString("VisitAllPreferencePages.7")); //$NON-NLS-1$
		try {
			@SuppressWarnings("unchecked")
			ComponentIdentifier<Tree> tree = OM.Preferences_ItemChoice_tre; //$NON-NLS-1$
			TreeComponent treeComp = org.eclipse.jubula.toolkit.concrete.ConcreteComponents.createTreeComponent(tree);
			clickComponent(tree); // This click is only necessary after visiting "Security Storage"! Took me 3h to find it
			AUT_run.m_aut.execute(
				treeComp.selectNodeByIndexpath(SearchType.absolute, new Integer(0), position,
					new Integer(1), InteractionMode.primary, ValueSets.BinaryChoice.no),
				null);
		} catch (ActionException | ComponentNotFoundException e) {
			// Utils.dbg_msg("gotoPreferencPage e: " + position + " msg: " + e.getMessage()); //$NON-NLS-1$
			return false;
		}
		return true;
	}

	private String create_named_preference_screenshot(String prefix){
		try {
			@SuppressWarnings("unchecked")
			org.eclipse.jubula.toolkit.concrete.components.TextComponent txt_comp = SwtComponents.createTextComponent(OM.Preference_title_txt);
			Result<Object> res = m_aut.execute(txt_comp.readValue(), null);
			String name = res.getReturnValue();
			String pref_name = 	"preferences/" +  prefix + "_"+ name +".png";//$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
			AUT_run.takeScreenshotActiveWindow(m_aut, m_app, pref_name);
			return name;
		} catch (ActionException | ComponentNotFoundException e) {
			Utils.dbg_msg("create_named_preference_screenshot " + prefix + " unable to get text: " + e.getMessage()); //$NON-NLS-1$
			AUT_run.takeScreenshotActiveWindow(m_aut, m_app,
				"preferences/page_" + prefix + ".png"); //$NON-NLS-1$ //$NON-NLS-2$
			return prefix;
		}
	}

	/** test visiting all preferencePages */
	@SuppressWarnings("unchecked")
	public void visit_all_preferencePages() throws Exception{
		String new_pos = "first_time"; //$NON-NLS-1$ //$NON-NLS-2$
		int nr_preferencePages = 0;
		@SuppressWarnings("unused")
		ComponentIdentifier<Tree> tree = OM.Preferences_ItemChoice_tre; //$NON-NLS-1$
		ComponentIdentifier<Button> ok_btn = OM.Preferences_OkButton_grc; //$NON-NLS-1$
		ComponentIdentifier<Button> apply_btn = OM.Preferences_ApplyButton_grc; //$NON-NLS-1$
		ComponentIdentifier<Button> cancel_btn = OM.Preferences_Cancel_btn; //$NON-NLS-1$
		ComponentIdentifier<Button> reset_btn = OM.ResetPerspektive_OkButton_grc; //$NON-NLS-1$
		Assert.assertNotNull("Preferences_OkButton_grc may not be null", ok_btn);
		Assert.assertNotNull("Preferences_ApplyButton_grc may not be null", apply_btn);
		Assert.assertNotNull("Preferences_Cancel_btn may not be null", cancel_btn);
		Assert.assertNotNull("ResetPerspektive_OkButton_grc", reset_btn);
		try {
			int major = 1;
			while (true) {
				int minor = 1;
				new_pos = Integer.toString(major); //$NON-NLS-1$
				if (!gotoPreferencPage(new_pos)) {
					clickComponent(ok_btn);
					break;
				}
				nr_preferencePages++;
				create_named_preference_screenshot(new_pos);
				clickComponent(ok_btn);
				while (true) {
					new_pos = Integer.toString(major) + "/" + Integer.toString(minor); //$NON-NLS-1$
					if (!gotoPreferencPage(new_pos)) {
						clickComponent(ok_btn);
						break;
					}
					nr_preferencePages++;
					create_named_preference_screenshot(new_pos.replace("/", "_"));
					try {
						clickComponent(ok_btn);
						// the ok_btn is not present in the Security/Secure Storage!!
						// therefore we must catch also the ComponentNotFoundException
					} catch (ActionException | ComponentNotFoundException e) {
						Utils.dbg_msg("visit_all_preferencePages. must cancel. Got exception: "
							+ e.getMessage());
						AUT_run.takeScreenshotActiveWindow(m_aut, m_app,
							"preferences/cancel_" + new_pos.replace("/", "_") + ".png"); //$NON-NLS-1$ //$NON-NLS-2$
						clickComponent(ok_btn);
					}
					minor++;
				}
				major++;
			}
		} catch (ComponentNotFoundException | CommunicationException | ConfigurationException
				| CheckFailedException | ActionException | AssertException e) {
			Utils.dbg_msg("Got exception: " + e.getMessage());
			AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "preferences/" + new_pos.replace("/", "_") + "_exception.png"); //$NON-NLS-1$ //$NON-NLS-2$
			e.printStackTrace(Utils.getWriter());

		} finally {
			Utils.dbg_msg(
				"visit_all_preferencePages done. nr_preferencePages  is " + nr_preferencePages);
		}
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "preferences/last_page_" + new_pos.replace("/", "_") + ".png"); //$NON-NLS-1$ //$NON-NLS-2$
		Assert.assertTrue("Must visit at least 10 preferences", nr_preferencePages > 10);
	}
}