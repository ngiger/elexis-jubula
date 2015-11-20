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

import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.select.menubar.Ub_mbr_selectEntry_byTextpath;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.DealWithOccasionalDialog;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindowactivation.Ub_app_waitForWindowActivation;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.click.Ub_grc_clickLeft_single;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.check.application.Ub_app_checkStringValues;

@SrcNode(UUID = "1ad2058b1db845e5b59262eb83e505af",
         type = NodeType.TEST_CASE)
public class SW_check_for_updates {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SW_check_for_updates.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier SW_update_information_ok_btn;
    
    
    public SW_check_for_updates (RuntimeContext _rtc,
        
        ComponentIdentifier _SW_update_information_ok_btn
    ) {
        rtc = _rtc;
        
        SW_update_information_ok_btn = _SW_update_information_ok_btn;
    }
    
    public void execute(
        String MUST_UPGRADE
    ) {
        AUT aut = rtc.getAUT();
        
        
        rtc.beginIgnoreCheckFailed();
        
        try {
        
        
        // Menu Hilfe/Auf Updates überprüfen
        new Ub_mbr_selectEntry_byTextpath(
                rtc
            ).execute(
                "Hilfe/Auf Updates überprüfen"
                ,
                "matches"
            );
        // Comment: See http://testing.bredex.de/deal-with-occasional-dialog.html
        
        // Press Okay if .*Available Updates.* appears
        new DealWithOccasionalDialog(
                rtc,
                rtc.getIdentifier("nn_nn_grc")
            ).execute(
                ".*Available Updates.*"
            );
        
        // Wait 5 seconds for Information window
        new Ub_app_waitForWindowActivation(
                rtc
            ).execute(
                "Information"
                ,
                "matches"
                ,
                5000
                ,
                500
            );
        
        // Click okay when "No updates found" dialog 
        new Ub_grc_clickLeft_single(
                rtc,
                SW_update_information_ok_btn
            ).execute(
            );
        
        new Ub_app_checkStringValues(
                rtc
            ).execute(
                MUST_UPGRADE
                ,
                "matches"
                ,
                "no|NO|false|FALSE"
            );
        
        
        
        }
        
        
        finally {
          rtc.endLocalEventHandling(true, false, false, false);
        }
    }
}