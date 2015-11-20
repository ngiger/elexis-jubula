package ch.ngiger.jubula.elexiscore.testcases.autmodules.sw_installation;

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

import ch.ngiger.jubula.elexiscore.CTDS;

import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.Ub_grc_waitForEnablement;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.Ub_app_wait;
import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.SynchronizedClick;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.Screenshot;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.WaitForTextChangeInComponent;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.check.componentwithtext.Ub_ctx_checkText;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.sw_installation.Finish_SW_Installation;

@SrcNode(UUID = "f80144bd832c4745ba6062ff6d351c70",
         type = NodeType.TEST_CASE)
public class SW_perform_install {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SW_perform_install.class);
    
    private RuntimeContext rtc;
    
    public SW_perform_install (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Wait max seconds for button "next" to be enabled
        new Ub_grc_waitForEnablement(
                rtc,
                rtc.getIdentifier("SW_Install_Next_btn")
            ).execute(
                true
                ,
                5000
            );
        //// Comment: I don't know how to wait for absence of 'pending' in SW_Install_SW_List
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Wait for 2 seconds till 'pending' gets away
        //new Ub_app_wait(
                //rtc
            //).execute(
                //2000
            //);
        
        // Click "Next" Button
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("SW_Install_Next_btn")
            ).execute(
            );
        
        // Take screenshot of availabe components
        new Screenshot(
                rtc
            ).execute(
                "screenshots/sw-inst/installation_finishable.png"
            );
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Wait till we see "already modifed" or "Cannot complete"
        //new WaitForTextChangeInComponent(
                //rtc,
                //rtc.getIdentifier("Install_SW_Details")
            //).execute(
                //".*" + VariableStore.getInstance().getValue("COMP_ALREADY_INSTALLED") + ".*|.*" + VariableStore.getInstance().getValue("CANNOT_COMPLETE") + ".*"
                //,
                //"matches"
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Return if already installed
        //new Ub_ctx_checkText(
                //rtc,
                //rtc.getIdentifier("Install_SW_Details")
            //).execute(
                //null // TODO: <code>null</code> found as test data - check and fix in ITE
                //,
                //"matches"
            //);
        
        // Wait max seconds for button "Finish" to be enabled
        new Ub_grc_waitForEnablement(
                rtc,
                rtc.getIdentifier("SW_Install_Finish_btn")
            ).execute(
                true
                ,
                2000
            );
        // Comment: We assume to be inside the SW-Update dialog
        
        // Finish SW Installation
        new Finish_SW_Installation(
                rtc
            ).execute(
            );
        
        
        
        
    }
}