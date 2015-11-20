package ch.ngiger.jubula.unbound_modules_swt.testcases.actionsbasic.select.swttree;

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


@SrcNode(UUID = "8ab6b0832253d796012254cc9de4000e",
         type = NodeType.TEST_CASE)
public class Ub_str_toggleCheckboxOnNode_byTextpath {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_str_toggleCheckboxOnNode_byTextpath.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_str;
    
    
    public Ub_str_toggleCheckboxOnNode_byTextpath (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_str
    ) {
        rtc = _rtc;
        
        nn_nn_str = _nn_nn_str;
    }
    
    public void execute(
        String PATH_TYPE,
        Integer PRE_ASCEND,
        String TEXTPATH,
        String OPERATOR
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.swt.SwtComponents.createTree(nn_nn_str)
                .toggleCheckboxOnNodeByTextpath(
                    SearchType.valueOf(PATH_TYPE)
                    ,
                    PRE_ASCEND
                    ,
                    TEXTPATH
                    ,
                    Operator.literalAsEnum(OPERATOR)
                    ),
            null);
            
        
        
        
    }
}