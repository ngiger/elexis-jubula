package ch.ngiger.jubula.elexiscore.testcases.autmodules.artikelstamm;

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
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.LoggerToText;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.ResetPerspective;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.Screenshot;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.select.tabbedcomponent.Ub_tbc_selectTab_byValue;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.Ub_app_wait;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.Elexis_SlowDown_Necessary;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.select.contextmenu.Ub_grc_selectContextMenuEntry_byTextpath;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindow.Ub_app_waitForWindow;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.keycombination.Ub_app_pressKeyCombination_CTRL_A;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.keycombination.Ub_app_pressAnyKey_DELETE;
import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.SynchronizedReplaceText;
import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.SynchronizedClick;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindowtoclose.Ub_app_waitForWindowToClose;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.check.Ub_grc_checkExistence;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.WaitForElexisMainWindow;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.click.Ub_grc_clickInComponent;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.store.table.Ub_tbl_storeValueWithCellSpec;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.executeexternalcommand.Ub_app_executeExternalCommand;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.EHEmpty;

@SrcNode(UUID = "97fa53a2477946e39a1e1e2ab4c6c537",
         type = NodeType.TEST_CASE)
public class Import_Artikelstamm {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Import_Artikelstamm.class);
    
    private RuntimeContext rtc;
    
    public Import_Artikelstamm (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    /** Filename may not contain / */
    public void execute(
        String FILENAME
    ) {
        AUT aut = rtc.getAUT();
        
        
        rtc.beginIgnoreActionError();
        
        rtc.doNotIgnoreCheckFailed();
        
        rtc.doNotIgnoreCompNotFound();
        
        rtc.doNotIgnoreConfigurationError();
        
        try {
        
        
        // Open Artikel perspective
        new OpenPerspectiveByName(
                rtc
            ).execute(
                "Artikel"
            );
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Log Filename
        //new LoggerToText(
                //rtc
            //).execute(
                //"File_to_import " + FILENAME + ""
            //);
        
        // Reset Perspective
        new ResetPerspective(
                rtc
            ).execute(
            );
        
        // Screenshot perspective
        new Screenshot(
                rtc
            ).execute(
                "screenshots/import_artikelstamm/p_artikel.png"
            );
        
        // Selet Tab Artikel
        new Ub_tbc_selectTab_byValue(
                rtc,
                rtc.getIdentifier("CTab_Artikel_Lager_Kompendium")
            ).execute(
                "*Artikel"
                ,
                "equals"
            );
        
        // Create Screenshot of Tab Artikel
        new Screenshot(
                rtc
            ).execute(
                "screenshots/import_artikelstamm/tab_artikel.png"
            );
        
        // Select Tab Artikelstamm
        new Ub_tbc_selectTab_byValue(
                rtc,
                rtc.getIdentifier("CTab_Artikel")
            ).execute(
                "Artikelstamm"
                ,
                "equals"
            );
        
        new Ub_tbc_selectTab_byValue(
                rtc,
                rtc.getIdentifier("CTab_Artikel_Lager_Kompendium")
            ).execute(
                "*Artikel"
                ,
                "equals"
            );
        
        // Loose a second to be on the safe side
        new Ub_app_wait(
                rtc
            ).execute(
                1000
            );
        
        // Create Screenshot of Tab Artikelstamm
        new Screenshot(
                rtc
            ).execute(
                "screenshots/import_artikelstamm/tab_artikelstamm.png"
            );
        
        // SlowDown
        new Elexis_SlowDown_Necessary(
                rtc
            ).execute(
            );
        
        // Click Toolbar..Import 
        new Ub_grc_selectContextMenuEntry_byTextpath(
                rtc,
                rtc.getIdentifier("Artikelstamm_ToolbarMenu")
            ).execute(
                "Import.*"
                ,
                "matches"
                ,
                1
            );
        
        // Wait for window "Datenimport"
        new Ub_app_waitForWindow(
                rtc
            ).execute(
                "Datenimport"
                ,
                "equals"
                ,
                1000
                ,
                100
            );
        
        // Select all (old value)
        new Ub_app_pressKeyCombination_CTRL_A(
                rtc
            ).execute(
            );
        
        // Delete
        new Ub_app_pressAnyKey_DELETE(
                rtc
            ).execute(
            );
        
        new Elexis_SlowDown_Necessary(
                rtc
            ).execute(
            );
        
        // Enter filenname to import
        new SynchronizedReplaceText(
                rtc,
                rtc.getIdentifier("Artikelstamm_import_file")
            ).execute(
                FILENAME
            );
        
        // Create Screenshot of entered filename
        new Screenshot(
                rtc
            ).execute(
                "screenshots/import_artikelstamm/" + FILENAME + ".png"
            );
        
        new Elexis_SlowDown_Necessary(
                rtc
            ).execute(
            );
        
        // Press OK
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("CreatePatient_OkButton_grc")
            ).execute(
            );
        
        // Wait for import to close
        new Ub_app_waitForWindowToClose(
                rtc
            ).execute(
                "Datenimport"
                ,
                "equals"
                ,
                120000
                ,
                100
            );
        
        // Check Artikel_import_already_imported_ok_btn
        new Ub_grc_checkExistence(
                rtc,
                rtc.getIdentifier("Artikel_import_already_imported_ok_btn")
            ).execute(
                false
            );
        
        // Wait 5 seconds
        new Ub_app_wait(
                rtc
            ).execute(
                5000
            );
        
        // Wait for Elexis main window
        new WaitForElexisMainWindow(
                rtc
            ).execute(
                "5000"
            );
        
        // Screenshot Artikelstamm_Import_done.png
        new Screenshot(
                rtc
            ).execute(
                "screenshots/import_artikelstamm/Artikelstamm_Import_done.png"
            );
        
        // Enter Aspirin to search
        new SynchronizedReplaceText(
                rtc,
                rtc.getIdentifier("Artikelstamm_Bezeichung_txt")
            ).execute(
                "Aspirin"
            );
        
        // Refresh Artikelstamm
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("Artikelstamm_refresh_btn")
            ).execute(
            );
        
        // Give Elexis some time to show the drug
        new Elexis_SlowDown_Necessary(
                rtc
            ).execute(
            );
        
        // Select first article
        new Ub_grc_clickInComponent(
                rtc,
                rtc.getIdentifier("Artikelstamm_Table_1_tbl")
            ).execute(
                1
                ,
                1
                ,
                3
                ,
                "percent"
                ,
                30
                ,
                "percent"
            );
        
        // Store Text in Artikelname
        new Ub_tbl_storeValueWithCellSpec(
                rtc,
                rtc.getIdentifier("Artikelstamm_Table_1_tbl")
            ).execute(
                "ARTIKELNAME"
                ,
                "1"
                ,
                "equals"
                ,
                "1"
                ,
                "equals"
            );
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Logger Artikelstamm
        //new Ub_app_executeExternalCommand(
                //rtc
            //).execute(
                //"logger Found first article " + VariableStore.getInstance().getValue("ARTIKELNAME") + ""
                //,
                //0
                //,
                //true
                //,
                //1000
            //);
        
        // Screenshot Artikelstamm Aspirin
        new Screenshot(
                rtc
            ).execute(
                "screenshots/import_artikelstamm/Artikelstamm_Aspirin.png"
            );
        
        
        
        }
        
        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.VerifyFailed
        //       Re-Entry Property: RETRY
        //       Used Test Case: Click Okay
        //            new ch.ngiger.jubula.elexiscore.testcases.unboundmodules.SynchronizedClickIfExists(rtc).execute(
        //            );
        
        catch (ComponentNotFoundException e) {
            log.debug("Exception during test execution", e);
            // TODO: Commented out event handler. (Commenting in does not necessarily lead to same test execution as in ITE)
            //new EHEmpty(rtc
                //).execute(
                        //);
        }
        
        catch (ConfigurationException e) {
            log.debug("Exception during test execution", e);
            // TODO: Commented out event handler. (Commenting in does not necessarily lead to same test execution as in ITE)
            //new EHEmpty(rtc
                //).execute(
                        //);
        }
        
        finally {
          rtc.endLocalEventHandling(true, true, true, true);
        }
    }
}