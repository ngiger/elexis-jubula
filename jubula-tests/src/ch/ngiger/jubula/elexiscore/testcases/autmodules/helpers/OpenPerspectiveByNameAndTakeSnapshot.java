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

import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.OpenPerspectiveByName;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.ResetPerspective;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.Screenshot;

@SrcNode(UUID = "081896a0ebde4f64b918d0750b0b52fd",
         type = NodeType.TEST_CASE)
public class OpenPerspectiveByNameAndTakeSnapshot {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(OpenPerspectiveByNameAndTakeSnapshot.class);
    
    private RuntimeContext rtc;
    
    public OpenPerspectiveByNameAndTakeSnapshot (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String NAME,
        String SCREENSHOT
    ) {
        AUT aut = rtc.getAUT();
        
        
        rtc.doNotIgnoreActionError();
        
        rtc.doNotIgnoreCheckFailed();
        
        rtc.doNotIgnoreCompNotFound();
        
        try {
        
        
        new OpenPerspectiveByName(
                rtc
            ).execute(
                NAME
            );
        
        // Reset Perspective
        new ResetPerspective(
                rtc
            ).execute(
            );
        
        // Take a snapshot
        new Screenshot(
                rtc
            ).execute(
                SCREENSHOT
            );
        
        
        
        }
        
        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.Action
        //       Re-Entry Property: BREAK
        //       Used Test Case: Break on Action Error
        //            new ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.EHEmpty(rtc).execute(
        //            );
        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.VerifyFailed
        //       Re-Entry Property: BREAK
        //       Used Test Case: Break on Check Failed
        //            new ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.EHEmpty(rtc).execute(
        //            );
        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.CompNotFound
        //       Re-Entry Property: BREAK
        //       Used Test Case: Break on Component not found
        //            new ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.EHEmpty(rtc).execute(
        //            );
        
        finally {
          rtc.endLocalEventHandling(true, true, true, false);
        }
    }
}