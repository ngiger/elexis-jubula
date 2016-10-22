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
import org.junit.Assert;

import ch.ngiger.jubula.elexiscore.OM;

/**
 * @author BREDEX GmbH
 */
public class Software extends Common {

	public Software(AUT aut, Application app){
		super(aut, app);
		Utils.dbg_msg("Software init " + m_aut + " app " + m_app);
	}

	private static String root = "sw_inst/";
	private static boolean artikelstamm_v4 = false;

	public boolean isArtikelstamm_v4(){
		return artikelstamm_v4;
	}

	private void handleAboutDetail(String abbrev, String name){
		@SuppressWarnings("rawtypes")
		ComponentIdentifier tab_id =
			OM.AboutElexisOpenSource_ElexisOpenSourceInstallatio0_TabFolder_1_tpn;
		// Select tab, take screenshot and save
		Utils.dbg_msg("handleAboutDetail: " + abbrev + " => " + name);
		AUT_run.m_aut.execute(AUT_run.app.copyTextToClipboard("empty"), null);
		selectTabByValue(tab_id, name);
		Utils.sleep1second(); // It takes some time to construct the view
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, root + "about_" + abbrev + ".png");
		String info = getTextFromCompent(tab_id);
		if (info != null && !info.startsWith("empty")) {
			if (info.contains("at.medevit.ch.artikelstamm.elexis.common (3.2")) {
				Utils.dbg_msg("handleAboutDetail: found artikelstamm_v4");
				artikelstamm_v4 = true;
			} else {
				Utils.dbg_msg("handleAboutDetail: NO artikelstamm_v4 found");
			}
			writeStringToResultsFile(info, root + "about_" + abbrev + ".txt");
		}
	}

	public void showAbout(String add, boolean minimal){
		String menu_about = "Hilfe/.*Elexis.*";
		String about_title = "About.*"; // only OpenSource Elexis has Elexis
		String details_title = ".*Installation Details.*";
		root = "sw_inst/" + add + "/";

		if (!openMenu(menu_about)) {
			AUT_run.activate(m_aut);
			openMenu(menu_about);
		}
		waitForWindow(about_title);
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, root + "about.png"); //$NON-NLS-1$

		clickComponent(OM.SW_About_Detail_btn); //$NON-NLS-1$
		waitForWindow(details_title);

		HashMap<String, String> map = new HashMap<>();
		map.put("configuration", "Configuration"); //$NON-NLS-1$
		if (!minimal) {
			map.put("history", "Update Chronik"); //$NON-NLS-1$
			map.put("installed", "Installierte Software"); //$NON-NLS-1$
			map.put("plugins", "Plug.*"); //$NON-NLS-1$
		}
		map.forEach((abbrev, name) -> handleAboutDetail(abbrev, name));

		pressEnter();
		// 		clickButton(OM.AboutElexisOpenSource_ElexisOpenSourceInstallatio0_Close_btn); //$NON-NLS-1$
		waitForWindowClose(details_title);

		clickComponent(OM.SW_about_ok_btn); //$NON-NLS-1$
		waitForWindowClose(about_title);
	}

	private void swInitAll(){
		String select_base = ".*Base.*";
		String menu_install = "Hilfe/Neue Software installieren";

		// Open SW Install Window
		openMenu(menu_install);

		// Select all SW from all sites
		@SuppressWarnings("unchecked")
		ComboComponent combo = SwtComponents.createComboComponent(OM.SW_update_select_site_combo);
		clickComponent(OM.SW_update_select_site_combo);

		// Select all SW from all sites
		AUT_run.m_aut.execute(
			combo.selectEntryByValue(select_base, Operator.matches, SearchType.absolute), null);
		// Three seconds were not enough when running from the command line
		int j = 0;
		while (j < 10) {
			j++;
			Utils.sleep1second();
			if (selectTreeItem(OM.SW_Install_Feature_Tree, "Basispakete")) {
				break;
			}
		}

	}

	/**
	 *
	 * @return true if restart required, else already everything installed
	 */

	private boolean finishInstallSelectedSW(){
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
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, root + "sw_inst-before-next.png"); //$NON-NLS-1$;
		clickComponent(OM.SW_Install_Next_btn);
		Utils.sleepMs(5 * 1000); // It may take some time to compile all the details
		String sw_details = getTextFromCompent(OM.Install_SW_Details);
		writeStringToResultsFile(sw_details, "sw_inst-details.log"); //$NON-NLS-1$;
		Utils.sleep1second();
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, root + "sw-has-updates-or-not.png"); //$NON-NLS-1$;
		if (componentIsEnabled(finish_button)) {
			Utils.dbg_msg("SW_Install_Finish_btn is enabled"); //$NON-NLS-1$;
			clickComponent(finish_button);
		} else {
			Utils.dbg_msg("SW_Install_Finish_btn is NOT enabled. Already updated?");
			clickComponent(cancel_button);//$NON-NLS-1$
			waitForWindowClose("Install", 5 * Constants.ONE_SECOND);
			return false;
		}
		if (!waitForWindowClose(install_title, 5 * Constants.ONE_SECOND))
		{
			Assert.fail("finishInstallSelectedSW: Unable to close" + install_title);
		}

		waitForWindow(installing_title, 15 * Constants.ONE_SECOND);
		// Comment: We assume -Declipse.p2.unsignedPolicy=allow passed as vmarg to the application
		// Else we would have to activate "SW_SecurityWarning_OK_btn"
		if (!waitForWindowClose(installing_title, 180 * Constants.ONE_SECOND))
		{
			Assert.fail("finishInstallSelectedSW: Unable to open" + installing_title);
		}

		if (!waitForWindow(updates_title, 5 * Constants.ONE_SECOND)) {
			Assert.fail("finishInstallSelectedSW: Unable to open" + updates_title);
		}

		// Click on "No". If we clicked "now", we could not detect restart of application
		clickComponent(OM.SW_Update_Dialog_no);
		waitForWindowClose(updates_title, 15 * Constants.ONE_SECOND);
		return true;
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
		synchronizedTextReplace(OM.Install_Text_1_txf, feature_name);
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, root + feature_name + "_1.png"); //$NON-NLS-1$
		Utils.sleep1second();
		@SuppressWarnings("unchecked")
		TreeTable tre = SwtComponents.createTreeTable(OM.Install_Tree_1_tre);
		waitForComponent(OM.Install_Tree_1_tre);
		AUT_run.m_aut.execute(tre.selectNodeByIndexpath(SearchType.absolute, 0, "1/1", 1,
			InteractionMode.primary, BinaryChoice.no), null);
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, root + feature_name + "_2.png"); //$NON-NLS-1$
		Utils.sleep1second();
		AUT_run.m_aut.execute(
			tre.toggleCheckboxOnNodeByIndexpath(SearchType.absolute, new Integer(0), "1/1"), null);
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, root + feature_name + "_3.png"); //$NON-NLS-1$
		Utils.sleep1second();
		finishInstallSelectedSW();
		Utils.dbg_msg("installFeature finished " + feature_name);
	}

	class CallExitViaMenu extends Thread {
		public CallExitViaMenu(String dummy){
			super(dummy);
			Utils.dbg_msg("dummy is: " + dummy);
		}

		@Override
		public void run(){}
	}

	/**
	 * OpenSource: installs all possible features<br>
	 * Medelexis: installs all licensed features
	 *
	 * @return true if restart required, else already everything installed
	 */
	public boolean installAllFeatures(){
		if (AUT_run.config.get(Constants.AUT_EXE) != null
			&& AUT_run.config.get(Constants.AUT_EXE).toLowerCase().contains("medelexis")) {
			Utils.sleep1second();
			Runnable r = new Runnable() {
				@Override
				public void run(){
					Utils.dbg_msg("Calling Datei Beenden");
					openMenu("Datei/Beenden");
					Utils.dbg_msg("Wait for end");
				}
			};
			Utils.dbg_msg("before t");
			Thread t = new Thread(r);
			Utils.dbg_msg("before run");
			t.run();
			Utils.dbg_msg("after run");
			int j = 0;
			while (j < 30 && AUT_run.m_aut.isConnected()) {
				j++;
				Utils.dbg_msg("Wait for installation ended " + j);
				Utils.sleep1second();
			}
			return false;
		}
		Utils.dbg_msg("installAllFeatures finished");
		swInitAll();
		clickComponent(OM.SW_Install_SelectAll_btn);
		return finishInstallSelectedSW();
	}

	public void installAllSW(){
		if (AUT_run.isMedelexis) {
			Utils.dbg_msg("AUT_EXE is medelexis: " + AUT_run.config.get(Constants.AUT_EXE));
			clickComponent(OM.Medelexis_Abo_perspective_tbi);
			Utils.sleepMs(5 * 1000); // wait 5 seconds: TODO: should wait till populated
		}

		if (AUT_run.isMedelexis) {
			Utils.dbg_msg("AUT_EXE is medelexis" + AUT_run.config.get(Constants.AUT_EXE));
			openMenu("Datei/Beenden");
		} else {
			if (installAllFeatures()) {
				// needs restart
				Utils.dbg_msg("installAllAndShowSW calling restart");
				AUT_run.restartApp(m_aut);
				Utils.dbg_msg("installAllAndShowSW restarted");
				AUT_run.takeScreenshotActiveWindow(AUT_run.m_aut, AUT_run.app, "after_restart.png");
				Utils.dbg_msg("installAllAndShowSW restarted");
				Perspectives perspectives = new Perspectives(AUT_run.m_aut, AUT_run.app);
				perspectives.initialSetup();
			}
		}
	}
}