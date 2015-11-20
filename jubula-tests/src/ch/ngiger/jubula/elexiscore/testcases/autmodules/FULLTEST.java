package ch.ngiger.jubula.elexiscore.testcases.autmodules;

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

import ch.ngiger.jubula.elexiscore.testcases.autmodules.sw_installation.SW_check_for_updates;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.sw_installation.Install_all_SW_components_from_all_sites;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.OpenPerspectiveLeistungFirstTime;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.artikelstamm.Import_Artikelstamm;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.patienten.SmokeTest;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.preferences.SelectItemPressOkay;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.OpenPerspectiveByNameAndTakeSnapshot;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.OpenViewAndTakeSnapshot;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.Screenshot;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.RestartElexisAndImportArtikelstamm;

@SrcNode(UUID = "59d8e7e0c26848a8b760f143602d92e1",
         type = NodeType.TEST_CASE)
public class FULLTEST {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(FULLTEST.class);
    
    private RuntimeContext rtc;
    
    public FULLTEST (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        rtc.doNotIgnoreActionError();
        
        rtc.beginIgnoreCheckFailed();
        
        try {
        
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Help..Check for updates
        //new SW_check_for_updates(
                //rtc,
                //rtc.getIdentifier("SW_update_information_ok_btn")
            //).execute(
                //""
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Alle-SW-Installieren
        //new Install_all_SW_components_from_all_sites(
                //rtc
            //).execute(
            //);
        
        // First open Leistungen
        new OpenPerspectiveLeistungFirstTime(
                rtc
            ).execute(
            );
        //// Comment: Filename may not contain /
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Artikelstamm importieren
        //new Import_Artikelstamm(
                //rtc
            //).execute(
                //"artikelstamm_first_v2.xml"
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Smoketest für Elexis. Demo-Konsultation
        //new SmokeTest(
                //rtc
            //).execute(
            //);
        // Comment: May 24 2014: Fails with teamw and a lot of other Labors
        
        for (CTDS.PREFERENCES row : CTDS.PREFERENCES.data) {
            // Visit all preference pages and take a snapshot of each
            new SelectItemPressOkay(
                rtc
            ).execute(
                row.PREFERENCES_PATH
                );
        }
        // Comment: May 24. Fails with teamw and a lot of other Labors
        
        for (CTDS.PERSPECTIVES row : CTDS.PERSPECTIVES.data) {
            // Open all perspectives and take a snapshot of each
            new OpenPerspectiveByNameAndTakeSnapshot(
                rtc
            ).execute(
                row.NAME,
                row.SCREENSHOT
                );
        }
        
        for (CTDS.VIEWS row : CTDS.VIEWS.data) {
            // Open all views and take a snapshot of each
            new OpenViewAndTakeSnapshot(
                rtc
            ).execute(
                row.VIEWNAME,
                row.SCREENSHOT
                );
        }
        
        // Screenshot of last windows
        new Screenshot(
                rtc
            ).execute(
                "screenshots/last_window_1.png"
            );
        
        
        
        }
        
        
        catch (ActionException e) {
            log.debug("Exception during test execution", e);
            // TODO: Commented out event handler. (Commenting in does not necessarily lead to same test execution as in ITE)
            //new RestartElexisAndImportArtikelstamm(rtc
                //).execute(
                        //".*lexis.*"
                        
                        //);
        }
        
        finally {
          rtc.endLocalEventHandling(true, true, false, false);
        }
    }
}