package ch.ngiger.elexis.jubula.unbound_modules_swt.testcases.actionsbasic.check.treetable;

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

import ch.ngiger.elexis.jubula.unbound_modules_swt.CTDS;


@SrcNode(UUID = "dc9f52f8377848d294ac383ae5d44eb6",
         type = NodeType.TEST_CASE)
public class Ub_trt_checkPropertyAtMousePosition {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_trt_checkPropertyAtMousePosition.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_trt;
    
    
    public Ub_trt_checkPropertyAtMousePosition (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_trt
    ) {
        rtc = _rtc;
        
        nn_nn_trt = _nn_nn_trt;
    }
    
    public void execute(
        String PROPERTY_NAME,
        String PROPERTY_VALUE,
        String OPERATOR
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.swt.SwtComponents.createTreeTable(nn_nn_trt)
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