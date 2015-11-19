package ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers;

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

import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.menubar.Ub_mbr_waitForMenuBar;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.select.menubar.Ub_mbr_selectEntry_byTextpath;
import ch.ngiger.elexis.jubula.elexiscore.testcases.unboundmodules.SynchronizedClick;

@SrcNode(UUID = "5a034cd013b74493bbfbe153cfcd18d1",
         type = NodeType.TEST_CASE)
public class ResetPerspective {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(ResetPerspective.class);
    
    private RuntimeContext rtc;
    
    public ResetPerspective (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Wait for MenuBar
        new Ub_mbr_waitForMenuBar(
                rtc
            ).execute(
                10000
                ,
                10
            );
        
        // Select menu entry reset perspective
        new Ub_mbr_selectEntry_byTextpath(
                rtc
            ).execute(
                "Fenster/Perspektive/Reset.*"
                ,
                "matches"
            );
        
        // Click Yes
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("ResetPerspektive_OkButton_grc")
            ).execute(
            );
        
        
        
        
    }
}