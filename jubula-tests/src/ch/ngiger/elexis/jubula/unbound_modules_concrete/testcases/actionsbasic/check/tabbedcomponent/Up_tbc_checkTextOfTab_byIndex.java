package ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.check.tabbedcomponent;

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

import ch.ngiger.elexis.jubula.unbound_modules_concrete.CTDS;


@SrcNode(UUID = "8ab6b083242efdf601242f3d5b560011",
         type = NodeType.TEST_CASE)
public class Up_tbc_checkTextOfTab_byIndex {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Up_tbc_checkTextOfTab_byIndex.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_tbc;
    
    
    public Up_tbc_checkTextOfTab_byIndex (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_tbc
    ) {
        rtc = _rtc;
        
        nn_nn_tbc = _nn_nn_tbc;
    }
    
    public void execute(
        Integer INDEX,
        String TITLE,
        String OPERATOR
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.concrete.ConcreteComponents.createTabComponent(nn_nn_tbc)
                .checkTextOfTabByIndex(
                    INDEX
                    ,
                    TITLE
                    ,
                    Operator.literalAsEnum(OPERATOR)
                    ),
            null);
            
        
        
        
    }
}