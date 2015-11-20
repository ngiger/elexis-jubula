package ch.ngiger.jubula.elexiscore.testcases.autmodules.preferences;

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

import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.menubar.Ub_mbr_waitForMenuBar;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.select.menubar.Ub_mbr_selectEntry_byTextpath;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.select.tree.Ub_tre_selectNode_byTextpath;

@SrcNode(UUID = "76a22bc7a9854f268785b471f30c1acd",
         type = NodeType.TEST_CASE)
public class SelectPreferenceItem {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SelectPreferenceItem.class);
    
    private RuntimeContext rtc;
    
    public SelectPreferenceItem (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String PREFERENCES_PATH
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        new Ub_mbr_waitForMenuBar(
                rtc
            ).execute(
                10000
                ,
                100
            );
        
        for (CTDS.MENU_PREFERENCES row : CTDS.MENU_PREFERENCES.data) {
            // Select preferences menu
            new Ub_mbr_selectEntry_byTextpath(
                rtc
            ).execute(
                row.TEXTPATH,
                row.OPERATOR
                );
        }
        
        // Select PREFERENCES_PATH
        new Ub_tre_selectNode_byTextpath(
                rtc,
                rtc.getIdentifier("Preferences_ItemChoice_tre")
            ).execute(
                "absolute"
                ,
                0
                ,
                PREFERENCES_PATH
                ,
                "matches"
                ,
                1
                ,
                1
                ,
                "no"
            );
        
        
        
        
    }
}