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
import org.eclipse.jubula.toolkit.enums.ValueSets.BinaryChoice;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.enums.ValueSets.SearchType;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.toolkit.swt.components.TreeTable;
import org.eclipse.jubula.tools.ComponentIdentifier;

import ch.ngiger.jubula.elexiscore.OM;

/** @author BREDEX GmbH */
public class Software {
	private static String root = "sw_inst/";

	private static void handleAboutDetail(String abbrev, String name){
		@SuppressWarnings("rawtypes")
		ComponentIdentifier tab_id =
			OM.AboutElexisOpenSource_ElexisOpenSourceInstallatio0_TabFolder_1_tpn;
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
		String about_title = "About.*"; // only OpenSource Elexis has Elexis
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
		map.forEach((abbrev, name) -> handleAboutDetail(abbrev, name));

		Common.pressEnter();
		// 		Common.clickButton(OM.AboutElexisOpenSource_ElexisOpenSourceInstallatio0_Close_btn); //$NON-NLS-1$
		Common.waitForWindowClose(details_title);

		Common.clickComponent(OM.SW_about_ok_btn); //$NON-NLS-1$
		Common.waitForWindowClose(about_title);
	}

	private static void swInitAll(){
		String select_base = ".*Base.*";
		String menu_install = "Hilfe/Neue Software installieren";

		// Open SW Install Window
		Common.openMenu(menu_install);

		// Select all SW from all sites
		@SuppressWarnings("unchecked")
		ComboComponent combo = SwtComponents.createComboComponent(OM.SW_update_select_site_combo);

		// Select all SW from all sites
		AUT_run.m_aut.execute(
			combo.selectEntryByValue(select_base, Operator.matches, SearchType.absolute), null);
		// Three seconds were not enough when running from the command line
		Common.sleepMs(Constants.ONE_SECOND * 10);

	}

	private static void finishInstallSelectedSW(){
		String install_title = "Install";
		String installing_title = "Installing Software";
		String updates_title = "Software Updates";
		@SuppressWarnings("rawtypes")
		ComponentIdentifier finish_button = OM.SW_Install_Finish_btn;
		@SuppressWarnings("rawtypes")
		ComponentIdentifier cancel_button = OM.SW_Install_Cancel_btn;

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
		if (Common.componentIsEnabled(finish_button)) {
			AUT_run.dbg_msg("SW_Install_Finish_btn is enabled"); //$NON-NLS-1$;
			Common.clickComponent(finish_button);
		} else {
			AUT_run.dbg_msg("SW_Install_Finish_btn is NOT enabled. Already updated?");
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

	public static void installFeature(String feature_name){
		if (AUT_run.config.get(Constants.AUT_EXE) != null
			&& AUT_run.config.get(Constants.AUT_EXE).toLowerCase().contains("medelexis")) {
			AUT_run.dbg_msg("AUT_EXE is medelexis" + AUT_run.config.get(Constants.AUT_EXE)
				+ ". Don't know howto install " + feature_name);
			return;
		}
		AUT_run.dbg_msg("installFeature " + feature_name);
		swInitAll();
		Common.synchronizedTextReplace(OM.Install_Text_1_txf, feature_name);
		AUT_run.takeScreenshotActiveWindow(root + feature_name + "_1.png"); //$NON-NLS-1$
		Common.sleep1second();
		@SuppressWarnings("unchecked")
		TreeTable tre = SwtComponents.createTreeTable(OM.Install_Tree_1_tre);
		Common.waitForComponent(OM.Install_Tree_1_tre);
		AUT_run.m_aut.execute(tre.selectNodeByIndexpath(SearchType.absolute, 0, "1/1", 1,
			InteractionMode.primary, BinaryChoice.no), null);
		AUT_run.takeScreenshotActiveWindow(root + feature_name + "_2.png"); //$NON-NLS-1$
		Common.sleep1second();
		AUT_run.m_aut.execute(
			tre.toggleCheckboxOnNodeByIndexpath(SearchType.absolute, new Integer(0), "1/1"), null);
		AUT_run.takeScreenshotActiveWindow(root + feature_name + "_3.png"); //$NON-NLS-1$
		Common.sleep1second();
		finishInstallSelectedSW();
		AUT_run.dbg_msg("installFeature finished " + feature_name);
	}

	class CallExitViaMenu extends Thread {
		public CallExitViaMenu(String dummy) {
			super(dummy);
			AUT_run.dbg_msg("dummy is: " + dummy);
		}
	 
		@Override
		public void run() {
		}
	}
	public static void installAllFeatures(){
		if (AUT_run.config.get(Constants.AUT_EXE) != null
			&& AUT_run.config.get(Constants.AUT_EXE).toLowerCase().contains("medelexis")) {
			Common.sleep1second();
			Runnable r = new Runnable() {
				@Override
				public void run() {
					AUT_run.dbg_msg("Calling Datei Beenden");
					Common.openMenu("Datei/Beenden");
					AUT_run.dbg_msg("Wait for end");
				}
			};
			AUT_run.dbg_msg("before t");
			Thread t = new Thread(r);
			AUT_run.dbg_msg("before run");
			t.run();
			AUT_run.dbg_msg("after run");
			int j = 0;
			while (j < 30 && AUT_run.m_aut.isConnected())
			{
				j++;
				AUT_run.dbg_msg("Wait for installation ended " + j);
				Common.sleep1second();
			}
			return;
		}
		AUT_run.dbg_msg("installAllFeatures finished");
		swInitAll();
		Common.clickComponent(OM.SW_Install_SelectAll_btn);
		finishInstallSelectedSW();
		AUT_run.dbg_msg("installAllFeatures finished");
	}
}