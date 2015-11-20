package ch.ngiger.jubula.unbound_modules_rcp.testcases.actionsbasic.check.figurecanvas;

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

import ch.ngiger.jubula.unbound_modules_rcp.CTDS;


@SrcNode(UUID = "97d98d27874a4b78b0dcfda580277df2",
         type = NodeType.TEST_CASE)
public class Ub_fcv_checkExistenceOfConnection_byTextpaths {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_fcv_checkExistenceOfConnection_byTextpaths.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_fcv;
    
    
    public Ub_fcv_checkExistenceOfConnection_byTextpaths (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_fcv
    ) {
        rtc = _rtc;
        
        nn_nn_fcv = _nn_nn_fcv;
    }
    
    public void execute(
        String SOURCE_TEXT_PATH,
        String SOURCE_OPERATOR,
        String TARGET_TEXT_PATH,
        String TARGET_OPERATOR,
        Boolean EXISTS
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.gef.GefComponents.createFigureCanvas(nn_nn_fcv)
                .checkConnectionExistence(
                    SOURCE_TEXT_PATH
                    ,
                    Operator.literalAsEnum(SOURCE_OPERATOR)
                    ,
                    TARGET_TEXT_PATH
                    ,
                    Operator.literalAsEnum(TARGET_OPERATOR)
                    ,
                    EXISTS
                    ),
            null);
            
        
        
        
    }
}