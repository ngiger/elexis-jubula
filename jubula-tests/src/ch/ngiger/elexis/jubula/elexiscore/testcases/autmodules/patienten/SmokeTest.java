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

import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.OpenPerspectiveByName;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.ResetPerspective;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.patienten.SelectPatientFromListIfAny;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.patienten.Neupatient_mit_Kons_und_Rechnung;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.EHEmpty;

@SrcNode(UUID = "97fd294629044f63b3a4deac73cca5e3",
         type = NodeType.TEST_CASE)
public class SmokeTest {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SmokeTest.class);
    
    private RuntimeContext rtc;
    
    public SmokeTest (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        rtc.doNotIgnoreActionError();
        
        rtc.doNotIgnoreCheckFailed();
        
        rtc.doNotIgnoreCompNotFound();
        
        rtc.doNotIgnoreConfigurationError();
        
        try {
        
        
        // Patienten Perspektive öffnen
        new OpenPerspectiveByName(
                rtc
            ).execute(
                ".*default.*"
            );
        
        // Perspektive zurücksetzen
        new ResetPerspective(
                rtc
            ).execute(
            );
        
        // Select a patient (if we run with a DemoDB)
        new SelectPatientFromListIfAny(
                rtc
            ).execute(
            );
        
        // Use case: patient comes in, gets drug, pays
        new Neupatient_mit_Kons_und_Rechnung(
                rtc
            ).execute(
            );
        
        
        
        }
        
        
        catch (ActionException e) {
            log.debug("Exception during test execution", e);
            // TODO: Commented out event handler. (Commenting in does not necessarily lead to same test execution as in ITE)
            //new EHEmpty(rtc
                //).execute(
                        //);
        }
        
        catch (CheckFailedException e) {
            log.debug("Exception during test execution", e);
            // TODO: Commented out event handler. (Commenting in does not necessarily lead to same test execution as in ITE)
            //new EHEmpty(rtc
                //).execute(
                        //);
        }
        
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