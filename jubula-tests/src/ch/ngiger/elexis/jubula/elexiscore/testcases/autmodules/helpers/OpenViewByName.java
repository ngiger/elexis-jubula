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

import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.ResetPerspective;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.menubar.Ub_mbr_waitForMenuBar;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.SelectMenuViewOther;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindow.Ub_app_waitForWindow_matches;
import ch.ngiger.elexis.jubula.elexiscore.testcases.unboundmodules.SynchronizedReplaceText;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.click.Ub_grc_clickLeft_single;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.select.tree.Ub_tre_selectNode_byIndexpath;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.select.tree.Ub_tre_selectNode_byTextpath;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.Ub_app_wait;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.WaitForElexisMainWindow;

@SrcNode(UUID = "3ca416c67277453ca1c6d724ff916ec0",
         type = NodeType.TEST_CASE)
public class OpenViewByName {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(OpenViewByName.class);
    
    private RuntimeContext rtc;
    
    public OpenViewByName (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String VIEWNAME
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Reset Perspective
        //new ResetPerspective(
                //rtc
            //).execute(
            //);
        
        // Wait for MenuBar
        new Ub_mbr_waitForMenuBar(
                rtc
            ).execute(
                10000
                ,
                100
            );
        
        // Menu..Ansicht..Other auswählen
        new SelectMenuViewOther(
                rtc
            ).execute(
            );
        
        // Wait for Show View
        new Ub_app_waitForWindow_matches(
                rtc
            ).execute(
                "Show View"
                ,
                10000
                ,
                10
            );
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Enter view name to search for
        //new SynchronizedReplaceText(
                //rtc,
                //rtc.getIdentifier("ShowView_SelView_cti")
            //).execute(
                //VIEWNAME
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Click search
        //new Ub_grc_clickLeft_single(
                //rtc,
                //rtc.getIdentifier("nn_nn_grc")
            //).execute(
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new Ub_tre_selectNode_byIndexpath(
                //rtc,
                //rtc.getIdentifier("ShowView_ViewTree_grc")
            //).execute(
                //"absolute"
                //,
                //0
                //,
                //"1/1"
                //,
                //1
                //,
                //1
                //,
                //"no"
            //);
        
        // Select tree
        new Ub_grc_clickLeft_single(
                rtc,
                rtc.getIdentifier("ShowView_ViewTree_grc")
            ).execute(
            );
        
        // Select view Name
        new Ub_tre_selectNode_byTextpath(
                rtc,
                rtc.getIdentifier("ShowView_ViewTree_grc")
            ).execute(
                "absolute"
                ,
                0
                ,
                VIEWNAME
                ,
                "matches"
                ,
                1
                ,
                1
                ,
                "no"
            );
        
        // Click Okay
        new Ub_grc_clickLeft_single(
                rtc,
                rtc.getIdentifier("ShowView_OkButton_grc")
            ).execute(
            );
        
        // Wait a little bit (workaround for Codes/Codes
        new Ub_app_wait(
                rtc
            ).execute(
                1000
            );
        
        // Wait for Elexis Main WIndow
        new WaitForElexisMainWindow(
                rtc
            ).execute(
                "3000"
            );
        
        
        
        
    }
}