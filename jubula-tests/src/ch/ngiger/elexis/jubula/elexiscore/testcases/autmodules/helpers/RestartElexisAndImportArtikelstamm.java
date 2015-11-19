package ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers;

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

import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.pause.Ub_app_pause;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.RestartElexisAndOpenLeistungen;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.artikelstamm.Import_Artikelstamm;

@SrcNode(UUID = "83d26ab988824e82894aa3e2d7c3f7c0",
         type = NodeType.TEST_CASE)
public class RestartElexisAndImportArtikelstamm {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(RestartElexisAndImportArtikelstamm.class);
    
    private RuntimeContext rtc;
    
    public RestartElexisAndImportArtikelstamm (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String APP_NAME
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Pause for debugging. Should be inactive when checked in
        //new Ub_app_pause(
                //rtc
            //).execute(
            //);
        
        // Restart Elexis and open Leistungen
        new RestartElexisAndOpenLeistungen(
                rtc
            ).execute(
            );
        // Comment: Filename may not contain /
        
        // Import Artikelstamm
        new Import_Artikelstamm(
                rtc
            ).execute(
                "artikelstamm_first_v2.xml"
            );
        
        
        
        
    }
}