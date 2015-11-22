package ch.ngiger.jubula.unbound_modules_swt.testcases.actionsbasic.check.treetable;

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

import ch.ngiger.jubula.unbound_modules_swt.CTDS;


@SrcNode(UUID = "8ab6b083181d393b01181d81f5a50031",
         type = NodeType.TEST_CASE)
public class Ub_trt_checkSelectionByValueS_specifyColumn {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_trt_checkSelectionByValueS_specifyColumn.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_trt;
    
    
    public Ub_trt_checkSelectionByValueS_specifyColumn (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_trt
    ) {
        rtc = _rtc;
        
        nn_nn_trt = _nn_nn_trt;
    }
    
    public void execute(
        String TEXT,
        String OPERATOR,
        Integer COLUMN
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.swt.SwtComponents.createTreeTable(nn_nn_trt)
                .checkSelectionByValueSSpecifyColumn(
                    TEXT
                    ,
                    Operator.literalAsEnum(OPERATOR)
                    ,
                    COLUMN
                    ),
            null);
            
        
        
        
    }
}