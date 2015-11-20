package ch.ngiger.jubula.elexiscore.testcases.autmodules.sw_installation;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.api.converter.annotations.NodeType;
import org.eclipse.jubula.client.api.converter.annotations.SrcNode;
import org.eclipse.jubula.qa.api.converter.target.rcp.RuntimeContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.Ub_tre_selectNode_byIndexpath;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.Ub_app_inputText;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.keycombination.Ub_app_pressAnyKey_LEFT;

@SrcNode(UUID = "10e0a12fd56d46f0961cfd620fce2d67",
         type = NodeType.TEST_CASE)
public class Select_SW_Component_to_install {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Select_SW_Component_to_install.class);

    private RuntimeContext rtc;

    public Select_SW_Component_to_install (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }

    public void execute(
        String INDEXPATH
    ) {
        AUT aut = rtc.getAUT();




        // Select Path
        new Ub_tre_selectNode_byIndexpath(
                rtc,
                rtc.getIdentifier("SW_Install_SW_List")
            ).execute(
                "absolute"
                ,
                0
                ,
                INDEXPATH
                ,
                1
                ,
                1
                ,
                "no"
            );

        // Press Left Arrow
        new Ub_app_pressAnyKey_LEFT(
                rtc
            ).execute(
            );

        // Press Left Arrow
        new Ub_app_pressAnyKey_LEFT(
                rtc
            ).execute(
            );

        // Press Left Arrow
        new Ub_app_pressAnyKey_LEFT(
                rtc
            ).execute(
            );

        // Press space
        new Ub_app_inputText(
                rtc
            ).execute(
                null // TODO: <code>null</code> found as test data - check and fix in ITE
            );

        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new Ub_app_wait(
                //rtc
            //).execute(
                //500
            //);




    }
}