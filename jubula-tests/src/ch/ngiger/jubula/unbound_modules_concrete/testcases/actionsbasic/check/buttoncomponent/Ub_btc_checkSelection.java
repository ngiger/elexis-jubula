package ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.check.buttoncomponent;

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


@SrcNode(UUID = "8ab6b083181d393b01181d9f15a40095",
         type = NodeType.TEST_CASE)
public class Ub_btc_checkSelection {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_btc_checkSelection.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_btc;
    
    
    public Ub_btc_checkSelection (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_btc
    ) {
        rtc = _rtc;
        
        nn_nn_btc = _nn_nn_btc;
    }
    
    public void execute(
        Boolean SELECTED
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.base.AbstractComponents.createButtonComponent(nn_nn_btc)
                .checkSelection(
                    SELECTED
                    ),
            null);
            
        
        
        
    }
}