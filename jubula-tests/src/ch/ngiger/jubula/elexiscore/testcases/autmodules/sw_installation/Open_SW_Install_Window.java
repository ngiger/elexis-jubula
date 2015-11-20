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
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindowactivation.Ub_app_waitForWindowActivation;

@SrcNode(UUID = "94631e7519c04b918fc193959ef3b9c8",
         type = NodeType.TEST_CASE)
public class Open_SW_Install_Window {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Open_SW_Install_Window.class);
    
    private RuntimeContext rtc;
    
    public Open_SW_Install_Window (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Hilfe..Neue Software installieren
        new Ub_mbr_selectEntry_byTextpath(
                rtc
            ).execute(
                "Hilfe/Neue Software installieren"
                ,
                "matches"
            );
        
        // Wait "Install"
        new Ub_app_waitForWindowActivation(
                rtc
            ).execute(
                "Install"
                ,
                "matches"
                ,
                10000
                ,
                200
            );
        
        
        
        
    }
}