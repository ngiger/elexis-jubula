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

import ch.ngiger.jubula.elexiscore.testcases.autmodules.patienten.NeuenPatientenErfassen;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.patienten.SelectPatientFromListIfAny;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.patienten.Fall_Erfassen;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.patienten.Konsultation_Erfassen;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.patienten.MedikamentHinzufuegen;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.Elexis_SlowDown_Necessary;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.patienten.Kons_Verrechnen;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.RestartElexisAndImportArtikelstamm;

@SrcNode(UUID = "e6a4abe8db47468cb4daf523b2323cec",
         type = NodeType.TEST_CASE)
public class Neupatient_mit_Kons_und_Rechnung {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Neupatient_mit_Kons_und_Rechnung.class);
    
    private RuntimeContext rtc;
    
    public Neupatient_mit_Kons_und_Rechnung (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        rtc.doNotIgnoreActionError();
        
        rtc.beginIgnoreCheckFailed();
        
        rtc.doNotIgnoreCompNotFound();
        
        rtc.doNotIgnoreConfigurationError();
        
        try {
        
        
        for (CTDS.PATIENTEN_2 row : CTDS.PATIENTEN_2.data) {
            new NeuenPatientenErfassen(
                rtc
            ).execute(
                row.FAMILYNAME,
                row.BIRTHDAY,
                row.GIVENNAME,
                row.SEX
                );
        }
        
        for (CTDS.PATIENTEN_2 row : CTDS.PATIENTEN_2.data) {
            new SelectPatientFromListIfAny(
                rtc
            ).execute(
                );
        }
        
        new Fall_Erfassen(
                rtc
            ).execute(
                "Miller"
                ,
                "KVG"
                ,
                "Krankheit"
                ,
                "Unfall # 397"
                ,
                "Miller"
                ,
                "14.05.2014"
            );
        
        new Konsultation_Erfassen(
                rtc,
                rtc.getIdentifier("Elexis300qualifier00737_CTabFolder_2_tpn"),
                rtc.getIdentifier("Elexis300qualifier0070_Konsultation_ToolItem_1_tbi")
            ).execute(
                "Erste Konsultation wegen Molemax"
            );
        
        new MedikamentHinzufuegen(
                rtc
            ).execute(
                "Aspirin"
            );
        
        new Elexis_SlowDown_Necessary(
                rtc
            ).execute(
            );
        
        new Kons_Verrechnen(
                rtc
            ).execute(
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
        
        catch (ComponentNotFoundException e) {
            log.debug("Exception during test execution", e);
            // TODO: Commented out event handler. (Commenting in does not necessarily lead to same test execution as in ITE)
            //new RestartElexisAndImportArtikelstamm(rtc
                //).execute(
                        //".*lexis.*"
                        
                        //);
        }
        
        catch (ConfigurationException e) {
            log.debug("Exception during test execution", e);
            // TODO: Commented out event handler. (Commenting in does not necessarily lead to same test execution as in ITE)
            //new RestartElexisAndImportArtikelstamm(rtc
                //).execute(
                        //".*lexis.*"
                        
                        //);
        }
        
        finally {
          rtc.endLocalEventHandling(true, true, true, true);
        }
    }
}