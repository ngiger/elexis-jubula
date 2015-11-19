package ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application;

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

import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.Ub_app_externalPressAnyKey;

@SrcNode(UUID = "8ab6b08316479de8011647a1807e000c",
         type = NodeType.TEST_CASE)
public class Ub_app_externalPressAnyKey_noModifier {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_app_externalPressAnyKey_noModifier.class);
    
    private RuntimeContext rtc;
    
    public Ub_app_externalPressAnyKey_noModifier (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String BASE_KEY
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        new Ub_app_externalPressAnyKey(
                rtc
            ).execute(
                "none"
                ,
                BASE_KEY
            );
        
        
        
        
    }
}