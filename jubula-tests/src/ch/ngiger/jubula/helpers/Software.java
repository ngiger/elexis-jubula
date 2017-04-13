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

import java.util.LinkedHashMap;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.exceptions.CommunicationException;
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
	private static String ElexisCoreVersion = "unknown";
	private static boolean artikelstamm_v4 = false;
	private static boolean base_ch_installed = false;

	public boolean isArtikelstamm_v4(){
		return artikelstamm_v4;
	}

	public boolean baseChIsInstalled(){
		return base_ch_installed;
	}

	public String getElexisCoreVersion() {
		return ElexisCoreVersion;
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

		if (componentIsEnabled(OM.SW_Details_Configuration_tic)) {
			String info = getTextFromCompent(OM.SW_Details_Configuration_tic);
			if (info.contains("at.medevit.ch.artikelstamm.elexis.common (3.2")) {
				Utils.dbg_msg("handleAboutDetail: found artikelstamm_v4");
				artikelstamm_v4 = true;
			} else {
				Utils.dbg_msg("handleAboutDetail: NO artikelstamm_v4 found");
			}
			if (info.contains("ch.elexis.base.ch.artikel")) {
				base_ch_installed = true;
			}
			final String searchString = "ch.elexis.core (";
			int beginIndex = info.indexOf(searchString, 0);
			if (beginIndex >= 0) {
				beginIndex += searchString.length();
				ElexisCoreVersion = info.substring(beginIndex, beginIndex + 3);
			}
			writeStringToResultsFile(info, "about_elexis_" + ElexisCoreVersion + "_" + abbrev + ".txt");
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
		waitForWindow(details_title); new Perspectives(AUT_run.m_aut, AUT_run.app);

		LinkedHashMap<String, String>orderedMap = new LinkedHashMap<>();
		if (!minimal) {
			orderedMap.put("installed", "Installierte Software"); //$NON-NLS-1$
			orderedMap.put("history", "Update Chronik"); //$NON-NLS-1$
			orderedMap.put("plugins", "Plug.*"); //$NON-NLS-1$
		}
		orderedMap.put("configuration", "Configuration"); //$NON-NLS-1$
		orderedMap.forEach((abbrev, name) -> handleAboutDetail(abbrev, name));
		selectTabByValue(OM.AboutElexisOpenSource_ElexisOpenSourceInstallatio0_TabFolder_1_tpn, "Configuration");
		// SW_Details_Configuration_close_btn is only correctly defined in this tab
		clickComponent(OM.SW_Details_Configuration_close_btn);
		if (!waitForWindowClose(details_title))	{
			Utils.dbg_msg("SW-Details window did not close" + details_title);
			pressEscape();
		}
		waitForComponent(OM.SW_about_ok_btn); //$NON-NLS-1$
		clickComponent(OM.SW_about_ok_btn); //$NON-NLS-1$
		if (!waitForWindowClose(about_title)) {
			Utils.dbg_msg("SW-About Window did not close" + about_title);
			pressEscape();
		}
	}

	private void swInitAll(){
		String select_base = ".*Base.*";
		String menu_install = "Hilfe/Neue Software installieren";

		// Open SW Install Window
		openMenu(menu_install);
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, root + "init.png"); //$NON-NLS-1$;

		// Select all SW from all sites
		@SuppressWarnings("unchecked")
		ComboComponent combo = SwtComponents.createComboComponent(OM.SW_update_select_site_combo);
		Utils.sleep1second();
		Utils.sleep1second();
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, root + "second.png"); //$NON-NLS-1$;
		waitForWindowClose(".*Problem.*", Constants.ONE_SECOND);
		// Select all SW from all sites
		select_base = ".*Base.*";
		clickTopRightOfComponent(OM.SW_update_select_site_combo);
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, root + "all_sites.png"); //$NON-NLS-1$;
		pressEscape(); // Close the list
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
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, root + select_base + "_after.png"); //$NON-NLS-1$;

	}

	/**
	 *
	 * @return true if restart required, else already everything installed
	 */

	private boolean finishInstallSelectedSW(){
		String install_title = "Install";
		String installing_title = "Installing Software";
		String updates_title = "Software Updates";
		String trust_certificates =  "Selection Needed";
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
		if (waitForComponent(finish_button, 5 * 1000)) {
			String sw_details = getTextFromCompent(OM.Install_SW_Details);
			writeStringToResultsFile(sw_details, "sw_inst-details.log"); //$NON-NLS-1$;
			AUT_run.takeScreenshotActiveWindow(m_aut, m_app, root + "sw-has-updates.png"); //$NON-NLS-1$;$$
			Utils.sleep1second(); // really needed or sometimes the installation will fail!!
			clickComponent(finish_button);
			Utils.dbg_msg("SW_Install_Finish_btn was enabled");
		} else {
			Utils.dbg_msg("SW_Install_Finish_btn is NOT enabled. Already updated");
			AUT_run.takeScreenshotActiveWindow(m_aut, m_app, root + "sw-no-updates.png"); //$NON-NLS-1$;$$
			clickComponent(cancel_button);//$NON-NLS-1$
			waitForWindowClose("Install", 5 * Constants.ONE_SECOND);
			return false;
		}
		if (!waitForWindowClose(install_title, 5 * Constants.ONE_SECOND))
		{
			Assert.fail("finishInstallSelectedSW: Unable to close" + install_title);
		}

		// Comment: We assume -Declipse.p2.unsignedPolicy=allow passed as vmarg to the application
		// Else we would have to activate "SW_SecurityWarning_OK_btn"
		long startSeconds = System.currentTimeMillis()/1000;
		while (((System.currentTimeMillis()/1000) -startSeconds)  < 200)
		{
			System.out.println("Check "+ trust_certificates);
			Utils.sleep1second();

			if (waitForWindow(trust_certificates, Constants.ONE_SECOND))
			{
				AUT_run.takeScreenshotActiveWindow(m_aut, m_app, root + "sw-trust_certificates.png"); //$NON-NLS-1$;
				pressSpace();
				Utils.sleep1second();
				AUT_run.takeScreenshotActiveWindow(m_aut, m_app, root + "sw-trust_certificates_eclipse.png"); //$NON-NLS-1$;
				pressEnter();
				AUT_run.takeScreenshotActiveWindow(m_aut, m_app, root + "sw-trust_certificates_accpted.png"); //$NON-NLS-1$;
				Utils.sleep1second();
				pressEnter();
				if (waitForWindowClose(trust_certificates, Constants.ONE_SECOND))
				{
					break;
				} else
				{
					Assert.fail("finishInstallSelectedSW: Unable to close " + trust_certificates);
				}
				if (waitForWindow(updates_title, Constants.ONE_SECOND)) {
					break;
				}
			}

			if (waitForWindow(updates_title, Constants.ONE_SECOND)) {
				break;
			}
		}
		clickComponent(OM.SW_Update_Dialog_no);
		// Click on "No". If we clicked "now", we could not detect restart of application
		waitForWindowClose(updates_title, 15 * Constants.ONE_SECOND);
		Utils.sleep1second();
		return true;
	}

	public boolean installMedelexis() {
		Utils.dbg_msg("AUT_EXE is medelexis" + AUT_run.config.get(Constants.AUT_EXE)
		+ ". installMedelexis");
		int seconds = 0;
		while (seconds < 240 && (!waitForElexisMainWindow())) {
			seconds ++;
			if (waitForWindow("InstallError.*", 100)) {
				pressEscape(); // to close it
			}
			if (waitForWindow("Progress Information.*", 100)) {
				pressEscape(); // to close it
			}
		}
		Utils.dbg_msg("installFeature medelexis succeeded after" + seconds + " res: " +
				waitForElexisMainWindow());
		Assert.assertTrue(AUT_run.restartApp(AUT_run.m_aut) != null);
		return true;
	}
	public void installFeature(String feature_name){
		if (AUT_run.isMedelexis)
		{
			Utils.dbg_msg("skip installFeature " + feature_name + " as Medelexis");
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
		if ( AUT_run.isMedelexis ) {
			return installMedelexis();
		}
		Utils.dbg_msg("installAllFeatures finished");
		swInitAll();
		clickComponent(OM.SW_Install_SelectAll_btn);
		return finishInstallSelectedSW();
	}

	public void installAllSW(){
		if (AUT_run.isMedelexis) {
			Utils.dbg_msg("AUT_EXE is medelexis: " + AUT_run.config.get(Constants.AUT_EXE));
			Assert.assertTrue(AUT_run.restartAppViaQuit(m_aut) != null);
		} else {
			if (installAllFeatures()) {
				// needs restart
				String quit = "Datei.*/Beenden*";
				Utils.dbg_msg("installAllAndShowSW calling restart");
				try {
					m_aut.execute(mbr.selectMenuEntryByTextpath(quit, Operator.matches), null);
				} catch (CommunicationException e) {
					Utils.dbg_msg("CommunicationException. Expected after " + quit);
					m_aut = AUT_run.startAUT(false);
				}
				Assert.assertTrue(m_aut != null);
				Assert.assertTrue(m_aut.isConnected());
				AUT_run.takeScreenshotActiveWindow(AUT_run.m_aut, AUT_run.app, "after_restart.png");
				Utils.dbg_msg("installAllAndShowSW restarted");
				Perspectives perspectives = new Perspectives(AUT_run.m_aut, AUT_run.app);
				perspectives.initialSetup();
			}
		}
	}
}