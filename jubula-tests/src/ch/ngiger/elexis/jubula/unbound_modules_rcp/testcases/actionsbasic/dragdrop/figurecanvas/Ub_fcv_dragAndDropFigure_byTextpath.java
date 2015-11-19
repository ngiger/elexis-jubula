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

import ch.ngiger.elexis.jubula.unbound_modules_rcp.testcases.actionsbasic.dragdrop.figurecanvas.Ub_fcv_dragFigure_byTextpath;
import ch.ngiger.elexis.jubula.unbound_modules_rcp.testcases.actionsbasic.dragdrop.figurecanvas.Ub_fcv_dropOnFigure_byTextpath;

@SrcNode(UUID = "8ab6b083225a2b1401225a33a4f30001",
         type = NodeType.TEST_CASE)
public class Ub_fcv_dragAndDropFigure_byTextpath {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_fcv_dragAndDropFigure_byTextpath.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_fcv;
    
    
    public Ub_fcv_dragAndDropFigure_byTextpath (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_fcv
    ) {
        rtc = _rtc;
        
        nn_nn_fcv = _nn_nn_fcv;
    }
    
    public void execute(
        String SOURCE_TEXTPATH,
        String TARGET_TEXTPATH
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        new Ub_fcv_dragFigure_byTextpath(
                rtc,
                nn_nn_fcv
            ).execute(
                SOURCE_TEXTPATH
                ,
                "matches"
            );
        
        new Ub_fcv_dropOnFigure_byTextpath(
                rtc,
                nn_nn_fcv
            ).execute(
                TARGET_TEXTPATH
                ,
                "matches"
            );
        
        
        
        
    }
}