package ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.check.menubar;

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

import ch.ngiger.elexis.jubula.unbound_modules_concrete.CTDS;


@SrcNode(UUID = "8ab6b083150339b501150364b0070967",
         type = NodeType.TEST_CASE)
public class Ub_mbr_checkEnablementOfEntry_byIndexpath {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_mbr_checkEnablementOfEntry_byIndexpath.class);
    
    private RuntimeContext rtc;
    
    public Ub_mbr_checkEnablementOfEntry_byIndexpath (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String INDEXPATH,
        Boolean ENABLED
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.swt.SwtComponents.createMenu()
                .checkEnablementOfEntryByIndexpath(
                    INDEXPATH
                    ,
                    ENABLED
                    ),
            null);
            
        
        
        
    }
}