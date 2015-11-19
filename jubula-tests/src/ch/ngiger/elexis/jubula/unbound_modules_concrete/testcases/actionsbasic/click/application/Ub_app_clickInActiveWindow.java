package ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.click.application;

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


@SrcNode(UUID = "8ab6b083150339b501150364afe807aa",
         type = NodeType.TEST_CASE)
public class Ub_app_clickInActiveWindow {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_app_clickInActiveWindow.class);
    
    private RuntimeContext rtc;
    
    public Ub_app_clickInActiveWindow (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        Integer NUMBER_OF_CLICKS,
        Integer MOUSE_BUTTON,
        Integer X_POSITION,
        String X_UNITS,
        Integer Y_POSITION,
        String Y_UNITS
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.swt.SwtComponents.createApplication()
                .clickInActiveWindow(
                    NUMBER_OF_CLICKS
                    ,
                    InteractionMode.valueOf(MOUSE_BUTTON)
                    ,
                    X_POSITION
                    ,
                    Unit.valueOf(X_UNITS)
                    ,
                    Y_POSITION
                    ,
                    Unit.valueOf(Y_UNITS)
                    ),
            null);
            
        
        
        
    }
}