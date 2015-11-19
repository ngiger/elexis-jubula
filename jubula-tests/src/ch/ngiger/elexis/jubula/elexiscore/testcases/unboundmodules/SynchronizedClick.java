package ch.ngiger.elexis.jubula.elexiscore.testcases.unboundmodules;

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

import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.Ub_grc_waitForComponent;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.check.Ub_grc_checkEnablement;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.click.Ub_grc_clickLeft_single;

@SrcNode(UUID = "f7239477bfd84662ac2fe91e83b03826",
         type = NodeType.TEST_CASE)
public class SynchronizedClick {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SynchronizedClick.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_grc;
    
    
    public SynchronizedClick (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_grc
    ) {
        rtc = _rtc;
        
        nn_nn_grc = _nn_nn_grc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        rtc.beginIgnoreCompNotFound();
        
        try {
        
        
        // Wait for component
        new Ub_grc_waitForComponent(
                rtc,
                nn_nn_grc
            ).execute(
                100
                ,
                0
            );
        
        // Check enabled
        new Ub_grc_checkEnablement(
                rtc,
                nn_nn_grc
            ).execute(
                true
            );
        
        // Click once (left)
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