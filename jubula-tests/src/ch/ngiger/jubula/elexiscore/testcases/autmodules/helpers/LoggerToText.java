package ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers;

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

import ch.ngiger.jubula.elexiscore.CTDS;

import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.executeexternalcommand.Ub_app_executeExternalCommand;

@SrcNode(UUID = "03f3b8928caa44cdba638a72c4c5ced4",
         type = NodeType.TEST_CASE)
public class LoggerToText {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(LoggerToText.class);
    
    private RuntimeContext rtc;
    
    public LoggerToText (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String TEXT_TO_LOG
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        new Ub_app_executeExternalCommand(
                rtc
            ).execute(
                "logger jubula " + TEXT_TO_LOG + ""
                ,
                0
                ,
                true
                ,
                1000
            );
        
        
        
        
    }
}