package ch.ngiger.jubula.elexiscore.testcases.autmodules.patienten;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.api.converter.annotations.NodeType;
import org.eclipse.jubula.client.api.converter.annotations.SrcNode;
import org.eclipse.jubula.qa.api.converter.target.rcp.RuntimeContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ch.ngiger.jubula.elexiscore.testcases.autmodules.contacts.Kontakt_Auswahl_by_Familyname;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.ClickInMiddleOfComponent;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.Elexis_SlowDown_Necessary;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.SelectTopLeftCell;
import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.SynchronizedClick;
import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.SynchronizedReplaceText;
import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.Ub_cbc_selectEntry_byValue;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindow.Ub_app_waitForWindow;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindowtoclose.Ub_app_waitForWindowToClose;

@SrcNode(UUID = "31e5391fe47245138f466b8e9e8ef398",
         type = NodeType.TEST_CASE)
public class Fall_Erfassen {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Fall_Erfassen.class);

    private RuntimeContext rtc;

    public Fall_Erfassen (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }

    public void execute(
        String FAMILY_NAME,
        String ABRECHNUNGSMETHODE,
        String VERSICHERUNGSGRUND,
        String UNFALLNUMMER,
        String KOSTEN_TRAEGER,
        String START_DATE
    ) {
        AUT aut = rtc.getAUT();




        new Patient_Auswaehlen(
                rtc
            ).execute(
                FAMILY_NAME
            );

        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new OpenViewByName(
                //rtc
            //).execute(
                //"Konsultation/Fälle.*"
            //);

        // Click in table cases
        new ClickInMiddleOfComponent(
                rtc,
                rtc.getIdentifier("Cases_Table_1_tbl")
            ).execute(
            );

        // Click on Neuer Fall
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("Fälle_Neuer_Fall_tbi")
            ).execute(
            );

        // Wait for window "Neuer Fall"
        new Ub_app_waitForWindow(
                rtc
            ).execute(
                ".*Neuer Fall.*"
                ,
                "matches"
                ,
                1000
                ,
                100
            );

        // Abrechnungsmethode auswählen
        new Ub_cbc_selectEntry_byValue(
                rtc,
                rtc.getIdentifier("Neuer_Fall_Abrechnungsmethode_cbc")
            ).execute(
                ABRECHNUNGSMETHODE
                ,
                "matches"
                ,
                "absolute"
            );

        // Versicherungsgrund auswählen
        new Ub_cbc_selectEntry_byValue(
                rtc,
                rtc.getIdentifier("Neuer_Fall_Versichicherungsgrund_cbc")
            ).execute(
                VERSICHERUNGSGRUND
                ,
                "equals"
                ,
                "absolute"
            );

        // Press Leistungsträger
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("NeuerFall_Kostentrager_btn")
            ).execute(
            );

        // Select Leistungsträger by family name
        new Kontakt_Auswahl_by_Familyname(
                rtc
            ).execute(
                KOSTEN_TRAEGER
            );

        // Versicherungsnummer eingeben
        new SynchronizedReplaceText(
                rtc,
                rtc.getIdentifier("NeuerFall_Versicherungs_Nummer_txf")
            ).execute(
                "1234567890"
            );

        // Start-Datum auf 21.4.2014 setzen
        new SynchronizedReplaceText(
                rtc,
                rtc.getIdentifier("Neuer_Fall_Startdatum_txf")
            ).execute(
                "21.04.2014"
            );

        new Elexis_SlowDown_Necessary(
                rtc
            ).execute(
            );

        // Click Okay
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("NeuerFall_OK_btn")
            ).execute(
            );

        // Wait for window "Neuer Fall" to close
        new Ub_app_waitForWindowToClose(
                rtc
            ).execute(
                ".*Neuer Fall.*"
                ,
                "matches"
                ,
                1000
                ,
                100
            );

        new Elexis_SlowDown_Necessary(
                rtc
            ).execute(
            );

        // Select top most case
        new SelectTopLeftCell(
                rtc,
                rtc.getIdentifier("Cases_Table_1_tbl")
            ).execute(
            );

        new Elexis_SlowDown_Necessary(
                rtc
            ).execute(
            );




    }
}