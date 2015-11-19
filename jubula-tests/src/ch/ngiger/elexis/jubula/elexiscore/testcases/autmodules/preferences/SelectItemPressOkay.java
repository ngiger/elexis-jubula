package ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.preferences;

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

import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.preferences.SelectPreferenceItem;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.DealWithOccasionalDialog;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.Screenshot;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.preferences.ClickOkayAndWaitForWindowClose;

@SrcNode(UUID = "3b518420a4c24fcda15931a3279cd45d",
         type = NodeType.TEST_CASE)
public class SelectItemPressOkay {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SelectItemPressOkay.class);
    
    private RuntimeContext rtc;
    
    public SelectItemPressOkay (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String PREFERENCES_PATH
    ) {
        AUT aut = rtc.getAUT();
        
        
        rtc.doNotIgnoreActionError();
        
        rtc.doNotIgnoreCheckFailed();
        
        rtc.doNotIgnoreCompNotFound();
        
        try {
        
        
        new SelectPreferenceItem(
                rtc
            ).execute(
                PREFERENCES_PATH
            );
        // Comment: See http://testing.bredex.de/deal-with-occasional-dialog.html
        
        new DealWithOccasionalDialog(
                rtc,
                rtc.getIdentifier("Could_not_accept_changes_ok_btn")
            ).execute(
                "Could Not Accept Changes"
            );
        
        // Take a snapshot
        new Screenshot(
                rtc
            ).execute(
                "screenshots/preferences/" + PREFERENCES_PATH + ".png"
            );
        
        new ClickOkayAndWaitForWindowClose(
                rtc
            ).execute(
            );
        
        
        
        }
        
        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.Action
        //       Re-Entry Property: BREAK
        //       Used Test Case: RestartElexisOnActionError
        //            new ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.RestartElexisAndImportArtikelstamm(rtc).execute(
        //                ".*lexis.*"
        //            );
        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.VerifyFailed
        //       Re-Entry Property: BREAK
        //       Used Test Case: ClickCancel
        //            new ch.ngiger.elexis.jubula.elexiscore.testcases.unboundmodules.SynchronizedClickIfExists(rtc).execute(
        //            );
        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.CompNotFound
        //       Re-Entry Property: BREAK
        //       Used Test Case: Break on Compent Not Found
        //            new ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.EHEmpty(rtc).execute(
        //            );
        
        finally {
          rtc.endLocalEventHandling(true, true, true, false);
        }
    }
}