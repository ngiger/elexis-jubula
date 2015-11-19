package ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.check.componentwithtextinput;

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


@SrcNode(UUID = "8ab6b083150339b501150364aff708c4",
         type = NodeType.TEST_CASE)
public class Ub_cti_checkEditability {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_cti_checkEditability.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_cti;
    
    
    public Ub_cti_checkEditability (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_cti
    ) {
        rtc = _rtc;
        
        nn_nn_cti = _nn_nn_cti;
    }
    
    public void execute(
        Boolean EDITABLE
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.base.AbstractComponents.createTextInputComponent(nn_nn_cti)
                .checkEditability(
                    EDITABLE
                    ),
            null);
            
        
        
        
    }
}