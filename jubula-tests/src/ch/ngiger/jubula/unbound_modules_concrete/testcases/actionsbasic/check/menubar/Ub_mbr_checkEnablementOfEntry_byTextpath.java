package ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.check.menubar;

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

import ch.ngiger.jubula.unbound_modules_concrete.CTDS;


@SrcNode(UUID = "8ab6b083150339b501150364b0070969",
         type = NodeType.TEST_CASE)
public class Ub_mbr_checkEnablementOfEntry_byTextpath {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_mbr_checkEnablementOfEntry_byTextpath.class);
    
    private RuntimeContext rtc;
    
    public Ub_mbr_checkEnablementOfEntry_byTextpath (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String TEXTPATH,
        String OPERATOR,
        Boolean ENABLED
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.swt.SwtComponents.createMenu()
                .checkEnablementOfEntryByTextpath(
                    TEXTPATH
                    ,
                    Operator.literalAsEnum(OPERATOR)
                    ,
                    ENABLED
                    ),
            null);
            
        
        
        
    }
}