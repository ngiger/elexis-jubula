package ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.patienten;

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
import ch.ngiger.elexis.jubula.elexiscore.testcases.unboundmodules.SynchronizedClick;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.ClickInMiddleOfComponent;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.EHEmpty;

@SrcNode(UUID = "e4836ee6f42d49a7b5fc1b7ba25dc67c",
         type = NodeType.TEST_CASE)
public class SelectPatientFromListIfAny {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SelectPatientFromListIfAny.class);
    
    private RuntimeContext rtc;
    
    public SelectPatientFromListIfAny (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        rtc.doNotIgnoreCheckFailed();
        
        try {
        
        
        // Check if Tab Patient exists
        new Ub_grc_checkExistence(
                rtc,
                rtc.getIdentifier("Tab_Patient_Name_grc")
            ).execute(
                true
            );
        
        // Click Name in Tab Patient
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("Tab_Patient_Name_grc")
            ).execute(
            );
        // Comment: Must work with empty table, too. Therefore we don't select the top one
        
        // Select a patient (if there is any)
        new ClickInMiddleOfComponent(
                rtc,
                rtc.getIdentifier("Tab_Patient_Name_grc")
            ).execute(
            );
        
        
        
        }
        
        
        catch (CheckFailedException e) {
            log.debug("Exception during test execution", e);
            // TODO: Commented out event handler. (Commenting in does not necessarily lead to same test execution as in ITE)
            //new EHEmpty(rtc
                //).execute(
                        //);
        }
        
        finally {
          rtc.endLocalEventHandling(true, false, false, false);
        }
    }
}