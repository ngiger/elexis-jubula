package ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.activateapplication;

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

import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.activateapplication.Ub_app_activate;

@SrcNode(UUID = "8ab6b083150339b501150364afe8079a",
         type = NodeType.TEST_CASE)
public class Ub_app_activate_AUTDefault {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_app_activate_AUTDefault.class);
    
    private RuntimeContext rtc;
    
    public Ub_app_activate_AUTDefault (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        new Ub_app_activate(
                rtc
            ).execute(
                "AUT_DEFAULT"
            );
        
        
        
        
    }
}