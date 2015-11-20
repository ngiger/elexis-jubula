package ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.check.table;

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


@SrcNode(UUID = "0d8d94d6b7b545bdbd5d92e850bae3da",
         type = NodeType.TEST_CASE)
public class Ub_tbl_checkPropertyAtMousePosition {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_tbl_checkPropertyAtMousePosition.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_tbl;
    
    
    public Ub_tbl_checkPropertyAtMousePosition (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_tbl
    ) {
        rtc = _rtc;
        
        nn_nn_tbl = _nn_nn_tbl;
    }
    
    public void execute(
        String PROPERTY_NAME,
        String PROPERTY_VALUE,
        String OPERATOR
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.concrete.ConcreteComponents.createTableComponent(nn_nn_tbl)
                .checkPropertyAtMousePosition(
                    PROPERTY_NAME
                    ,
                    PROPERTY_VALUE
                    ,
                    Operator.literalAsEnum(OPERATOR)
                    ),
            null);
            
        
        
        
    }
}