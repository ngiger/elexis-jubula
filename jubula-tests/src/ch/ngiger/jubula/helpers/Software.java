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

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.toolkit.concrete.components.Application;
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

	private Common runner = null;

	public Software(AUT aut, Application app){
		runner = new Common(aut, app);
	}


	private static String root = "sw_inst/";

	private void handleAboutDetail(String abbrev, String name){
		@SuppressWarnings("rawtypes")
		ComponentIdentifier tab_id =
			OM.AboutElexisOpenSource_ElexisOpenSourceInstallatio0_TabFolder_1_tpn;
		// Select tab, take screenshot and save
		Utils.dbg_msg("handleAboutDetail: " + abbrev + " => " + name);
		AUT_run.m_aut.execute(AUT_run.elexis.copyTextToClipboard("empty"), null);
		runner.selectTabByValue(tab_id, name);
		Utils.sleep1second(); // It takes some time to construct the view
		Utils.takeScreenshotActiveWindow(root + "about_" + abbrev + ".png");
		String info = runner.getTextFromCompent(tab_id);
		if (info != null && !info.startsWith("empty")) {
			runner.writeStringToResultsFile(info, root + "about_" + abbrev + ".txt");
		}
	}

	public void showAbout(String add){
		String menu_about = "Hilfe/.*Elexis.*";
		String about_title = "About.*"; // only OpenSource Elexis has Elexis
		String details_title = ".*Installation Details.*";
		root = "sw_inst/" + add + "/";

		runner.openMenu(menu_about);
		runner.waitForWindow(about_title);
		Utils.takeScreenshotActiveWindow(root + "about.png"); //$NON-NLS-1$

		runner.clickComponent(OM.SW_About_Detail_btn); //$NON-NLS-1$
		runner.waitForWindow(details_title);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("configuration", "Configuration"); //$NON-NLS-1$
		map.put("history", "Update Chronik"); //$NON-NLS-1$
		map.put("installed", "Installierte Software"); //$NON-NLS-1$
		map.put("plugins", "Plug.*"); //$NON-NLS-1$
		map.forEach((abbrev, name) -> handleAboutDetail(abbrev, name));

		runner.pressEnter();
		// 		runner.clickButton(OM.AboutElexisOpenSource_ElexisOpenSourceInstallatio0_Close_btn); //$NON-NLS-1$
		runner.waitForWindowClose(details_title);

		runner.clickComponent(OM.SW_about_ok_btn); //$NON-NLS-1$
		runner.waitForWindowClose(about_title);
	}

	private void swInitAll(){
		String select_base = ".*Base.*";
		String menu_install = "Hilfe/Neue Software installieren";

		// Open SW Install Window
		runner.openMenu(menu_install);

		// Select all SW from all sites
		@SuppressWarnings("unchecked")
		ComboComponent combo = SwtComponents.createComboComponent(OM.SW_update_select_site_combo);

		// Select all SW from all sites
		AUT_run.m_aut.execute(
			combo.selectEntryByValue(select_base, Operator.matches, SearchType.absolute), null);
		// Three seconds were not enough when running from the command line
		Utils.sleepMs(Constants.ONE_SECOND * 10);

	}

	private void finishInstallSelectedSW(){
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
		Utils.sleep1second();
		Utils.takeScreenshotActiveWindow(root + "sw_inst-before-next.png"); //$NON-NLS-1$;
		runner.clickComponent(OM.SW_Install_Next_btn);
		Utils.sleep1second();

		String sw_details = runner.getTextFromCompent(OM.Install_SW_Details);
		runner.writeStringToResultsFile(sw_details, "sw_inst-details.log"); //$NON-NLS-1$;
		Utils.sleep1second();
		Utils.takeScreenshotActiveWindow(root + "sw-has-updates-or-not.png"); //$NON-NLS-1$;
		if (runner.componentIsEnabled(finish_button)) {
			Utils.dbg_msg("SW_Install_Finish_btn is enabled"); //$NON-NLS-1$;
			runner.clickComponent(finish_button);
		} else {
			Utils.dbg_msg("SW_Install_Finish_btn is NOT enabled. Already updated?");
			runner.clickComponent(cancel_button);//$NON-NLS-1$
			runner.waitForWindowClose("Install", 5 * Constants.ONE_SECOND);
			return;
		}
		runner.waitForWindowClose(install_title, 5 * Constants.ONE_SECOND);

		runner.waitForWindow(installing_title, 15 * Constants.ONE_SECOND);
		// Comment: We assume -Declipse.p2.unsignedPolicy=allow passed as vmarg to the application
		// Else we would have to activate "SW_SecurityWarning_OK_btn"
		runner.waitForWindowClose(installing_title, 180 * Constants.ONE_SECOND);

		runner.waitForWindow(updates_title, 5 * Constants.ONE_SECOND);

		// Click on "No". If we clicked "now", we could not detect restart of application
		runner.clickComponent(OM.SW_Update_Dialog_no);
		runner.waitForWindowClose(updates_title, 15 * Constants.ONE_SECOND);

	}

	public void installFeature(String feature_name){
		if (AUT_run.config.get(Constants.AUT_EXE) != null
			&& AUT_run.config.get(Constants.AUT_EXE).toLowerCase().contains("medelexis")) {
			Utils.dbg_msg("AUT_EXE is medelexis" + AUT_run.config.get(Constants.AUT_EXE)
				+ ". Don't know howto install " + feature_name);
			return;
		}
		Utils.dbg_msg("installFeature " + feature_name);
		swInitAll();
		runner.synchronizedTextReplace(OM.Install_Text_1_txf, feature_name);
		Utils.takeScreenshotActiveWindow(root + feature_name + "_1.png"); //$NON-NLS-1$
		Utils.sleep1second();
		@SuppressWarnings("unchecked")
		TreeTable tre = SwtComponents.createTreeTable(OM.Install_Tree_1_tre);
		runner.waitForComponent(OM.Install_Tree_1_tre);
		AUT_run.m_aut.execute(tre.selectNodeByIndexpath(SearchType.absolute, 0, "1/1", 1,
			InteractionMode.primary, BinaryChoice.no), null);
		Utils.takeScreenshotActiveWindow(root + feature_name + "_2.png"); //$NON-NLS-1$
		Utils.sleep1second();
		AUT_run.m_aut.execute(
			tre.toggleCheckboxOnNodeByIndexpath(SearchType.absolute, new Integer(0), "1/1"), null);
		Utils.takeScreenshotActiveWindow(root + feature_name + "_3.png"); //$NON-NLS-1$
		Utils.sleep1second();
		finishInstallSelectedSW();
		Utils.dbg_msg("installFeature finished " + feature_name);
	}

	class CallExitViaMenu extends Thread {
		public CallExitViaMenu(String dummy) {
			super(dummy);
			Utils.dbg_msg("dummy is: " + dummy);
		}

		@Override
		public void run() {
		}
	}
	public void installAllFeatures(){
		if (AUT_run.config.get(Constants.AUT_EXE) != null
			&& AUT_run.config.get(Constants.AUT_EXE).toLowerCase().contains("medelexis")) {
			Utils.sleep1second();
			Runnable r = new Runnable() {
				@Override
				public void run() {
					Utils.dbg_msg("Calling Datei Beenden");
					runner.openMenu("Datei/Beenden");
					Utils.dbg_msg("Wait for end");
				}
			};
			Utils.dbg_msg("before t");
			Thread t = new Thread(r);
			Utils.dbg_msg("before run");
			t.run();
			Utils.dbg_msg("after run");
			int j = 0;
			while (j < 30 && AUT_run.m_aut.isConnected())
			{
				j++;
				Utils.dbg_msg("Wait for installation ended " + j);
				Utils.sleep1second();
			}
			return;
		}
		Utils.dbg_msg("installAllFeatures finished");
		swInitAll();
		runner.clickComponent(OM.SW_Install_SelectAll_btn);
		finishInstallSelectedSW();
		Utils.dbg_msg("installAllFeatures finished");
	}
}