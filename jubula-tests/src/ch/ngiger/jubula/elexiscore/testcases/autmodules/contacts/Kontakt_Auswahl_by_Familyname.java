package ch.ngiger.jubula.elexiscore.testcases.autmodules.contacts;

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

import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindow.Ub_app_waitForWindow;
import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.SynchronizedReplaceText;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.SelectTopLeftCell;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.SlowDown_Necessary;
import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.SynchronizedClick;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindowtoclose.Ub_app_waitForWindowToClose;

@SrcNode(UUID = "cae5e081bb2b432a8ebffcd9a42bb65c",
         type = NodeType.TEST_CASE)
public class Kontakt_Auswahl_by_Familyname {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Kontakt_Auswahl_by_Familyname.class);
    
    private RuntimeContext rtc;
    
    public Kontakt_Auswahl_by_Familyname (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String KOSTEN_TRAEGER
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Wait for "Kontakt auswählen" window
        new Ub_app_waitForWindow(
                rtc
            ).execute(
                "Kontakt ausw.*"
                ,
                "matches"
                ,
                1000
                ,
                100
            );
        
        // Enter Familie name in contact chooser
        new SynchronizedReplaceText(
                rtc,
                rtc.getIdentifier("Kontaktauswählen_Bezeichung_1_name_txf")
            ).execute(
                KOSTEN_TRAEGER
            );
        
        // Select top left contact
        new SelectTopLeftCell(
                rtc,
                rtc.getIdentifier("Kontaktauswählen_Table_2_tbl")
            ).execute(
            );
        
        new SlowDown_Necessary(
                rtc
            ).execute(
            );
        
        // Press okay
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("SW_Available_Sites_Okay_btn")
            ).execute(
            );
        
        // Wait for "Kontakt auswählen" window to close
        new Ub_app_waitForWindowToClose(
                rtc
            ).execute(
                "Kontakt ausw.*"
                ,
                "matches"
                ,
                1000
                ,
                100
            );
        
        
        
        
    }
}