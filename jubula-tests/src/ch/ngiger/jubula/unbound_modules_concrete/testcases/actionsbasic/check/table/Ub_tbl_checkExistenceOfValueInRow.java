package ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.check.table;

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

import ch.ngiger.jubula.unbound_modules_concrete.CTDS;


@SrcNode(UUID = "8ab6b08d294519bd012945ef8e1d0830",
         type = NodeType.TEST_CASE)
public class Ub_tbl_checkExistenceOfValueInRow {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_tbl_checkExistenceOfValueInRow.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_tbl;
    
    
    public Ub_tbl_checkExistenceOfValueInRow (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_tbl
    ) {
        rtc = _rtc;
        
        nn_nn_tbl = _nn_nn_tbl;
    }
    
    public void execute(
        String ROW,
        String ROW_OPERATOR,
        String VALUE,
        String VALUE_OPERATOR,
        String SEARCH_TYPE,
        Boolean EXISTS
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        aut.execute(
            org.eclipse.jubula.toolkit.concrete.ConcreteComponents.createTableComponent(nn_nn_tbl)
                .checkExistenceOfValueInRow(
                    ROW
                    ,
                    Operator.literalAsEnum(ROW_OPERATOR)
                    ,
                    VALUE
                    ,
                    Operator.literalAsEnum(VALUE_OPERATOR)
                    ,
                    SearchType.valueOf(SEARCH_TYPE)
                    ,
                    EXISTS
                    ),
            null);
            
        
        
        
    }
}