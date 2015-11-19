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

import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.sw_installation.Install_all_local_SW;

@SrcNode(UUID = "97c74218fcc24a678a300bd0e98561b3",
         type = NodeType.TEST_SUITE)
public class INSTALL_ALL_LOCAL_SW {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(INSTALL_ALL_LOCAL_SW.class);
    
    private RuntimeContext rtc;
    
    public INSTALL_ALL_LOCAL_SW (AUT _aut) {
        rtc = new RuntimeContext(_aut, true, false, false, true);
    }
    
    public void execute(
    ) {
        
        
        
        
        new Install_all_local_SW(
                rtc
            ).execute(
            );
        
        
        
    }
}