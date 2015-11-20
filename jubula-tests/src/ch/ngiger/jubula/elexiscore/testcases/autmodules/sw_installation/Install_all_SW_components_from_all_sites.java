package ch.ngiger.jubula.elexiscore.testcases.autmodules.sw_installation;

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

import ch.ngiger.jubula.elexiscore.testcases.autmodules.sw_installation.Open_SW_Install_Window;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.sw_installation.SW_select_all_SW_from_all_sites;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.sw_installation.SW_check_sw_upgrade_necessary;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.sw_installation.Finish_SW_Installation;

@SrcNode(UUID = "5a60331e3934472ea43be57ee246fa1f",
         type = NodeType.TEST_CASE)
public class Install_all_SW_components_from_all_sites {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Install_all_SW_components_from_all_sites.class);
    
    private RuntimeContext rtc;
    
    public Install_all_SW_components_from_all_sites (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Open SW Install Window
        new Open_SW_Install_Window(
                rtc
            ).execute(
            );
        
        // Select all SW from all sites
        new SW_select_all_SW_from_all_sites(
                rtc
            ).execute(
            );
        // Comment: We pass it KG Iatrix to not be fouled by already installed based products
        
        // SW_check_sw_upgrade_nessarry
        new SW_check_sw_upgrade_necessary(
                rtc
            ).execute(
            );
        //// Comment: We assume to be inside the SW-Update dialog
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Finish SW Installation
        //new Finish_SW_Installation(
                //rtc
            //).execute(
            //);
        
        
        
        
    }
}