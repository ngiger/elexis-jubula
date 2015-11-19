package ch.ngiger.elexis.jubula.elexiscore.testcases.work_ng;

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

import ch.ngiger.elexis.jubula.elexiscore.CTDS;

import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.executeexternalcommand.Ub_app_executeExternalCommand;

@SrcNode(UUID = "ec512e2c9ec74527831d84edd76db11a",
         type = NodeType.TEST_CASE)
public class PrintEnvironmentToFile {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(PrintEnvironmentToFile.class);
    
    private RuntimeContext rtc;
    
    public PrintEnvironmentToFile (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Print env
        new Ub_app_executeExternalCommand(
                rtc
            ).execute(
                "/bin/sh -c \"env | tee  \\" + VariableStore.getInstance().getValue("HOME") + "/jubula_sample.log\""
                ,
                0
                ,
                true
                ,
                100
            );
        
        
        
        
    }
}