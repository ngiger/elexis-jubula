package ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers;

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

import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindowactivation.Ub_app_waitForWindowActivation;

@SrcNode(UUID = "708ca2047d664e63bc8bcdd4beb4faa3",
         type = NodeType.TEST_CASE)
public class WaitForElexisMainWindow {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(WaitForElexisMainWindow.class);
    
    private RuntimeContext rtc;
    
    public WaitForElexisMainWindow (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String MAX_WAIT_IN_MS
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Wait for Elexis window to be active again
        new Ub_app_waitForWindowActivation(
                rtc
            ).execute(
                "Elexis.*"
                ,
                "matches"
                ,
                5000
                ,
                0
            );
        
        
        
        
    }
}