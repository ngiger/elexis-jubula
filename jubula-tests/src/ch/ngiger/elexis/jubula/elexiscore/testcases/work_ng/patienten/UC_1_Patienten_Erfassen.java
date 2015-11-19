package ch.ngiger.elexis.jubula.elexiscore.testcases.work_ng.patienten;

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

import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.patienten.NeuenPatientenErfassen;

@SrcNode(UUID = "4843a57fbc974060ae3bafa19196b8da",
         type = NodeType.TEST_CASE)
public class UC_1_Patienten_Erfassen {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(UC_1_Patienten_Erfassen.class);
    
    private RuntimeContext rtc;
    
    public UC_1_Patienten_Erfassen (RuntimeContext _rtc
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
        
        
        
        
        new NeuenPatientenErfassen(
                rtc
            ).execute(
                FAMILYNAME
                ,
                BIRTHDAY
                ,
                GIVENNAME
                ,
                SEX
            );
        
        
        
        
    }
}