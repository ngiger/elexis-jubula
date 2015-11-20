package ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.click;

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


@SrcNode(UUID = "8ab6b083181d393b01181daa881700b3",
         type = NodeType.TEST_CASE)
public class Ub_grc_click {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_grc_click.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_grc;
    
    
    public Ub_grc_click (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_grc
    ) {
        rtc = _rtc;
        
        nn_nn_grc = _nn_nn_grc;
    }
    
    public void execute(
        Integer NUMBER_OF_CLICKS,
        Integer MOUSE_BUTTON
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.base.AbstractComponents.createGraphicsComponent(nn_nn_grc)
                .click(
                    NUMBER_OF_CLICKS
                    ,
                    InteractionMode.valueOf(MOUSE_BUTTON)
                    ),
            null);
            
        
        
        
    }
}