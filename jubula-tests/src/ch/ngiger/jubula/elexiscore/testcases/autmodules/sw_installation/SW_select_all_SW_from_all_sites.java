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

import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.select.combocomponent.Ub_cbc_selectEntry_byValue;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.Ub_app_wait;
import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.SynchronizedClick;

@SrcNode(UUID = "95ac84524a614a9c804ee2ec535fff87",
         type = NodeType.TEST_CASE)
public class SW_select_all_SW_from_all_sites {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SW_select_all_SW_from_all_sites.class);
    
    private RuntimeContext rtc;
    
    public SW_select_all_SW_from_all_sites (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Select all SW-sites
        new Ub_cbc_selectEntry_byValue(
                rtc,
                rtc.getIdentifier("SW_update_select_site_combo")
            ).execute(
                ".*All Available Sites.*"
                ,
                "matches"
                ,
                "absolute"
            );
        // Comment: Three seconds were not enough when running from the command line
        
        // Wait 10 seconds
        new Ub_app_wait(
                rtc
            ).execute(
                10000
            );
        
        // Select all SW components
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("SW_Install_SelectAll_btn")
            ).execute(
            );
        
        // wait 1 seconds
        new Ub_app_wait(
                rtc
            ).execute(
                1000
            );
        
        
        
        
    }
}