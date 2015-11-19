package ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.check.list;

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


@SrcNode(UUID = "2ac4637b0606417f8218f646bb2cb92d",
         type = NodeType.TEST_CASE)
public class Ub_lst_checkPropertyAtMousePosition {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_lst_checkPropertyAtMousePosition.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_lst;
    
    
    public Ub_lst_checkPropertyAtMousePosition (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_lst
    ) {
        rtc = _rtc;
        
        nn_nn_lst = _nn_nn_lst;
    }
    
    public void execute(
        String PROPERTY_NAME,
        String PROPERTY_VALUE,
        String OPERATOR
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.concrete.ConcreteComponents.createListComponent(nn_nn_lst)
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