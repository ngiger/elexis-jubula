package ch.ngiger.jubula.elexiscore.testsuites.testsuites;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.api.converter.annotations.NodeType;
import org.eclipse.jubula.client.api.converter.annotations.SrcNode;
import org.eclipse.jubula.qa.api.converter.target.rcp.RuntimeContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ch.ngiger.jubula.elexiscore.testcases.autmodules.artikelstamm.Import_Artikelstamm;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.OpenPerspectiveLeistungFirstTime;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.patienten.SmokeTest;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.click.Ub_grc_clickLeft_single;

@SrcNode(UUID = "db18cfe07d8e49cd8bf0a5086fe80a64",
         type = NodeType.TEST_SUITE)
public class SMOKETEST {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SMOKETEST.class);

    private RuntimeContext rtc = null;

    public SMOKETEST (AUT _aut) {
    	if (_aut != null){
    		rtc = new RuntimeContext(_aut, true, false, false, true);
    	}
    }

    public void execute(
    ) {
		log.info("smoketest. execute");


        // Patientenperspektive anklicken
        new Ub_grc_clickLeft_single(
                rtc,
                rtc.getIdentifier("Elexis300a201408211304_PatientPerspective_tbi")
            ).execute(
            );
		log.info("smoketest. execute");

        // Open Leistungen First (LOINC)
        new OpenPerspectiveLeistungFirstTime(
                rtc
            ).execute(
            );
        // Comment: Filename may not contain /

		log.info("smoketest. execute");
        // Import Artikelstamm from current directory
        new Import_Artikelstamm(
                rtc
            ).execute(
                "artikelstamm_first_v2.xml"
            );
		log.info("smoketest. execute");

        // Elexis Smoketest
        new SmokeTest(
                rtc
            ).execute(
            );

		log.info("smoketest. execute");


    }
}