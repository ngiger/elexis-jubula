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

import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.check.componentwithtext.Ub_ctx_checkText;

@SrcNode(UUID = "78b5e6863560470da69eddcd89ac3351",
         type = NodeType.TEST_CASE)
public class WaitForTextChangeInComponent {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(WaitForTextChangeInComponent.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_ctx;
    
    
    public WaitForTextChangeInComponent (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_ctx
    ) {
        rtc = _rtc;
        
        nn_nn_ctx = _nn_nn_ctx;
    }
    
    public void execute(
        String TEXT,
        String OPERATOR
    ) {
        AUT aut = rtc.getAUT();
        
        
        rtc.doNotIgnoreCheckFailed();
        
        try {
        
        
        new Ub_ctx_checkText(
                rtc,
                nn_nn_ctx
            ).execute(
                TEXT
                ,
                OPERATOR
            );
        
        
        
        }
        
        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.VerifyFailed
        //       Re-Entry Property: RETRY
        //       Used Test Case: Retry (max. 10)
        //            new ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.Ub_app_wait(rtc).execute(
        //                500
        //            );
        
        finally {
          rtc.endLocalEventHandling(true, false, false, false);
        }
    }
}