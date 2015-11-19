package ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules;

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

import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.menubar.Ub_mbr_waitForMenuBar;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.select.menubar.Ub_mbr_selectEntry_byTextpath;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindow.Ub_app_waitForWindow;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.Screenshot;
import ch.ngiger.elexis.jubula.elexiscore.testcases.unboundmodules.SynchronizedClick;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.select.tabbedcomponent.Ub_tbc_selectTab_byValue;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.keycombination.Ub_app_pressAnyKey_ENTER;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindowtoclose.Ub_app_waitForWindowToClose;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.keycombination.Ub_app_pressAnyKey_TAB;

@SrcNode(UUID = "aac1c9945dba4785bd1639307a5c082e",
         type = NodeType.TEST_CASE)
public class SW_show_about {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SW_show_about.class);
    
    private RuntimeContext rtc;
    
    public SW_show_about (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String WINDOW_TITLE,
        String DETAILS_WINDOW
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Wait for menubar
        new Ub_mbr_waitForMenuBar(
                rtc
            ).execute(
                1000
                ,
                0
            );
        
        // Select Help../About
        new Ub_mbr_selectEntry_byTextpath(
                rtc
            ).execute(
                "Hilfe/.*Elexis.*"
                ,
                "matches"
            );
        
        // Wait for About window
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
        
        // Take screenshot about
        new Screenshot(
                rtc
            ).execute(
                "screenshots/sw-inst/about.png"
            );
        
        // Click Details
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("SW_About_Detail_btn")
            ).execute(
            );
        
        // Wait for Details window
        new Ub_app_waitForWindow(
                rtc
            ).execute(
                DETAILS_WINDOW
                ,
                "matches"
                ,
                1000
                ,
                100
            );
        
        // Click Plug-Ins tab
        new Ub_tbc_selectTab_byValue(
                rtc,
                rtc.getIdentifier("Elexis300a201405151339_AboutElexisOpenSource_ElexisOpenSourceInstallatio0_TabFolder_1_tpn")
            ).execute(
                "Installierte Software"
                ,
                "matches"
            );
        
        // Take screenshot about installed software
        new Screenshot(
                rtc
            ).execute(
                "screenshots/sw-inst/about_inst_sw.png"
            );
        
        // Click Plug-Ins tab
        new Ub_tbc_selectTab_byValue(
                rtc,
                rtc.getIdentifier("Elexis300a201405151339_AboutElexisOpenSource_ElexisOpenSourceInstallatio0_TabFolder_1_tpn")
            ).execute(
                "Update Chronik"
                ,
                "matches"
            );
        
        // Take screenshot about update history
        new Screenshot(
                rtc
            ).execute(
                "screenshots/sw-inst/about_history.png"
            );
        
        // Click Plug-Ins tab
        new Ub_tbc_selectTab_byValue(
                rtc,
                rtc.getIdentifier("Elexis300a201405151339_AboutElexisOpenSource_ElexisOpenSourceInstallatio0_TabFolder_1_tpn")
            ).execute(
                "Plug-ins"
                ,
                "matches"
            );
        
        // Take screenshot about plugins
        new Screenshot(
                rtc
            ).execute(
                "screenshots/sw-inst/about_plugins.png"
            );
        
        // Click Configuration tab
        new Ub_tbc_selectTab_byValue(
                rtc,
                rtc.getIdentifier("Elexis300a201405151339_AboutElexisOpenSource_ElexisOpenSourceInstallatio0_TabFolder_1_tpn")
            ).execute(
                "Configuration"
                ,
                "matches"
            );
        
        // Take screenshot about configuration
        new Screenshot(
                rtc
            ).execute(
                "screenshots/sw-inst/about_configuration.png"
            );
        // Comment: Click Okay is confused about which dialog to close
        
        // Press Enter
        new Ub_app_pressAnyKey_ENTER(
                rtc
            ).execute(
            );
        
        // Wait for Details window to close
        new Ub_app_waitForWindowToClose(
                rtc
            ).execute(
                DETAILS_WINDOW
                ,
                "matches"
                ,
                1000
                ,
                100
            );
        
        // Click Okay
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("SW_about_ok_btn")
            ).execute(
            );
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Press Tab to go to okay
        //new Ub_app_pressAnyKey_TAB(
                //rtc
            //).execute(
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Press Enter to close
        //new Ub_app_pressAnyKey_ENTER(
                //rtc
            //).execute(
            //);
        
        // Wait for About window to close
        new Ub_app_waitForWindowToClose(
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
        
        
        
        
    }
}