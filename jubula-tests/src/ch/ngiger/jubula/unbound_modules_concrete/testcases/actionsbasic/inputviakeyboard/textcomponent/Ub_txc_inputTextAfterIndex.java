package ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.textcomponent;

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


@SrcNode(UUID = "8ab6b083150339b501150364b0070a44",
         type = NodeType.TEST_CASE)
public class Ub_txc_inputTextAfterIndex {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_txc_inputTextAfterIndex.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_txc;
    
    
    public Ub_txc_inputTextAfterIndex (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_txc
    ) {
        rtc = _rtc;
        
        nn_nn_txc = _nn_nn_txc;
    }
    
    public void execute(
        String TEXT,
        Integer INDEX
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.concrete.ConcreteComponents.createTextInputComponent(nn_nn_txc)
                .insertTextAfterIndex(
                    TEXT
                    ,
                    INDEX
                    ),
            null);
            
        
        
        
    }
}