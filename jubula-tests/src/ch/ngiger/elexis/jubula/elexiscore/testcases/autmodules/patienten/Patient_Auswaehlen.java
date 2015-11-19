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

import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.OpenViewByName;
import ch.ngiger.elexis.jubula.elexiscore.testcases.unboundmodules.SynchronizedReplaceText;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.select.table.Ub_tbl_selectCell;

@SrcNode(UUID = "c314071447ba4a3785bd670b4e597c7b",
         type = NodeType.TEST_CASE)
public class Patient_Auswaehlen {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Patient_Auswaehlen.class);
    
    private RuntimeContext rtc;
    
    public Patient_Auswaehlen (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String FAMILY_NAME
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Open view Patienten
        new OpenViewByName(
                rtc
            ).execute(
                "Daten/Patienten.*"
            );
        
        // Enter Familyname
        new SynchronizedReplaceText(
                rtc,
                rtc.getIdentifier("Patienten_SelectName_grc")
            ).execute(
                FAMILY_NAME
            );
        
        // Select first entry
        new Ub_tbl_selectCell(
                rtc,
                rtc.getIdentifier("Pat_List_tbl")
            ).execute(
                "1"
                ,
                "equals"
                ,
                "1"
                ,
                "equals"
                ,
                1
                ,
                12
                ,
                "percent"
                ,
                12
                ,
                "percent"
                ,
                "no"
                ,
                1
            );
        
        
        
        
    }
}