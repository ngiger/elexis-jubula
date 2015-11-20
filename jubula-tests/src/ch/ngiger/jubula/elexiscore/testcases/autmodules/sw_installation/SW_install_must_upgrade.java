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

import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.Screenshot;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.check.Ub_grc_checkEnablement;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.sw_installation.Finish_SW_Installation;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.store.application.Ub_app_storeValue;

@SrcNode(UUID = "5edac8df33b14b8fbd342a9e9af0f63a",
         type = NodeType.TEST_CASE)
public class SW_install_must_upgrade {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SW_install_must_upgrade.class);
    
    private RuntimeContext rtc;
    
    public SW_install_must_upgrade (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        Boolean ENABLED
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Screenshot to confirm our choice installing can continue
        new Screenshot(
                rtc
            ).execute(
                "screenshots/sw-inst/we-will-upgrade.png"
            );
        
        // Fail if SW must upgrade and Finish button not enabled
        new Ub_grc_checkEnablement(
                rtc,
                rtc.getIdentifier("SW_Install_Finish_btn")
            ).execute(
                ENABLED
            );
        // Comment: We assume to be inside the SW-Update dialog
        
        // Finish SW Installation
        new Finish_SW_Installation(
                rtc
            ).execute(
            );
        
        // As we finished, store false into MUST_UPGRADE
        new Ub_app_storeValue(
                rtc
            ).execute(
                "MUST_UPGRADE"
                ,
                "false"
            );
        
        
        
        
    }
}