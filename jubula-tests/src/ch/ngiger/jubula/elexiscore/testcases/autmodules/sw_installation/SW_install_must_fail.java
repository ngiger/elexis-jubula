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

import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.Screenshot;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.Ub_grc_waitForComponent;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.check.Ub_grc_checkEnablement;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.click.Ub_grc_clickLeft_single;

@SrcNode(UUID = "5f42628aa4f848c49225878eda004e9c",
         type = NodeType.TEST_CASE)
public class SW_install_must_fail {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SW_install_must_fail.class);
    
    private RuntimeContext rtc;
    
    public SW_install_must_fail (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        Boolean ENABLED
    ) {
        AUT aut = rtc.getAUT();
        
        
        rtc.doNotIgnoreCheckFailed();
        
        rtc.doNotIgnoreCompNotFound();
        
        try {
        
        
        // Screenshot to confirm our choice that no install is necessary
        new Screenshot(
                rtc
            ).execute(
                "screenshots/sw-inst/no-sw-inst-needed.png"
            );
        //// Comment: Will only fail after a successfull instalation
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Wait for Finish button
        //new Ub_grc_waitForComponent(
                //rtc,
                //rtc.getIdentifier("SW_Install_Finish_btn")
            //).execute(
                //100
                //,
                //100
            //);
        // Comment: If sw-installed will fail, because no longer valid
        
        // Is Finish button enabled?
        new Ub_grc_checkEnablement(
                rtc,
                rtc.getIdentifier("SW_Install_Finish_btn")
            ).execute(
                ENABLED
            );
        
        // Click Cancel anyway to come back
        new Ub_grc_clickLeft_single(
                rtc,
                rtc.getIdentifier("SW_Install_Cancel_btn")
            ).execute(
            );
        
        
        
        }
        
        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.VerifyFailed
        //       Re-Entry Property: RETRY
        //       Used Test Case: Click cancel if finish is enable, but should not be
        //            new Ub_grc_clickLeft_single(rtc).execute(
        //            );
        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.CompNotFound
        //       Re-Entry Property: RETRY
        //       Used Test Case: Click cancel if finish is not found
        //            new Ub_grc_clickLeft_single(rtc).execute(
        //            );
        
        finally {
          rtc.endLocalEventHandling(true, false, true, false);
        }
    }
}