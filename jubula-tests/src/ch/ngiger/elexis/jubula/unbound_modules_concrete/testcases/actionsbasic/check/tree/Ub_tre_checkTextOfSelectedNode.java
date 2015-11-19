package ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.check.tree;

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


@SrcNode(UUID = "8ab6b083150339b501150364b0170ab3",
         type = NodeType.TEST_CASE)
public class Ub_tre_checkTextOfSelectedNode {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_tre_checkTextOfSelectedNode.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_tre;
    
    
    public Ub_tre_checkTextOfSelectedNode (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_tre
    ) {
        rtc = _rtc;
        
        nn_nn_tre = _nn_nn_tre;
    }
    
    public void execute(
        String TEXT,
        String OPERATOR
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.concrete.ConcreteComponents.createTreeComponent(nn_nn_tre)
                .checkTextOfSelectedNodeS(
                    TEXT
                    ,
                    Operator.literalAsEnum(OPERATOR)
                    ),
            null);
            
        
        
        
    }
}