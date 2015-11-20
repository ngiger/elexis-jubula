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


@SrcNode(UUID = "2f7a9140ade24edea42d51cdbe546cf5",
         type = NodeType.TEST_CASE)
public class Ub_fcv_checkAnchorCountOfEditPart_byTextpath {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_fcv_checkAnchorCountOfEditPart_byTextpath.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_fcv;
    
    
    public Ub_fcv_checkAnchorCountOfEditPart_byTextpath (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_fcv
    ) {
        rtc = _rtc;
        
        nn_nn_fcv = _nn_nn_fcv;
    }
    
    public void execute(
        String TEXTPATH,
        String TEXT_OPERATOR,
        String ANCHOR_TYPE,
        Integer NUMBER_OF_ANCHORS,
        String COMPARISON_METHOD
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.gef.GefComponents.createFigureCanvas(nn_nn_fcv)
                .checkAnchorCount(
                    TEXTPATH
                    ,
                    Operator.literalAsEnum(TEXT_OPERATOR)
                    ,
                    AnchorType.valueOf(ANCHOR_TYPE)
                    ,
                    NUMBER_OF_ANCHORS
                    ,
                    NumberComparisonOperator.valueOf(COMPARISON_METHOD)
                    ),
            null);
            
        
        
        
    }
}