package ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.check.application;

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


@SrcNode(UUID = "8ab6b08d2a7fc0e1012a7fc1ff79000f",
         type = NodeType.TEST_CASE)
public class Ub_app_checkExistenceOfWindow {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_app_checkExistenceOfWindow.class);
    
    private RuntimeContext rtc;
    
    public Ub_app_checkExistenceOfWindow (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String TITLE,
        String OPERATOR,
        Boolean EXISTS
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.swt.SwtComponents.createApplication()
                .checkExistenceOfWindow(
                    TITLE
                    ,
                    Operator.literalAsEnum(OPERATOR)
                    ,
                    EXISTS
                    ),
            null);
            
        
        
        
    }
}