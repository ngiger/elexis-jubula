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

import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.store.application.Ub_app_storeValue;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.sw_installation.SW_check_for_updates;

@SrcNode(UUID = "52b76da1c9bf4c8c80bac8103dfe8698",
         type = NodeType.TEST_CASE)
public class Check_SW_core_update_as_requested {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Check_SW_core_update_as_requested.class);
    
    private RuntimeContext rtc;
    
    public Check_SW_core_update_as_requested (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    /** The request comes from the environment variable TEST_UDF_SW_MUST_UPGRADE. Defaults to no */
    public void execute(
        String MUST_UPGRADE
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Set MUST_UPGRADE
        new Ub_app_storeValue(
                rtc
            ).execute(
                "MUST_UPGRADE"
                ,
                "" + VariableStore.getInstance().getValue("SW_MUST_UPGRADE") + ""
            );
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Override expection from environment here!
        //new Ub_app_storeValue(
                //rtc
            //).execute(
                //"MUST_UPGRADE"
                //,
                //"false"
            //);
        
        // Check for Updates using ${MUST_UPGRADE}
        new SW_check_for_updates(
                rtc,
                rtc.getIdentifier("SW_update_information_ok_btn")
            ).execute(
                "" + VariableStore.getInstance().getValue("MUST_UPGRADE") + ""
            );
        
        
        
        
    }
}