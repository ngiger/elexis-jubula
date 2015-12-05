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

import org.eclipse.jubula.toolkit.concrete.ConcreteComponents;
import org.eclipse.jubula.toolkit.concrete.components.ComboComponent;
import org.eclipse.jubula.toolkit.concrete.components.TextComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.Modifier;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.enums.ValueSets.SearchType;
import org.eclipse.jubula.toolkit.swt.SwtComponents;

/** @author BREDEX GmbH */
public class SW_Installation {
	@SuppressWarnings("unchecked")
	public static void installAllFeatures(){

		// Open SW Install Window
		Common.openMenu("Hilfe/Neue Software installieren");

		// Select all SW from all sites
		ComboComponent combo =
			SwtComponents.createComboComponent(AUT_run.om.get("SW_update_select_site_combo"));//$NON-NLS-1$

		// Select all SW from all sites
		AUT_run.m_aut.execute(combo.selectEntryByValue(".*All Available Sites.*", Operator.matches,
			SearchType.absolute), null);
		// Three seconds were not enough when running from the command line
		Common.sleepMs(Constants.ONE_SECOND * 10);
		Common.clickButton("SW_Install_SelectAll_btn");//$NON-NLS-1$
		Common.sleep1second();

		// SW_check_sw_upgrade_nessarry
        // Take a screenshot at this crucial point!
        // Wait 1 second to be sure the text gets displayed
		Common.sleep1second();
		AUT_run.takeScreenshotActiveWindow("sw-inst/sw-inst-before-next.png"); //$NON-NLS-1$;
		Common.clickButton("SW_Install_Next_btn");//$NON-NLS-1$
		Common.sleep1second();

		TextComponent txt = ConcreteComponents.createTextComponent(AUT_run.om.get("Install_SW_Details"));//$NON-NLS-1$
		AUT_run.m_aut.execute(txt.click(new Integer(1), InteractionMode.primary), null);
		AUT_run.m_aut.execute(AUT_run.app.externalKeyCombination(new Modifier[] {Modifier.control}, "c"), null); //$NON-NLS-1$
/*
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Save header info about installation in variable
        //new Ub_ctx_storeValue(
                //rtc,
                //rtc.getIdentifier("Install_SW_Info_Header_txt")
            //).execute(
                //"HEADER_INFO"
            //);

        // Wait a little bit
        new Ub_app_wait(
                rtc
            ).execute(
                1000
            );

        // Save details for SW-Installation in log file
        new Save_txt_field_to_file_via_xclip(
                rtc,
                rtc.getIdentifier("Install_SW_Details")
            ).execute(
                "sw-inst-details.log"
            );

        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Click Finish button
        //new Ub_grc_clickLeft_single(
                //rtc,
                //rtc.getIdentifier("SW_Install_Finish_btn")
            //).execute(
            //);

        // Debug storing
        String value = VariableStore.getInstance().getValue("MUST_UPGRADE");
        VariableStore.getInstance().addVariable("MUST_UPGRADE", value);
        /* TODO: should we create a helper class?
        new Ub_app_storeValue(
                rtc
            ).execute(
                "LOCAL_TEST"
                ,
                "" + VariableStore.getInstance().getValue("MUST_UPGRADE") + ""
            );
        // Comment: two different EH might be triggered

        // Take a screenshot at this crucial point!
        new Screenshot(
                rtc
            ).execute(
                "screenshots/sw-inst/sw-has-updates-or-not.png"
            );
        //// Comment: This should trigger our local exception if we cannot install

        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Finish button must be enabled
        //new Ub_grc_checkEnablement(
                //rtc,
                //rtc.getIdentifier("SW_Install_Finish_btn")
            //).execute(
                //"" + VariableStore.getInstance().getValue("MUST_UPGRADE") + ""
            //);

        value = VariableStore.getInstance().getValue("MUST_UPGRADE");
        new SW_install_must_upgrade(
                rtc
            ).execute(
                "" + VariableStore.getInstance().getValue("MUST_UPGRADE") + ""
            );
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new SW_install_must_fail(
                //rtc
            //).execute(
                //"" + VariableStore.getInstance().getValue("MUST_UPGRADE") + ""
            //);

        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Click Finish button
        //new SynchronizedClick(
                //rtc,
                //rtc.getIdentifier("SW_Install_Finish_btn")
            //).execute(
            //);
        //// Comment: Will trigger local exception handler when finish btn not enabled

        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Wait up to 5 second to close window
        //new Ub_app_waitForWindowToClose(
                //rtc
            //).execute(
                //"Install"
                //,
                //"equals"
                //,
                //5000
                //,
                //1000
            //);

*/

		/*
		// Click create Patient
		ToolItem tbi = SwtComponents.createToolItem(AUT_run.om.get("Patient_create_tbi"));
		AUT_run.m_aut.execute(tbi.click(new Integer(1), InteractionMode.primary), null);
		AUT_run.m_aut.execute(tbi.checkEnablement(true), null);
*/
	}
}