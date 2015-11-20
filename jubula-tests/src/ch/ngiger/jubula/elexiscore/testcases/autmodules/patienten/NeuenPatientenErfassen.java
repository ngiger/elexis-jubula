package ch.ngiger.jubula.elexiscore.testcases.autmodules.patienten;

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

import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.ResetPerspective;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.OpenViewByName;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.click.Ub_grc_clickLeft_single;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindowactivation.Ub_app_waitForWindowActivation;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindow.Ub_app_waitForWindow_matches;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.select.combocomponent.Ub_cbc_selectEntry_byValue;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.componentwithtextinput.Ub_cti_replaceText;
import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.SynchronizedReplaceText;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindowtoclose.Ub_app_waitForWindowToClose;

@SrcNode(UUID = "ce047a9881aa42c8ad2b22bfedb96844",
         type = NodeType.TEST_CASE)
public class NeuenPatientenErfassen {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(NeuenPatientenErfassen.class);
    
    private RuntimeContext rtc;
    
    public NeuenPatientenErfassen (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String FAMILYNAME,
        String BIRTHDAY,
        String GIVENNAME,
        String SEX
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Reset Perspective
        new ResetPerspective(
                rtc
            ).execute(
            );
        
        // Open PatientenView
        new OpenViewByName(
                rtc
            ).execute(
                "Daten/Patienten"
            );
        
        // Click in View Patient.Namen auswählen
        new Ub_grc_clickLeft_single(
                rtc,
                rtc.getIdentifier("Patienten_SelectName_grc")
            ).execute(
            );
        
        // Click create Patient
        new Ub_grc_clickLeft_single(
                rtc,
                rtc.getIdentifier("Patient_create_tbi")
            ).execute(
            );
        
        // Wait for create patient window
        new Ub_app_waitForWindowActivation(
                rtc
            ).execute(
                "Patient erfassen.*"
                ,
                "matches"
                ,
                1000
                ,
                0
            );
        
        // Wait for create patient window
        new Ub_app_waitForWindow_matches(
                rtc
            ).execute(
                "Patient erfassen.*"
                ,
                100
                ,
                0
            );
        
        // Select sex by value
        new Ub_cbc_selectEntry_byValue(
                rtc,
                rtc.getIdentifier("CreatePatient_ChooseSexe_cbx")
            ).execute(
                SEX
                ,
                "matches"
                ,
                "absolute"
            );
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Enter family name
        //new Ub_cti_replaceText(
                //rtc,
                //rtc.getIdentifier("CreatePatient_FamilyName_cti")
            //).execute(
                //FAMILYNAME
            //);
        
        // Enter family name
        new SynchronizedReplaceText(
                rtc,
                rtc.getIdentifier("CreatePatient_FamilyName_cti")
            ).execute(
                FAMILYNAME
            );
        
        // Enter given name
        new Ub_cti_replaceText(
                rtc,
                rtc.getIdentifier("CreatePatient_ChristianName_cti")
            ).execute(
                GIVENNAME
            );
        
        // Enter birthday
        new Ub_cti_replaceText(
                rtc,
                rtc.getIdentifier("CreatePatient_Birthday_cti")
            ).execute(
                BIRTHDAY
            );
        
        // Click Okay
        new Ub_grc_clickLeft_single(
                rtc,
                rtc.getIdentifier("CreatePatient_OkButton_grc")
            ).execute(
            );
        
        // Wait close window create patient
        new Ub_app_waitForWindowToClose(
                rtc
            ).execute(
                "Patient erfassen.*"
                ,
                "matches"
                ,
                500
                ,
                0
            );
        
        
        
        
    }
}