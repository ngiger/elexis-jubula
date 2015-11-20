package ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.api.converter.annotations.NodeType;
import org.eclipse.jubula.client.api.converter.annotations.SrcNode;
import org.eclipse.jubula.qa.api.converter.target.rcp.RuntimeContext;
import org.eclipse.jubula.tools.ComponentIdentifier;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.check.componentwithtext.Ub_ctx_checkText;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.check.table.Ub_tbl_checkExistenceOfValueInRow;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.keycombination.Ub_app_pressAnyKey_ENTER;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.select.table.Ub_tbl_selectCell;

@SrcNode(UUID = "b6a98db0f95c4f53a9e35a4212c017bd",
         type = NodeType.TEST_CASE)
public class OkayIfNothingInTable {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(OkayIfNothingInTable.class);

    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_tbl;


    public OkayIfNothingInTable (RuntimeContext _rtc,

        ComponentIdentifier _nn_nn_tbl
    ) {
        rtc = _rtc;

        nn_nn_tbl = _nn_nn_tbl;
    }

    public void execute(
        String ROW
    ) {
        AUT aut = rtc.getAUT();


        rtc.doNotIgnoreActionError();

        try {


        new Ub_tbl_selectCell(
                rtc,
                rtc.getIdentifier("Pat_List_tbl")
            ).execute(
                "1"
                ,
                "matches"
                ,
                ".*"
                ,
                "matches"
                ,
                1
                ,
                "no"
                ,
                "absolute"
                ,
                1
            );

        new Ub_ctx_checkText(
                rtc,
                rtc.getIdentifier("PatListView_Info_ctx")
            ).execute(
                "Kein Patient.*"
                ,
                "matches"
            );

        new Ub_app_pressAnyKey_ENTER(
                rtc
            ).execute(
            );

        new Ub_tbl_checkExistenceOfValueInRow(
                rtc,
                nn_nn_tbl
            ).execute(
                ROW
                ,
                "matches"
                ,
                ".*"
                ,
                "matches"
                ,
                "absolute"
                ,
                false
            );



        }

        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.Action
        //       Re-Entry Property: BREAK
        //       Used Test Case:
        //            new ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.click.application.Ub_app_clickInActiveWindow(rtc).execute(
        //                1,
        //                1,
        //                50,
        //                "percent",
        //                50,
        //                "percent"
        //            );

        finally {
          rtc.endLocalEventHandling(false, true, false, false);
        }
    }
}