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

import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.Screenshot;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.ClickOkayIfMultipleProblems;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.DefaultSpeicherdauerSetzen;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.ResetPerspective;

@SrcNode(UUID = "d9e60504cb584eaca241b259b3ae009d",
         type = NodeType.TEST_CASE)
public class ElexisSetup {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(ElexisSetup.class);
    
    private RuntimeContext rtc;
    
    public ElexisSetup (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        rtc.doNotIgnoreActionError();
        
        rtc.beginIgnoreCheckFailed();
        
        rtc.beginIgnoreCompNotFound();
        
        rtc.beginIgnoreConfigurationError();
        
        try {
        
        
        // Snapshot
        new Screenshot(
                rtc
            ).execute(
                "screenshots/startup_window_1.png"
            );
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Avoid problems with window "Multiple problem occured"
        //new ClickOkayIfMultipleProblems(
                //rtc
            //).execute(
            //);
        
        for (CTDS.LOGGING row : CTDS.LOGGING.data) {
            // Speicherdauer setzen (auf 30)
            new DefaultSpeicherdauerSetzen(
                rtc,
                null
            ).execute(
                );
        }
        
        new ResetPerspective(
                rtc
            ).execute(
            );
        
        
        
        }
        
        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.Action
        //       Re-Entry Property: BREAK
        //       Used Test Case: Restart on action Error
        //            new ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.RestartElexisAndImportArtikelstamm(rtc).execute(
        //                ".*lexis.*"
        //            );
        
        finally {
          rtc.endLocalEventHandling(true, true, true, true);
        }
    }
}