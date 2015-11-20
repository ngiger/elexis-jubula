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

import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.check.contextmenu.checkenablement.Ub_grc_checkEnablementOfContextMenuEntry_byTextpath;

@SrcNode(UUID = "64f30f14e54247d489e19bae7212fde6",
         type = NodeType.TEST_CASE)
public class WaitForContextMenu {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(WaitForContextMenu.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_grc;
    
    
    public WaitForContextMenu (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_grc
    ) {
        rtc = _rtc;
        
        nn_nn_grc = _nn_nn_grc;
    }
    /** Max 5 seconds */
    public void execute(
        Integer MOUSE_BUTTON,
        String TEXTPATH
    ) {
        AUT aut = rtc.getAUT();
        
        
        rtc.doNotIgnoreActionError();
        
        rtc.doNotIgnoreCheckFailed();
        
        rtc.doNotIgnoreCompNotFound();
        
        try {
        
        
        new Ub_grc_checkEnablementOfContextMenuEntry_byTextpath(
                rtc,
                nn_nn_grc
            ).execute(
                TEXTPATH
                ,
                "matches"
                ,
                true
                ,
                MOUSE_BUTTON
            );
        
        
        
        }
        
        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.Action
        //       Re-Entry Property: RETRY
        //       Used Test Case: Loose100msOnActionError
        //            new ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.Ub_app_wait(rtc).execute(
        //                100
        //            );
        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.VerifyFailed
        //       Re-Entry Property: RETRY
        //       Used Test Case: Loose100msIfCheckFailed
        //            new ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.Ub_app_wait(rtc).execute(
        //                100
        //            );
        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.CompNotFound
        //       Re-Entry Property: RETRY
        //       Used Test Case: Loose100ms
        //            new ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.Ub_app_wait(rtc).execute(
        //                100
        //            );
        
        finally {
          rtc.endLocalEventHandling(true, true, true, false);
        }
    }
}