package ch.ngiger.elexis.jubula.elexiscore.testcases.unboundmodules;

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

import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.check.Ub_grc_checkExistence;

@SrcNode(UUID = "94647e1be2874050b43a259e99b692f7",
         type = NodeType.TEST_CASE)
public class SynchronizedClickIfExists {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SynchronizedClickIfExists.class);
    
    private RuntimeContext rtc;
    
    public SynchronizedClickIfExists (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    /** Clicks if it exits. Assume that after clicking it will disappear */
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        rtc.doNotIgnoreCheckFailed();
        
        try {
        
        
        // Check whether grc exists
        new Ub_grc_checkExistence(
                rtc,
                rtc.getIdentifier("nn_nn_grc")
            ).execute(
                false
            );
        
        
        
        }
        
        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.VerifyFailed
        //       Re-Entry Property: RETRY
        //       Used Test Case: ClickLeftIfExists
        //            new ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.click.Ub_grc_clickLeft_single(rtc).execute(
        //            );
        
        finally {
          rtc.endLocalEventHandling(true, false, false, false);
        }
    }
}