package ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.executeexternalcommand;

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


@SrcNode(UUID = "8ab6b08316c3bbe20116c3bec817000c",
         type = NodeType.TEST_CASE)
public class Ub_app_executeExternalCommand {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_app_executeExternalCommand.class);
    
    private RuntimeContext rtc;
    
    public Ub_app_executeExternalCommand (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String COMMAND,
        Integer EXPECTED_EXIT_CODE,
        Boolean LOCAL,
        Integer TIMEOUT_IN_MILLISECS
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        
        // TODO: Usage of unsupported client / ITE-side action CompSystem.ExecuteCommand.

        
        
        
    }
}