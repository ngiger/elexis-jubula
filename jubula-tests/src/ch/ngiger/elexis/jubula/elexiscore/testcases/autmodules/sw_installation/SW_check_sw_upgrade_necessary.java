package ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.sw_installation;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.api.converter.annotations.SrcNode;
import org.eclipse.jubula.client.api.converter.annotations.NodeType;
import org.eclipse.jubula.client.exceptions.ActionException;
import org.eclipse.jubula.client.exceptions.CheckFailedException;
import org.eclipse.jubula.client.exceptions.ComponentNotFoundException;
import org.eclipse.jubula.client.exceptions.ConfigurationException;
import org.eclipse.jubula.qa.api.converter.target.rcp.RuntimeContext;
import org.eclipse.jubula.qa.api.converter.target.rcp.VariableStore;
import org.eclipse.jubula.toolkit.enums.ValueSets.*;
import org.eclipse.jubula.tools.ComponentIdentifier;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ch.ngiger.elexis.jubula.elexiscore.CTDS;

import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.Ub_app_wait;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.Screenshot;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.click.Ub_grc_clickLeft_single;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.store.componentwithtext.Ub_ctx_storeValue;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.Save_txt_field_to_file_via_xclip;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.store.application.Ub_app_storeValue;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.check.Ub_grc_checkEnablement;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.sw_installation.SW_install_must_upgrade;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.sw_installation.SW_install_must_fail;
import ch.ngiger.elexis.jubula.elexiscore.testcases.unboundmodules.SynchronizedClick;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindowtoclose.Ub_app_waitForWindowToClose;

@SrcNode(UUID = "13e9ac51d71046caaf56fe9a49455c54",
         type = NodeType.TEST_CASE)
public class SW_check_sw_upgrade_necessary {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SW_check_sw_upgrade_necessary.class);
    
    private RuntimeContext rtc;
    
    public SW_check_sw_upgrade_necessary (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    /** Has retry handler if now SW_UPGRADE_MUST be done */
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Wait 1 second
        new Ub_app_wait(
                rtc
            ).execute(
                1000
            );
        
        // Take a screenshot at this crucial point!
        new Screenshot(
                rtc
            ).execute(
                "screenshots/sw-inst/sw-inst-before-next.png"
            );
        
        // Wait 1 second to be sure the text gets displayed
        new Ub_app_wait(
                rtc
            ).execute(
                1000
            );
        
        // Click Next
        new Ub_grc_clickLeft_single(
                rtc,
                rtc.getIdentifier("SW_Install_Next_btn")
            ).execute(
            );
        
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
        
        
        
        
    }
}