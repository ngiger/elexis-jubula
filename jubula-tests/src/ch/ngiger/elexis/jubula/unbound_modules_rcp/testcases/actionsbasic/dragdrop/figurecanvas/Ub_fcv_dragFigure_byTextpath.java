package ch.ngiger.elexis.jubula.unbound_modules_rcp.testcases.actionsbasic.dragdrop.figurecanvas;

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

import ch.ngiger.elexis.jubula.unbound_modules_rcp.CTDS;


@SrcNode(UUID = "8ab6b0832254bb19012254fe34a70049",
         type = NodeType.TEST_CASE)
public class Ub_fcv_dragFigure_byTextpath {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_fcv_dragFigure_byTextpath.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_fcv;
    
    
    public Ub_fcv_dragFigure_byTextpath (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_fcv
    ) {
        rtc = _rtc;
        
        nn_nn_fcv = _nn_nn_fcv;
    }
    
    public void execute(
        String TEXTPATH,
        String OPERATOR
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        new ch.ngiger.elexis.jubula.unbound_modules_rcp.testcases.actionsbasic.dragdrop.figurecanvas._details.Ub_fcv_dragFigure_byTextpath(
                rtc,
                nn_nn_fcv
            ).execute(
                TEXTPATH
                ,
                OPERATOR
                ,
                1
                ,
                "none"
                ,
                50
                ,
                "percent"
                ,
                50
                ,
                "percent"
            );
        
        
        
        
    }
}