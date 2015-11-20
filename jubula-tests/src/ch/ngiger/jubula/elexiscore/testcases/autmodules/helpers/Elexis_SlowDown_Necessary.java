package ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers;

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

import ch.ngiger.jubula.elexiscore.CTDS;

import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.Ub_app_wait;

@SrcNode(UUID = "2cc82a65d808499fb219408a83968851",
         type = NodeType.TEST_CASE)
public class Elexis_SlowDown_Necessary {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Elexis_SlowDown_Necessary.class);
    
    private RuntimeContext rtc;
    
    public Elexis_SlowDown_Necessary (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        // Comment: This should not be necessary, but is a good marker
        
        // Slow down Elexis a little bit
        new Ub_app_wait(
                rtc
            ).execute(
                500
            );
        
        
        
        
    }
}