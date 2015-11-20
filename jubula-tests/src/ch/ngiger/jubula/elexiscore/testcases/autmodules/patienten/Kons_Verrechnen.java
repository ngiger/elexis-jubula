package ch.ngiger.jubula.elexiscore.testcases.autmodules.patienten;

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

import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.SynchronizedClick;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.ClickInMiddleOfComponent;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.SelectTopLeftCell;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.Elexis_SlowDown_Necessary;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.select.contextmenu.Ub_grc_selectContextMenuEntry_byTextpath;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.OpenViewByName;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.keycombination.Ub_app_pressAnyKeyCombination_CTRL;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.Screenshot;

@SrcNode(UUID = "3e3acdc0f513477fa53feef478edc4e7",
         type = NodeType.TEST_CASE)
public class Kons_Verrechnen {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Kons_Verrechnen.class);
    
    private RuntimeContext rtc;
    
    public Kons_Verrechnen (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Click in Cases
        //new SynchronizedClick(
                //rtc,
                //rtc.getIdentifier("Cases_Table_1_tbl")
            //).execute(
            //);
        
        // Click in middle of Cases
        new ClickInMiddleOfComponent(
                rtc,
                rtc.getIdentifier("Cases_Table_1_tbl")
            ).execute(
            );
        
        // Select top most case
        new SelectTopLeftCell(
                rtc,
                rtc.getIdentifier("Cases_Table_1_tbl")
            ).execute(
            );
        
        new Elexis_SlowDown_Necessary(
                rtc
            ).execute(
            );
        
        // Context menu Rechnung erstellen
        new Ub_grc_selectContextMenuEntry_byTextpath(
                rtc,
                rtc.getIdentifier("Cases_Table_1_tbl")
            ).execute(
                "Rechnung erstellen.*"
                ,
                "matches"
                ,
                3
            );
        
        // View Rechnungsübersicht öffnen
        new OpenViewByName(
                rtc
            ).execute(
                "Abrechnung/Rechnungsübersicht.*"
            );
        
        // maximize view
        new Ub_app_pressAnyKeyCombination_CTRL(
                rtc
            ).execute(
                "m"
            );
        
        // Screenshot Erste Rechnung erstellen
        new Screenshot(
                rtc
            ).execute(
                "screenshots/erste_rechnung.png"
            );
        
        
        
        
    }
}