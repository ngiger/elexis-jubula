package ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.menubar;

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


@SrcNode(UUID = "8ab6b08d294519bd0129461469a20e7c",
         type = NodeType.TEST_CASE)
public class Ub_mbr_waitForMenuBar {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_mbr_waitForMenuBar.class);
    
    private RuntimeContext rtc;
    
    public Ub_mbr_waitForMenuBar (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        Integer TIMEOUT_IN_MILLISECS,
        Integer DELAY_AFTER_VISIBILITY
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.swt.SwtComponents.createMenu()
                .waitForComponent(
                    TIMEOUT_IN_MILLISECS
                    ,
                    DELAY_AFTER_VISIBILITY
                    ),
            null);
            
        
        
        
    }
}