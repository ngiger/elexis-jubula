package ch.ngiger.elexis.jubula.elexiscore.testsuites.testsuites;

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


@SrcNode(UUID = "aef684f301174fb28caf0731a74af9fe",
         type = NodeType.TEST_SUITE)
public class FULLTEST {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(FULLTEST.class);
    
    private RuntimeContext rtc;
    
    public FULLTEST (AUT _aut) {
        rtc = new RuntimeContext(_aut, true, false, false, true);
    }
    
    public void execute(
    ) {
        
        
        
        
        new ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.FULLTEST(
                rtc
            ).execute(
            );
        
        
        
    }
}