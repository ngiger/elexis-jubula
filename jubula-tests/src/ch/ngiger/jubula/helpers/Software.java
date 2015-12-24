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

import java.util.HashMap;

import org.eclipse.jubula.toolkit.concrete.components.ComboComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.enums.ValueSets.SearchType;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.tools.ComponentIdentifier;

import ch.ngiger.jubula.elexiscore.OM;

/** @author BREDEX GmbH */
public class Software {
	private static String root = "sw_inst";

	private static void handleAboutDetail(String abbrev, String name) {
		@SuppressWarnings("rawtypes")
		ComponentIdentifier tab_id = OM.AboutElexisOpenSource_ElexisOpenSourceInstallatio0_TabFolder_1_tpn;
		// Select tab, take screenshot and save
		AUT_run.dbg_msg("handleAboutDetail: " + abbrev + " => " + name);
		AUT_run.m_aut.execute(AUT_run.app.copyTextToClipboard("empty"), null);
		Common.selectTabByValue(tab_id, name);
		Common.sleep1second(); // It takes some time to construct the view
		AUT_run.takeScreenshotActiveWindow(root + "about_" + abbrev + ".png");
		String info = Common.getTextFromCompent(tab_id);
		if (info != null && !info.startsWith("empty")) {
			Common.writeStringToResultsFile(info, root + "about_" + abbrev + ".txt");
		}
	}

	public static void showAbout(String add){
		String menu_about = "Hilfe/.*Elexis.*";
		String about_title = "About.*Elexis.*";
		String details_title = ".*Installation Details.*";
		root = "sw_inst/" + add + "/";

		Common.openMenu(menu_about);
		Common.waitForWindow(about_title);
		AUT_run.takeScreenshotActiveWindow(root + "about.png"); //$NON-NLS-1$

		Common.clickComponent(OM.SW_About_Detail_btn); //$NON-NLS-1$
		Common.waitForWindow(details_title);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("configuration", "Configuration"); //$NON-NLS-1$
		map.put("history", "Update Chronik"); //$NON-NLS-1$
		map.put("installed", "Installierte Software"); //$NON-NLS-1$
		map.put("plugins", "Plug.*"); //$NON-NLS-1$
		map.forEach( (abbrev, name) -> handleAboutDetail(abbrev, name));

		Common.pressEnter();
// 		Common.clickButton(OM.AboutElexisOpenSource_ElexisOpenSourceInstallatio0_Close_btn); //$NON-NLS-1$
		Common.waitForWindowClose(details_title);

		Common.clickComponent(OM.SW_about_ok_btn); //$NON-NLS-1$
		Common.waitForWindowClose(about_title);
	}

	@SuppressWarnings("unchecked")
	public static void installAllFeatures(){
		String menu_install = "Hilfe/Neue Software installieren";
		String install_title = "Install";
		String select_base = ".*Base.*";
		String installing_title = "Installing Software";
		String updates_title = "Software Updates";
		ComponentIdentifier finish_button = OM.SW_Install_Finish_btn;
		ComponentIdentifier cancel_button = OM.SW_Install_Cancel_btn;

		// Open SW Install Window
		Common.openMenu(menu_install);

		// Select all SW from all sites
		ComboComponent combo =
			SwtComponents.createComboComponent(OM.SW_update_select_site_combo);

		// Select all SW from all sites
		AUT_run.m_aut.execute(
			combo.selectEntryByValue(select_base, Operator.matches, SearchType.absolute), null);
		// Three seconds were not enough when running from the command line
		Common.sleepMs(Constants.ONE_SECOND * 10);
		Common.clickComponent(OM.SW_Install_SelectAll_btn);

		// SW_check_sw_upgrade_nessarry
		// Take a screenshot at this crucial point!
		// Wait 1 second to be sure the text gets displayed
		Common.sleep1second();
		AUT_run.takeScreenshotActiveWindow(root + "sw_inst-before-next.png"); //$NON-NLS-1$;
		Common.clickComponent(OM.SW_Install_Next_btn);
		Common.sleep1second();

		String sw_details = Common.getTextFromCompent(OM.Install_SW_Details);
		Common.writeStringToResultsFile(sw_details, "sw_inst-details.log"); //$NON-NLS-1$;
		Common.sleep1second();
		AUT_run.takeScreenshotActiveWindow(root + "sw-has-updates-or-not.png"); //$NON-NLS-1$;
		if (Common.componentIsEnabled(finish_button))
		{
			AUT_run.dbg_msg("SW_Install_Finish_btn is enabled"); //$NON-NLS-1$;
			Common.clickComponent(finish_button);
		} else {
			AUT_run.dbg_msg("SW_Install_Finish_btn is enabled. Already updated?");
			Common.clickComponent(cancel_button);//$NON-NLS-1$
			Common.waitForWindowClose("Install", 5 * Constants.ONE_SECOND);
			return;
		}
		Common.waitForWindowClose(install_title, 5 * Constants.ONE_SECOND);

		Common.waitForWindow(installing_title, 15 * Constants.ONE_SECOND);
		// Comment: We assume -Declipse.p2.unsignedPolicy=allow passed as vmarg to the application
		// Else we would have to activate "SW_SecurityWarning_OK_btn"
		Common.waitForWindowClose(installing_title, 180 * Constants.ONE_SECOND);

		Common.waitForWindow(updates_title, 5 * Constants.ONE_SECOND);

		// Click on "No". If we clicked "now", we could not detect restart of application
		Common.clickComponent(OM.SW_Update_Dialog_no);
		Common.waitForWindowClose(updates_title, 15 * Constants.ONE_SECOND);
	}
}