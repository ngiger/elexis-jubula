package ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.check.contextmenu.checkenablement;

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


@SrcNode(UUID = "8ab6b0832433fd970124342f2035002c",
         type = NodeType.TEST_CASE)
public class Ub_grc_checkEnablementOfContextMenuEntryWithPositionSpec_byTextpath {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_grc_checkEnablementOfContextMenuEntryWithPositionSpec_byTextpath.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_grc;
    
    
    public Ub_grc_checkEnablementOfContextMenuEntryWithPositionSpec_byTextpath (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_grc
    ) {
        rtc = _rtc;
        
        nn_nn_grc = _nn_nn_grc;
    }
    
    public void execute(
        Integer X_POSITION,
        String X_UNITS,
        Integer Y_POSITION,
        String Y_UNITS,
        String TEXTPATH,
        String OPERATOR,
        Boolean ENABLED,
        Integer MOUSE_BUTTON
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.base.AbstractComponents.createGraphicsComponent(nn_nn_grc)
                .checkEnablementOfContextMenuEntryByTextpathSpecifyPosition(
                    X_POSITION
                    ,
                    Unit.valueOf(X_UNITS)
                    ,
                    Y_POSITION
                    ,
                    Unit.valueOf(Y_UNITS)
                    ,
                    TEXTPATH
                    ,
                    Operator.literalAsEnum(OPERATOR)
                    ,
                    ENABLED
                    ,
                    InteractionMode.valueOf(MOUSE_BUTTON)
                    ),
            null);
            
        
        
        
    }
}