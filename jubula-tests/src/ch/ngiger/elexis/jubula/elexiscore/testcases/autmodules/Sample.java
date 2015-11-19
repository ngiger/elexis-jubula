package ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules;

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

import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.ClickOkayIfMultipleProblems;
import ch.ngiger.elexis.jubula.elexiscore.testcases.work_ng.PrintEnvironmentToFile;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.RestartElexisAndImportArtikelstamm;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.ElexisSetup;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.patienten.NeuenPatientenErfassen;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.click.Ub_grc_clickLeft_single;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.keycombination.Ub_app_pressAnyKey_ENTER;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.takescreenshot.Ub_app_takeScreenshotOfActiveWindow;

@SrcNode(UUID = "73e71773bafb43c293bb7fcb04b3af21",
         type = NodeType.TEST_CASE)
public class Sample {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Sample.class);
    
    private RuntimeContext rtc;
    
    public Sample (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        rtc.doNotIgnoreActionError();
        
        try {
        
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Avoid multiple problems
        //new ClickOkayIfMultipleProblems(
                //rtc
            //).execute(
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new PrintEnvironmentToFile(
                //rtc
            //).execute(
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new RestartElexisAndImportArtikelstamm(
                //rtc
            //).execute(
                //".*lexis.*"
            //);
        
        new ElexisSetup(
                rtc
            ).execute(
            );
        
        for (CTDS.PATIENTEN row : CTDS.PATIENTEN.data) {
            new NeuenPatientenErfassen(
                rtc
            ).execute(
                row.FAMILYNAME,
                row.BIRTHDAY,
                row.GIVENNAME,
                row.SEX
                );
        }
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new Ub_grc_clickLeft_single(
                //rtc,
                //rtc.getIdentifier("nn_nn_grc")
            //).execute(
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new Ub_app_pressAnyKey_ENTER(
                //rtc
            //).execute(
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new Ub_app_takeScreenshotOfActiveWindow(
                //rtc
            //).execute(
                //"screenshots/created_patients.png"
            //);
        
        
        
        }
        
        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.Action
        //       Re-Entry Property: RETRY
        //       Used Test Case: 
        //            new RestartElexisAndImportArtikelstamm(rtc).execute(
        //                ".*lexis.*"
        //            );
        
        finally {
          rtc.endLocalEventHandling(false, true, false, false);
        }
    }
}