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

import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.click.Ub_grc_clickLeft_single;

@SrcNode(UUID = "a1281c300ae54856830a8945e70d15ee",
         type = NodeType.TEST_CASE)
public class SelectItemAndOpenViewIfNecessary {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SelectItemAndOpenViewIfNecessary.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier View_Item_grc;
    
    
    public SelectItemAndOpenViewIfNecessary (RuntimeContext _rtc,
        
        ComponentIdentifier _View_Item_grc
    ) {
        rtc = _rtc;
        
        View_Item_grc = _View_Item_grc;
    }
    
    public void execute(
        String VIEWNAME
    ) {
        AUT aut = rtc.getAUT();
        
        
        rtc.doNotIgnoreCompNotFound();
        
        try {
        
        
        new Ub_grc_clickLeft_single(
                rtc,
                View_Item_grc
            ).execute(
            );
        
        
        
        }
        
        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.CompNotFound
        //       Re-Entry Property: RETRY
        //       Used Test Case: 
        //            new ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.OpenViewByName(rtc).execute(
        //                VIEWNAME
        //            );
        
        finally {
          rtc.endLocalEventHandling(false, false, true, false);
        }
    }
}