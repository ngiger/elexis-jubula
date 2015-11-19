package ch.ngiger.elexis.jubula.elexiscore.testsuites.testsuites;

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

import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.click.Ub_grc_clickLeft_single;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.OpenPerspectiveLeistungFirstTime;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.artikelstamm.Import_Artikelstamm;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.patienten.SmokeTest;

@SrcNode(UUID = "db18cfe07d8e49cd8bf0a5086fe80a64",
         type = NodeType.TEST_SUITE)
public class SMOKETEST {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SMOKETEST.class);
    
    private RuntimeContext rtc;
    
    public SMOKETEST (AUT _aut) {
        rtc = new RuntimeContext(_aut, true, false, false, true);
    }
    
    public void execute(
    ) {
        
        
        
        
        // Patientenperspektive anklicken
        new Ub_grc_clickLeft_single(
                rtc,
                rtc.getIdentifier("Elexis300a201408211304_PatientPerspective_tbi")
            ).execute(
            );
        
        // Open Leistungen First (LOINC)
        new OpenPerspectiveLeistungFirstTime(
                rtc
            ).execute(
            );
        // Comment: Filename may not contain /
        
        // Import Artikelstamm from current directory
        new Import_Artikelstamm(
                rtc
            ).execute(
                "artikelstamm_first_v2.xml"
            );
        
        // Elexis Smoketest
        new SmokeTest(
                rtc
            ).execute(
            );
        
        
        
    }
}