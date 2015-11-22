package ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.settogglekey;

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

import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.settogglekey.Ub_app_setToggleKey;

@SrcNode(UUID = "8ab6b083150339b501150364afe807a4",
         type = NodeType.TEST_CASE)
public class Ub_app_setToggleKey_SCROLLLOCK {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_app_setToggleKey_SCROLLLOCK.class);
    
    private RuntimeContext rtc;
    
    public Ub_app_setToggleKey_SCROLLLOCK (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        Boolean ACTIVATE_KEY
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        new Ub_app_setToggleKey(
                rtc
            ).execute(
                3
                ,
                ACTIVATE_KEY
            );
        
        
        
        
    }
}