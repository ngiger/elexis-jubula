package ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.check.tabbedcomponent;

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


@SrcNode(UUID = "8ab6b083150339b501150364b00709a2",
         type = NodeType.TEST_CASE)
public class Ub_tbc_checkEnablementOfTab_byValue {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_tbc_checkEnablementOfTab_byValue.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_tbc;
    
    
    public Ub_tbc_checkEnablementOfTab_byValue (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_tbc
    ) {
        rtc = _rtc;
        
        nn_nn_tbc = _nn_nn_tbc;
    }
    
    public void execute(
        String TITLE,
        String OPERATOR,
        Boolean ENABLED
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.concrete.ConcreteComponents.createTabComponent(nn_nn_tbc)
                .checkEnablementOfTabByValue(
                    TITLE
                    ,
                    Operator.literalAsEnum(OPERATOR)
                    ,
                    ENABLED
                    ),
            null);
            
        
        
        
    }
}