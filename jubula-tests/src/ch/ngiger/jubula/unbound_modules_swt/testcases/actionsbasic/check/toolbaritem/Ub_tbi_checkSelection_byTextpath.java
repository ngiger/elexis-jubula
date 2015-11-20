package ch.ngiger.jubula.unbound_modules_swt.testcases.actionsbasic.check.toolbaritem;

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


@SrcNode(UUID = "8ab6b083187446040118744d3a420004",
         type = NodeType.TEST_CASE)
public class Ub_tbi_checkSelection_byTextpath {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_tbi_checkSelection_byTextpath.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_tbi;
    
    
    public Ub_tbi_checkSelection_byTextpath (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_tbi
    ) {
        rtc = _rtc;
        
        nn_nn_tbi = _nn_nn_tbi;
    }
    
    public void execute(
        String TEXTPATH,
        String OPERATOR,
        Boolean SELECTED
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.swt.SwtComponents.createToolItem(nn_nn_tbi)
                .checkSelectionOfEntryByTextpath(
                    TEXTPATH
                    ,
                    Operator.literalAsEnum(OPERATOR)
                    ,
                    SELECTED
                    ),
            null);
            
        
        
        
    }
}