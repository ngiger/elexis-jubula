package ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.check.componentwithtext;

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


@SrcNode(UUID = "8ab6b083181d393b01181da5bf8e00a9",
         type = NodeType.TEST_CASE)
public class Ub_ctx_checkText {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_ctx_checkText.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_ctx;
    
    
    public Ub_ctx_checkText (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_ctx
    ) {
        rtc = _rtc;
        
        nn_nn_ctx = _nn_nn_ctx;
    }
    
    public void execute(
        String TEXT,
        String OPERATOR
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.base.AbstractComponents.createTextComponent(nn_nn_ctx)
                .checkText(
                    TEXT
                    ,
                    Operator.literalAsEnum(OPERATOR)
                    ),
            null);
            
        
        
        
    }
}