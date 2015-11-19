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

import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindow.Ub_app_waitForWindow;
import ch.ngiger.elexis.jubula.elexiscore.testcases.unboundmodules.SynchronizedClickIfExists;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.sw_installation.Finish_SW_Installation;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindowtoclose.Ub_app_waitForWindowToClose;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.Screenshot;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.RestartElexisAndImportArtikelstamm;

@SrcNode(UUID = "43b477ee90b647179e69cf4b375ddbad",
         type = NodeType.TEST_CASE)
public class SW_Install_Available_Updates {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SW_Install_Available_Updates.class);
    
    private RuntimeContext rtc;
    
    public SW_Install_Available_Updates (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String WINDOW_TITLE,
        String UPDATE_SW_TITLE
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Wait for available updates to appear
        new Ub_app_waitForWindow(
                rtc
            ).execute(
                WINDOW_TITLE
                ,
                "matches"
                ,
                1000
                ,
                100
            );
        // Comment: Clicks if it exits. Assume that after clicking it will disappear
        
        // Click Install
        new SynchronizedClickIfExists(
                rtc
            ).execute(
            );
        //// Comment: We assume to be inside the SW-Update dialog
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new Finish_SW_Installation(
                //rtc
            //).execute(
            //);
        
        // Wait for window close
        new Ub_app_waitForWindowToClose(
                rtc
            ).execute(
                WINDOW_TITLE
                ,
                "matches"
                ,
                2000
                ,
                100
            );
        
        // Screenshot expecting-Available Updates.png
        new Screenshot(
                rtc
            ).execute(
                "screenshots/sw-inst/expecting-Available Updates.png"
            );
        
        // Wait max 1s for updating software window
        new Ub_app_waitForWindow(
                rtc
            ).execute(
                UPDATE_SW_TITLE
                ,
                "matches"
                ,
                1000
                ,
                100
            );
        
        // screenshot before clicking no to restart
        new Screenshot(
                rtc
            ).execute(
                "screenshots/sw-inst/before-no-restart.png"
            );
        // Comment:  (We cannot handle this case of restart)
        
        // Click No
        new SynchronizedClickIfExists(
                rtc
            ).execute(
            );
        
        // Wait max 30s for updating software window to close
        new Ub_app_waitForWindowToClose(
                rtc
            ).execute(
                UPDATE_SW_TITLE
                ,
                "matches"
                ,
                30000
                ,
                100
            );
        
        new RestartElexisAndImportArtikelstamm(
                rtc
            ).execute(
                ".*lexis.*"
            );
        
        
        
        
    }
}