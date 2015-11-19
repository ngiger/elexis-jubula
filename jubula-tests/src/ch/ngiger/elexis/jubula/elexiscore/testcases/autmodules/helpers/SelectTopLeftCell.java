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

import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.select.table.Ub_tbl_selectCell;

@SrcNode(UUID = "02f23e8fcb5f4e76858828b86d4782b4",
         type = NodeType.TEST_CASE)
public class SelectTopLeftCell {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SelectTopLeftCell.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_tbl;
    
    
    public SelectTopLeftCell (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_tbl
    ) {
        rtc = _rtc;
        
        nn_nn_tbl = _nn_nn_tbl;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Select topLeft cell
        new Ub_tbl_selectCell(
                rtc,
                nn_nn_tbl
            ).execute(
                "1"
                ,
                "equals"
                ,
                "1"
                ,
                "equals"
                ,
                1
                ,
                50
                ,
                "percent"
                ,
                50
                ,
                "percent"
                ,
                "no"
                ,
                1
            );
        
        
        
        
    }
}