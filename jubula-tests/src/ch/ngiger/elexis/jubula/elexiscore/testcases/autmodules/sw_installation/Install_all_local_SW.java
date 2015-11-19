package ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.sw_installation;

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

import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.sw_installation.Open_SW_Install_Window;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.sw_installation.UseLocalRepository;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.sw_installation.SW_select_all_SW_from_all_sites;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.sw_installation.SW_check_sw_upgrade_necessary;

@SrcNode(UUID = "8475bcf04f544076b991323864c7f573",
         type = NodeType.TEST_CASE)
public class Install_all_local_SW {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Install_all_local_SW.class);
    
    private RuntimeContext rtc;
    
    public Install_all_local_SW (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Open SW Install Windows
        new Open_SW_Install_Window(
                rtc
            ).execute(
            );
        
        for (CTDS.FILE_REPOSITORIES row : CTDS.FILE_REPOSITORIES.data) {
            // Use local repositories
            new UseLocalRepository(
                rtc
            ).execute(
                row.NAME,
                row.P2_URL
                );
        }
        
        // Select all SW from all sites
        new SW_select_all_SW_from_all_sites(
                rtc
            ).execute(
            );
        // Comment: Has retry handler if now SW_UPGRADE_MUST be done
        
        // SW-Install: Execute and finish
        new SW_check_sw_upgrade_necessary(
                rtc
            ).execute(
            );
        
        
        
        
    }
}