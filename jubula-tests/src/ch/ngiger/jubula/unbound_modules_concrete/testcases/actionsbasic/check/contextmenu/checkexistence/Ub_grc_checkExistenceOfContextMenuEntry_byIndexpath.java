package ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.check.contextmenu.checkexistence;

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


@SrcNode(UUID = "8ab6b0832433fd9701243436ac42003b",
         type = NodeType.TEST_CASE)
public class Ub_grc_checkExistenceOfContextMenuEntry_byIndexpath {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_grc_checkExistenceOfContextMenuEntry_byIndexpath.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_grc;
    
    
    public Ub_grc_checkExistenceOfContextMenuEntry_byIndexpath (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_grc
    ) {
        rtc = _rtc;
        
        nn_nn_grc = _nn_nn_grc;
    }
    
    public void execute(
        String INDEXPATH,
        Boolean EXISTS,
        Integer MOUSE_BUTTON
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.base.AbstractComponents.createGraphicsComponent(nn_nn_grc)
                .checkExistenceOfContextMenuEntryByIndexpath(
                    INDEXPATH
                    ,
                    EXISTS
                    ,
                    InteractionMode.valueOf(MOUSE_BUTTON)
                    ),
            null);
            
        
        
        
    }
}