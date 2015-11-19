package ch.ngiger.elexis.jubula.elexiscore.testcases.work_ng;

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

import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.OpenViewByName;

@SrcNode(UUID = "d7464a12563a48acb04d3e5f6653cdfe",
         type = NodeType.TEST_CASE)
public class Omnivore {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Omnivore.class);
    
    private RuntimeContext rtc;
    
    public Omnivore (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        new OpenViewByName(
                rtc
            ).execute(
                "Omnivore.*/Dokumente.*"
            );
        
        
        
        
    }
}