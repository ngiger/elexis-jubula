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

import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.select.menubar.Ub_mbr_selectEntry_byTextpath;

@SrcNode(UUID = "3a6b624d0da44dc2993081fd57b8db17",
         type = NodeType.TEST_CASE)
public class SelectMenuViewOther {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SelectMenuViewOther.class);
    
    private RuntimeContext rtc;
    
    public SelectMenuViewOther (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Menu wählen
        new Ub_mbr_selectEntry_byTextpath(
                rtc
            ).execute(
                "Fenster.*/Ansicht.*/Other.*"
                ,
                "matches"
            );
        
        
        
        
    }
}