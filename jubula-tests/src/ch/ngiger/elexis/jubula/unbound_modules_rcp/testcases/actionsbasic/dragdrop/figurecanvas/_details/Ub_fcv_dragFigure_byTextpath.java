package ch.ngiger.elexis.jubula.unbound_modules_rcp.testcases.actionsbasic.dragdrop.figurecanvas._details;

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

import ch.ngiger.elexis.jubula.unbound_modules_rcp.CTDS;


@SrcNode(UUID = "8ab6b0832254bb19012254f2cf1b000b",
         type = NodeType.TEST_CASE)
public class Ub_fcv_dragFigure_byTextpath {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_fcv_dragFigure_byTextpath.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_fcv;
    
    
    public Ub_fcv_dragFigure_byTextpath (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_fcv
    ) {
        rtc = _rtc;
        
        nn_nn_fcv = _nn_nn_fcv;
    }
    
    public void execute(
        String TEXTPATH,
        String OPERATOR,
        Integer MOUSE_BUTTON,
        String MODIFIER_KEYS,
        Integer X_POSITION,
        String X_UNITS,
        Integer Y_POSITION,
        String Y_UNITS
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.gef.GefComponents.createFigureCanvas(nn_nn_fcv)
                .dragFigure(
                    TEXTPATH
                    ,
                    Operator.literalAsEnum(OPERATOR)
                    ,
                    InteractionMode.valueOf(MOUSE_BUTTON)
                    ,
                    Modifier.literalAsEnum(MODIFIER_KEYS)
                    ,
                    X_POSITION
                    ,
                    Unit.valueOf(X_UNITS)
                    ,
                    Y_POSITION
                    ,
                    Unit.valueOf(Y_UNITS)
                    ),
            null);
            
        
        
        
    }
}