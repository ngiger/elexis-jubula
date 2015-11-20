package ch.ngiger.jubula.elexiscore.testsuites.testsuites;

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


@SrcNode(UUID = "2da5d8163cb745eeace667dad6202fc4",
         type = NodeType.TEST_SUITE)
public class FULLTEST_BROKEN {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(FULLTEST_BROKEN.class);
    
    private RuntimeContext rtc;
    
    public FULLTEST_BROKEN (AUT _aut) {
        rtc = new RuntimeContext(_aut, true, false, false, true);
    }
    
    public void execute(
    ) {
        
        
        
        
        new ch.ngiger.jubula.elexiscore.testcases.autmodules.FULLTEST_BROKEN(
                rtc
            ).execute(
            );
        
        
        
    }
}