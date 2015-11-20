package ch.ngiger.jubula.elexiscore.testcases.autmodules.preferences;

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

import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.select.menubar.Ub_mbr_selectEntry_byTextpath;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.select.tree.Ub_tre_selectNode_byTextpath;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.Ub_grc_waitForComponent;
import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.SynchronizedClick;
import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.SynchronizedClickIfExists;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.EHEmpty;

@SrcNode(UUID = "f0f25b6cdb5742fcaa355f6f7ad26f30",
         type = NodeType.TEST_CASE)
public class SelectItemPressApplyAndOkay {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SelectItemPressApplyAndOkay.class);
    
    private RuntimeContext rtc;
    
    public SelectItemPressApplyAndOkay (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String PREFERENCES_PATH
    ) {
        AUT aut = rtc.getAUT();
        
        
        rtc.doNotIgnoreActionError();
        
        rtc.beginIgnoreCheckFailed();
        
        rtc.beginIgnoreCompNotFound();
        
        rtc.doNotIgnoreConfigurationError();
        
        try {
        
        
        // Select preferences menu
        new Ub_mbr_selectEntry_byTextpath(
                rtc
            ).execute(
                "Datei/Einstellungen"
                ,
                "matches"
            );
        
        // Select PREFERENCES_PATH
        new Ub_tre_selectNode_byTextpath(
                rtc,
                rtc.getIdentifier("Preferences_ItemChoice_tre")
            ).execute(
                "absolute"
                ,
                0
                ,
                PREFERENCES_PATH
                ,
                "matches"
                ,
                1
                ,
                1
                ,
                "no"
            );
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Wait for Apply
        //new Ub_grc_waitForComponent(
                //rtc,
                //rtc.getIdentifier("nn_nn_grc")
            //).execute(
                //1000
                //,
                //10
            //);
        
        // Synch Click Apply
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("Preferences_ApplyButton_grc")
            ).execute(
            );
        //// Comment: Clicks if it exits. Assume that after clicking it will disappear
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Click Apply if exists
        //new SynchronizedClickIfExists(
                //rtc,
                //rtc.getIdentifier("Preferences_ApplyButton_grc")
            //).execute(
            //);
        
        // Sync Ok Click
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("Preferences_OkButton_grc")
            ).execute(
            );
        
        
        
        }
        
        
        catch (ActionException e) {
            log.debug("Exception during test execution", e);
            // TODO: Commented out event handler. (Commenting in does not necessarily lead to same test execution as in ITE)
            //new EHEmpty(rtc
                //).execute(
                        //);
        }
        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.Config
        //       Re-Entry Property: BREAK
        //       Used Test Case: Click O & wait
        //            new ch.ngiger.jubula.elexiscore.testcases.autmodules.preferences.ClickOkayAndWaitForWindowClose(rtc).execute(
        //            );
        
        finally {
          rtc.endLocalEventHandling(true, true, true, true);
        }
    }
}