package ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers;

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

import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.menubar.Ub_mbr_waitForMenuBar;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.select.menubar.Ub_mbr_selectEntry_byTextpath;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindow.Ub_app_waitForWindow_matches;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.click.Ub_grc_clickLeft_single;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.select.table.Ub_tbl_selectCell;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindowtoclose.Ub_app_waitForWindowToClose;

@SrcNode(UUID = "3c8e68c1ad044bddb8efcb849e40e4cf",
         type = NodeType.TEST_CASE)
public class OpenPerspectiveByName {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(OpenPerspectiveByName.class);
    
    private RuntimeContext rtc;
    
    public OpenPerspectiveByName (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String NAME
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Wait for MenuBar
        new Ub_mbr_waitForMenuBar(
                rtc
            ).execute(
                1000
                ,
                100
            );
        
        // Menü wählen
        new Ub_mbr_selectEntry_byTextpath(
                rtc
            ).execute(
                "Fenster/Perspektive/Other..."
                ,
                "equals"
            );
        
        // Wait for Open Perspective window
        new Ub_app_waitForWindow_matches(
                rtc
            ).execute(
                "Open Perspective"
                ,
                10000
                ,
                100
            );
        
        // Select table tree
        new Ub_grc_clickLeft_single(
                rtc,
                rtc.getIdentifier("OpenPerspective_ViewTree_grc")
            ).execute(
            );
        
        // Select perspective name
        new Ub_tbl_selectCell(
                rtc,
                rtc.getIdentifier("OpenPerspective_ViewTree_grc")
            ).execute(
                NAME
                ,
                "matches"
                ,
                "1"
                ,
                "equals"
                ,
                1
                ,
                1
                ,
                "percent"
                ,
                1
                ,
                "percent"
                ,
                "no"
                ,
                1
            );
        
        // Accept selection
        new Ub_grc_clickLeft_single(
                rtc,
                rtc.getIdentifier("OpenPerspective_ViewTree_grc")
            ).execute(
            );
        
        // Click Okay
        new Ub_grc_clickLeft_single(
                rtc,
                rtc.getIdentifier("ShowView_OkButton_grc")
            ).execute(
            );
        
        // Wait for window closed
        new Ub_app_waitForWindowToClose(
                rtc
            ).execute(
                "Open Perspective"
                ,
                "matches"
                ,
                10000
                ,
                100
            );
        
        
        
        
    }
}