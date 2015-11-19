package ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.check.combocomponent;

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


@SrcNode(UUID = "8ab6b0831aa12a60011aa138d9560001",
         type = NodeType.TEST_CASE)
public class Ub_cbc_checkExistenceOfEntry_byValue {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_cbc_checkExistenceOfEntry_byValue.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_cbc;
    
    
    public Ub_cbc_checkExistenceOfEntry_byValue (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_cbc
    ) {
        rtc = _rtc;
        
        nn_nn_cbc = _nn_nn_cbc;
    }
    
    public void execute(
        String TEXT,
        String OPERATOR,
        Boolean EXISTS
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.concrete.ConcreteComponents.createComboComponent(nn_nn_cbc)
                .checkExistenceOfEntryByValue(
                    TEXT
                    ,
                    Operator.literalAsEnum(OPERATOR)
                    ,
                    EXISTS
                    ),
            null);
            
        
        
        
    }
}