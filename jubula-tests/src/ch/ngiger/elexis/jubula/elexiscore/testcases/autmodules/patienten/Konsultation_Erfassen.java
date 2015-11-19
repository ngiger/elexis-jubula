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

import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.Screenshot;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.Elexis_SlowDown_Necessary;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.select.tabbedcomponent.Ub_tbc_selectTab_byValue;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.Ub_app_wait;
import ch.ngiger.elexis.jubula.elexiscore.testcases.unboundmodules.SynchronizedClick;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.select.contextmenu.Ub_grc_selectContextMenuEntry_byTextpath;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.ClickInMiddleOfComponent;
import ch.ngiger.elexis.jubula.elexiscore.testcases.unboundmodules.SynchronizedReplaceText;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.select.tree.Ub_tre_selectNode_byTextpath;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.Ub_grc_waitForComponent;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.WaitForElexisMainWindow;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindowtoclose.Ub_app_waitForWindowToClose;

@SrcNode(UUID = "ae9ad522d2304e999f75afe5f6b6ae3d",
         type = NodeType.TEST_CASE)
public class Konsultation_Erfassen {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Konsultation_Erfassen.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier Elexis300qualifier00737_CTabFolder_2_tpn;
    
    private ComponentIdentifier Elexis300qualifier0070_Konsultation_ToolItem_1_tbi;
    
    
    public Konsultation_Erfassen (RuntimeContext _rtc,
        
        ComponentIdentifier _Elexis300qualifier00737_CTabFolder_2_tpn,
        
        ComponentIdentifier _Elexis300qualifier0070_Konsultation_ToolItem_1_tbi
    ) {
        rtc = _rtc;
        
        Elexis300qualifier00737_CTabFolder_2_tpn = _Elexis300qualifier00737_CTabFolder_2_tpn;
        
        Elexis300qualifier0070_Konsultation_ToolItem_1_tbi = _Elexis300qualifier0070_Konsultation_ToolItem_1_tbi;
    }
    
    public void execute(
        String KONS_TEXT
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        new Screenshot(
                rtc
            ).execute(
                "screenshots/Kons_erfassen_start.png"
            );
        
        new Elexis_SlowDown_Necessary(
                rtc
            ).execute(
            );
        
        // Konsfenster auswählen
        new Ub_tbc_selectTab_byValue(
                rtc,
                rtc.getIdentifier("Elexis300qualifier00725_CTabFolder_2_tpn")
            ).execute(
                ".*Konsultation.*"
                ,
                "matches"
            );
        
        new Elexis_SlowDown_Necessary(
                rtc
            ).execute(
            );
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Warte, bis sich Elexis beruhigt hat. Wäre schoen wenn wir den Patientenamen sehen würden
        //new Ub_app_wait(
                //rtc
            //).execute(
                //1000
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Click in Konstext
        //new SynchronizedClick(
                //rtc,
                //rtc.getIdentifier("Kons_Texteingabe_txf")
            //).execute(
            //);
        
        new Screenshot(
                rtc
            ).execute(
                "screenshots/Kons_create_tbi_pressed.png"
            );
        
        new Elexis_SlowDown_Necessary(
                rtc
            ).execute(
            );
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Click Neue Kons erstellen
        //new SynchronizedClick(
                //rtc,
                //rtc.getIdentifier("Kons_create_tbi")
            //).execute(
            //);
        
        // Neue Kons via Context Menu
        new Ub_grc_selectContextMenuEntry_byTextpath(
                rtc,
                rtc.getIdentifier("Elexis300qualifier0070_Konsultation_ToolItem_1_tbi")
            ).execute(
                "Neue Konsultation"
                ,
                "equals"
                ,
                1
            );
        
        // Screenshot created
        new Screenshot(
                rtc
            ).execute(
                "screenshots/Kons_should_have_created_kons.png"
            );
        
        // Click in middle of konstext
        new ClickInMiddleOfComponent(
                rtc,
                rtc.getIdentifier("Kons_Texteingabe_txf")
            ).execute(
            );
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Tab Konsultationen öffnen
        //new Ub_tbc_selectTab_byValue(
                //rtc,
                //rtc.getIdentifier("Elexis300qualifier00737_CTabFolder_2_tpn")
            //).execute(
                //".*Konsult.*"
                //,
                //" matches"
            //);
        
        // Konsultationstext eingeben
        new SynchronizedReplaceText(
                rtc,
                rtc.getIdentifier("Kons_Texteingabe_txf")
            ).execute(
                KONS_TEXT
            );
        
        // Start Diagnose
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("Kons_Texteingabe_txf")
            ).execute(
            );
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new Ub_tre_selectNode_byTextpath(
                //rtc,
                //rtc.getIdentifier("nn_nn_tre")
            //).execute(
                //"absolute"
                //,
                //0
                //,
                //"B Blut/\'B2 Gerinnungsstörungen\'"
                //,
                //"equals"
                //,
                //1
                //,
                //1
                //,
                //"no"
            //);
        
        // Freitext-Diagnose öffnen
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("Kons_Diagnose_Freitext_öffnen")
            ).execute(
            );
        
        // Wait for freitext
        new Ub_grc_waitForComponent(
                rtc,
                rtc.getIdentifier("Kons_Freitext_txt")
            ).execute(
                1000
                ,
                100
            );
        
        // Enter freitext diagnose
        new SynchronizedReplaceText(
                rtc,
                rtc.getIdentifier("Kons_Freitext_txt")
            ).execute(
                KONS_TEXT
            );
        
        // Press okay
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("CreatePatient_OkButton_grc")
            ).execute(
            );
        
        // Wait for Freitext window to close
        new WaitForElexisMainWindow(
                rtc
            ).execute(
                "5000"
            );
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Press Okay
        //new SynchronizedClick(
                //rtc,
                //rtc.getIdentifier("CreatePatient_OkButton_grc")
            //).execute(
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new Ub_app_waitForWindowToClose(
                //rtc
            //).execute(
                //"\"\""
                //,
                //"equals"
                //,
                //1000
                //,
                //10
            //);
        
        // Save via Tab
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("Konsfenster_Save_tbi")
            ).execute(
            );
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //aut.execute(
            //org.eclipse.jubula.toolkit.concrete.ConcreteComponents.createTabComponent(Elexis300qualifier00737_CTabFolder_2_tpn)
                //.selectTabByValue(
                    //"*Konsultation"
                    //,
                    //Operator.literalAsEnum("equals")
                    //),
            //null);
            
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //aut.execute(
            //org.eclipse.jubula.toolkit.swt.SwtComponents.createToolItem(Elexis300qualifier0070_Konsultation_ToolItem_1_tbi)
                //.selectContextMenuEntryByTextpath(
                    //"Neue Konsultation"
                    //,
                    //Operator.literalAsEnum("equals")
                    //,
                    //InteractionMode.valueOf(1)
                    //),
            //null);
            
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //aut.execute(
            //org.eclipse.jubula.toolkit.swt.SwtComponents.createApplication()
                //.waitForWindow(
                    //"Zweite Konsultation für heute?"
                    //,
                    //Operator.literalAsEnum("equals")
                    //,
                    //15000
                    //,
                    //500
                    //),
            //null);
            
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //aut.execute(
            //org.eclipse.jubula.toolkit.swt.SwtComponents.createApplication()
                //.waitForWindowToClose(
                    //"Zweite Konsultation für heute?"
                    //,
                    //Operator.literalAsEnum("equals")
                    //,
                    //20000
                    //,
                    //500
                    //),
            //null);
            
        
        
        
    }
}