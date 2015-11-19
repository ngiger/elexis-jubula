package ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindow;

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


@SrcNode(UUID = "8ab6b083181d393b01181d98e42f007e",
         type = NodeType.TEST_CASE)
public class Ub_app_waitForWindow {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_app_waitForWindow.class);
    
    private RuntimeContext rtc;
    
    public Ub_app_waitForWindow (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String TITLE,
        String OPERATOR,
        Integer TIMEOUT_IN_MILLISECS,
        Integer DELAY_AFTER_VISIBILITY
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.swt.SwtComponents.createApplication()
                .waitForWindow(
                    TITLE
                    ,
                    Operator.literalAsEnum(OPERATOR)
                    ,
                    TIMEOUT_IN_MILLISECS
                    ,
                    DELAY_AFTER_VISIBILITY
                    ),
            null);
            
        
        
        
    }
}