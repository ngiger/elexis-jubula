package ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.keycombination;

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

import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.keycombination.Ub_app_pressAnyKey;

@SrcNode(UUID = "8ab6b083150339b501150364afe807c2",
         type = NodeType.TEST_CASE)
public class Ub_app_pressAnyKeyCombination_CTRL_SHIFT {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_app_pressAnyKeyCombination_CTRL_SHIFT.class);
    
    private RuntimeContext rtc;
    
    public Ub_app_pressAnyKeyCombination_CTRL_SHIFT (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String BASE_KEY
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        new Ub_app_pressAnyKey(
                rtc
            ).execute(
                "control shift"
                ,
                BASE_KEY
            );
        
        
        
        
    }
}