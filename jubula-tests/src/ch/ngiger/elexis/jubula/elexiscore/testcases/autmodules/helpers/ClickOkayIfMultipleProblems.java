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

import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.check.application.Ub_app_checkExistenceOfWindow;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindow.Ub_app_waitForWindow_matches;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.click.Ub_grc_clickLeft_single;

@SrcNode(UUID = "9f4f888613974ca8bc20dc0b54451c66",
         type = NodeType.TEST_CASE)
public class ClickOkayIfMultipleProblems {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(ClickOkayIfMultipleProblems.class);
    
    private RuntimeContext rtc;
    
    public ClickOkayIfMultipleProblems (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        rtc.doNotIgnoreActionError();
        
        rtc.doNotIgnoreCheckFailed();
        
        try {
        
        
        // Check whether multiple problem have occure
        new Ub_app_checkExistenceOfWindow(
                rtc
            ).execute(
                "Multiple problems have occ.*"
                ,
                "matches"
                ,
                false
            );
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// SelectMultipleProblems
        //new Ub_app_waitForWindow_matches(
                //rtc
            //).execute(
                //"Multiple problems have occ.*"
                //,
                //10
                //,
                //0
            //);
        
        // Click OK on Multiple
        new Ub_grc_clickLeft_single(
                rtc,
                rtc.getIdentifier("MultipleProblem_OkButton_grc")
            ).execute(
            );
        
        
        
        }
        
        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.Action
        //       Re-Entry Property: BREAK
        //       Used Test Case: 1
        //            new Ub_grc_clickLeft_single(rtc).execute(
        //            );
        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.VerifyFailed
        //       Re-Entry Property: BREAK
        //       Used Test Case: 2
        //            new Ub_grc_clickLeft_single(rtc).execute(
        //            );
        
        finally {
          rtc.endLocalEventHandling(true, true, false, false);
        }
    }
}