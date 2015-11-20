package ch.ngiger.jubula.elexiscore.testcases.autmodules.preferences;

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

import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.SynchronizedClick;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindowtoclose.Ub_app_waitForWindowToClose;

@SrcNode(UUID = "12d0f5d1956a4e13b2ad29936889840a",
         type = NodeType.TEST_CASE)
public class ClickOkayAndWaitForWindowClose {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(ClickOkayAndWaitForWindowClose.class);
    
    private RuntimeContext rtc;
    
    public ClickOkayAndWaitForWindowClose (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Click OK
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("Preferences_OkButton_grc")
            ).execute(
            );
        
        // Preferences Window must close
        new Ub_app_waitForWindowToClose(
                rtc
            ).execute(
                "Pref.*"
                ,
                "matches"
                ,
                500
                ,
                10
            );
        
        
        
        
    }
}