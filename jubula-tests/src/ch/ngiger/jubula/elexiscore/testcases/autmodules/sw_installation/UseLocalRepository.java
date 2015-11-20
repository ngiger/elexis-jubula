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

import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.SynchronizedClick;
import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.SynchronizedReplaceText;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.keycombination.Ub_app_pressAnyKey_TAB;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.Ub_app_wait;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.keycombination.Ub_app_pressAnyKey_RIGHT;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.keycombination.Ub_app_pressAnyKey_SPACE;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindow.Ub_app_waitForWindow;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindowtoclose.Ub_app_waitForWindowToClose;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindowactivation.Ub_app_waitForWindowActivation;

@SrcNode(UUID = "45545af7bfc14ce58a3e0208d8c9ac3f",
         type = NodeType.TEST_CASE)
public class UseLocalRepository {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(UseLocalRepository.class);
    
    private RuntimeContext rtc;
    
    public UseLocalRepository (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String NAME,
        String P2_URL
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Click on Work with the list of sofware sites
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("Button_SW_Work_With_p2_list")
            ).execute(
            );
        
        // Set filter text
        new SynchronizedReplaceText(
                rtc,
                rtc.getIdentifier("SW_Available_Sites_Filter")
            ).execute(
                NAME
            );
        
        // Press Tab to select table
        new Ub_app_pressAnyKey_TAB(
                rtc
            ).execute(
            );
        
        // Wait some ms
        new Ub_app_wait(
                rtc
            ).execute(
                100
            );
        
        // Press right
        new Ub_app_pressAnyKey_RIGHT(
                rtc
            ).execute(
            );
        
        // Wait some ms
        new Ub_app_wait(
                rtc
            ).execute(
                100
            );
        
        // Press space to select
        new Ub_app_pressAnyKey_SPACE(
                rtc
            ).execute(
            );
        
        // Wait some ms
        new Ub_app_wait(
                rtc
            ).execute(
                100
            );
        
        // Edit selected item
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("SW_Available_Sites_Edit")
            ).execute(
            );
        
        // Wait for window "Edit Site"
        new Ub_app_waitForWindow(
                rtc
            ).execute(
                "Edit Site"
                ,
                "matches"
                ,
                1000
                ,
                100
            );
        
        // Set name of p2 site
        new SynchronizedReplaceText(
                rtc,
                rtc.getIdentifier("SW_Edit_Site_Name")
            ).execute(
                NAME
            );
        
        // Set location of p2 site
        new SynchronizedReplaceText(
                rtc,
                rtc.getIdentifier("SW_Edit_Site_P2_URL")
            ).execute(
                P2_URL
            );
        
        // Click Okay
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("SW_Edit_Site_Okay")
            ).execute(
            );
        
        // Wait for "Edit Site" window to close
        new Ub_app_waitForWindowToClose(
                rtc
            ).execute(
                "Edit Site"
                ,
                "matches"
                ,
                1000
                ,
                100
            );
        
        // Click Okay in "Available Software Sites" dialog
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("SW_Available_Sites_Okay_btn")
            ).execute(
            );
        
        new Ub_app_waitForWindowActivation(
                rtc
            ).execute(
                "Install"
                ,
                "matches"
                ,
                1000
                ,
                100
            );
        
        
        
        
    }
}