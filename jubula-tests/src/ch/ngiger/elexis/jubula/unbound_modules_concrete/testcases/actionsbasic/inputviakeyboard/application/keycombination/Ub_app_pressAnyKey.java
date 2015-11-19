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


@SrcNode(UUID = "8ab6b083181d393b01181d8e6c380062",
         type = NodeType.TEST_CASE)
public class Ub_app_pressAnyKey {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_app_pressAnyKey.class);
    
    private RuntimeContext rtc;
    
    public Ub_app_pressAnyKey (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String MODIFIER_KEYS,
        String BASE_KEY
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.swt.SwtComponents.createApplication()
                .keyCombination(
                    Modifier.literalAsEnum(MODIFIER_KEYS)
                    ,
                    BASE_KEY
                    ),
            null);
            
        
        
        
    }
}