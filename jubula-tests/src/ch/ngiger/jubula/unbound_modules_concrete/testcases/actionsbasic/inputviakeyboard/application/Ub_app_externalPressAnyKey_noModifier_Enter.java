package ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application;

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

import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.Ub_app_externalPressAnyKey_noModifier;

@SrcNode(UUID = "8ab6b08316a0e0910116a0e2b9f70001",
         type = NodeType.TEST_CASE)
public class Ub_app_externalPressAnyKey_noModifier_Enter {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_app_externalPressAnyKey_noModifier_Enter.class);
    
    private RuntimeContext rtc;
    
    public Ub_app_externalPressAnyKey_noModifier_Enter (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        new Ub_app_externalPressAnyKey_noModifier(
                rtc
            ).execute(
                "ENTER"
            );
        
        
        
        
    }
}