package ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.patienten;

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

import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.click.Ub_grc_clickInComponent;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.keycombination.Ub_app_pressAnyKey_SPACE;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.SelectTopLeftCell;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.select.contextmenu.Ub_grc_selectContextMenuEntry_byTextpath;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindow.Ub_app_waitForWindow;

@SrcNode(UUID = "67b665104ad748ffbcd87eee1210e3a8",
         type = NodeType.TEST_CASE)
public class ErstenFallVerrechnen {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(ErstenFallVerrechnen.class);
    
    private RuntimeContext rtc;
    
    public ErstenFallVerrechnen (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        new Ub_grc_clickInComponent(
                rtc,
                rtc.getIdentifier("Cases_Table_1_tbl")
            ).execute(
                1
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
            );
        
        new Ub_app_pressAnyKey_SPACE(
                rtc
            ).execute(
            );
        
        new SelectTopLeftCell(
                rtc,
                rtc.getIdentifier("Cases_Table_1_tbl")
            ).execute(
            );
        
        new Ub_grc_selectContextMenuEntry_byTextpath(
                rtc,
                rtc.getIdentifier("Cases_Table_1_tbl")
            ).execute(
                "Rechnung.*"
                ,
                "matches"
                ,
                3
            );
        
        new Ub_app_waitForWindow(
                rtc
            ).execute(
                ".*Rechnung.*"
                ,
                "matches"
                ,
                1000
                ,
                100
            );
        
        
        
        
    }
}