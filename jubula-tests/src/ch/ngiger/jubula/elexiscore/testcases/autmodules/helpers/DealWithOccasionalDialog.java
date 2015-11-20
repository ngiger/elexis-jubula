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

import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.Ub_app_wait;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.click.Ub_grc_clickLeft_single;
import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.SynchronizedClickIfExists;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.check.application.Ub_app_checkExistenceOfWindow;

@SrcNode(UUID = "033fbd0ac8bc44c28fd967f39513eef3",
         type = NodeType.TEST_CASE)
public class DealWithOccasionalDialog {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(DealWithOccasionalDialog.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_grc;
    
    
    public DealWithOccasionalDialog (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_grc
    ) {
        rtc = _rtc;
        
        nn_nn_grc = _nn_nn_grc;
    }
    /** See http://testing.bredex.de/deal-with-occasional-dialog.html */
    public void execute(
        String TITLE
    ) {
        AUT aut = rtc.getAUT();
        
        
        rtc.doNotIgnoreCheckFailed();
        
        try {
        
        
        // Wait some time
        new Ub_app_wait(
                rtc
            ).execute(
                500
            );
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Press okay button if this dialog appears
        //new Ub_grc_clickLeft_single(
                //rtc,
                //nn_nn_grc
            //).execute(
            //);
        // Comment: Clicks if it exits. Assume that after clicking it will disappear
        
        // Press okay if exists
        new SynchronizedClickIfExists(
                rtc,
                nn_nn_grc
            ).execute(
            );
        
        // Window title to match
        new Ub_app_checkExistenceOfWindow(
                rtc
            ).execute(
                TITLE
                ,
                "matches"
                ,
                false
            );
        
        
        
        }
        
        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.VerifyFailed
        //       Re-Entry Property: RETRY
        //       Used Test Case: Button to press
        //            new Ub_grc_clickLeft_single(rtc).execute(
        //            );
        
        finally {
          rtc.endLocalEventHandling(true, false, false, false);
        }
    }
}