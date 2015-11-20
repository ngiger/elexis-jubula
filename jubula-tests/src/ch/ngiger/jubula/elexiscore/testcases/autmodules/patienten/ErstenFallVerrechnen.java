package ch.ngiger.jubula.elexiscore.testcases.autmodules.patienten;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.api.converter.annotations.NodeType;
import org.eclipse.jubula.client.api.converter.annotations.SrcNode;
import org.eclipse.jubula.qa.api.converter.target.rcp.RuntimeContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.SelectTopLeftCell;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.click.Ub_grc_clickInComponent;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.keycombination.Ub_app_pressAnyKey_SPACE;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindow.Ub_app_waitForWindow;
import ch.ngiger.jubula.unbound_modules_swt.testcases.actionsbasic.select.contextmenu.Ub_grc_selectContextMenuEntry_byTextpath;

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