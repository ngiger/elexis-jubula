package ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.settogglekey;

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


@SrcNode(UUID = "8ab6b083181d393b01181d95c591006c",
         type = NodeType.TEST_CASE)
public class Ub_app_setToggleKey {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_app_setToggleKey.class);
    
    private RuntimeContext rtc;
    
    public Ub_app_setToggleKey (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        Integer KEY,
        Boolean ACTIVATE_KEY
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.swt.SwtComponents.createApplication()
                .setToggleKey(
                    KEY
                    ,
                    ACTIVATE_KEY
                    ),
            null);
            
        
        
        
    }
}