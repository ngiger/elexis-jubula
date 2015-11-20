package ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.check.tree;

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


@SrcNode(UUID = "8ab6b083150339b501150364b0170ac0",
         type = NodeType.TEST_CASE)
public class Ub_tre_checkExistenceOfNode_byIndexpath {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_tre_checkExistenceOfNode_byIndexpath.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_tre;
    
    
    public Ub_tre_checkExistenceOfNode_byIndexpath (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_tre
    ) {
        rtc = _rtc;
        
        nn_nn_tre = _nn_nn_tre;
    }
    
    public void execute(
        String PATH_TYPE,
        Integer PRE_ASCEND,
        String INDEXPATH,
        Boolean EXISTS
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.concrete.ConcreteComponents.createTreeComponent(nn_nn_tre)
                .checkExistenceOfNodeByIndexpath(
                    SearchType.valueOf(PATH_TYPE)
                    ,
                    PRE_ASCEND
                    ,
                    INDEXPATH
                    ,
                    EXISTS
                    ),
            null);
            
        
        
        
    }
}