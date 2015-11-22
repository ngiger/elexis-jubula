package ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.api.converter.annotations.NodeType;
import org.eclipse.jubula.client.api.converter.annotations.SrcNode;
import org.eclipse.jubula.qa.api.converter.target.rcp.RuntimeContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.select.menubar.Ub_mbr_selectEntry_byTextpath;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.Ub_app_wait;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.menubar.Ub_mbr_waitForMenuBar;

@SrcNode(UUID = "d3fe33de30584c17ae2aa0d24e8fee30",
         type = NodeType.TEST_CASE)
public class CloseElexis {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(CloseElexis.class);

    private RuntimeContext rtc;

    public CloseElexis (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }

    public void execute(
    ) {
        AUT aut = rtc.getAUT();




        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new Ub_app_prepareForAUTTermination(
                //rtc
            //).execute(
            //);

        new Ub_mbr_waitForMenuBar(
                rtc
            ).execute(
                1000
                ,
                100
            );

        new Ub_mbr_selectEntry_byTextpath(
                rtc
            ).execute(
                "Datei.*/Beenden.*"
                ,
                "matches"
            );

        new Ub_app_wait(
                rtc
            ).execute(
                2000
            );




    }
}