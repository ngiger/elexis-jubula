package ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.api.converter.annotations.NodeType;
import org.eclipse.jubula.client.api.converter.annotations.SrcNode;
import org.eclipse.jubula.qa.api.converter.target.rcp.RuntimeContext;
import org.eclipse.jubula.tools.ComponentIdentifier;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SrcNode(UUID = "34766dfda16f45b88606bc3ed7c9b22f",
         type = NodeType.TEST_CASE)
public class Ub_grc_waitForEnablement {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_grc_waitForEnablement.class);

    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_grc;


    public Ub_grc_waitForEnablement (RuntimeContext _rtc,

        ComponentIdentifier _nn_nn_grc
    ) {
        rtc = _rtc;

        nn_nn_grc = _nn_nn_grc;
    }

    public void execute(
        Boolean ENABLED,
        Integer MILLISECS
    ) {
        AUT aut = rtc.getAUT();


        rtc.doNotIgnoreCheckFailed();

        try {


        new Ub_grc_checkEnablement(
                rtc,
                nn_nn_grc
            ).execute(
                ENABLED
            );



        }

        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.VerifyFailed
        //       Re-Entry Property: RETRY
        //       Used Test Case:
        //            new ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.Ub_app_wait(rtc).execute(
        //                MILLISECS
        //            );

        finally {
          rtc.endLocalEventHandling(true, false, false, false);
        }
    }
}