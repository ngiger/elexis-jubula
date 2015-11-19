package ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers;

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

import ch.ngiger.elexis.jubula.elexiscore.CTDS;

import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.OpenViewByName;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.click.Ub_grc_clickLeft_single;

@SrcNode(UUID = "7b9f4bb48bba4bd1b781ee8f0ff0135e",
         type = NodeType.TEST_CASE)
public class ActivateViewAndClick {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(ActivateViewAndClick.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_grc;
    
    
    public ActivateViewAndClick (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_grc
    ) {
        rtc = _rtc;
        
        nn_nn_grc = _nn_nn_grc;
    }
    
    public void execute(
        String TEXTPATH,
        String SCREENSHOT
    ) {
        AUT aut = rtc.getAUT();
        
        
        rtc.beginIgnoreCompNotFound();
        
        try {
        
        
        new OpenViewByName(
                rtc
            ).execute(
                TEXTPATH
            );
        
        new Ub_grc_clickLeft_single(
                rtc,
                nn_nn_grc
            ).execute(
            );
        
        
        
        }
        
        
        finally {
          rtc.endLocalEventHandling(false, false, true, false);
        }
    }
}