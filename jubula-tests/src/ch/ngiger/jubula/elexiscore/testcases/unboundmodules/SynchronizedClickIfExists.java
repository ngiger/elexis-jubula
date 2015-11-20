package ch.ngiger.jubula.elexiscore.testcases.unboundmodules;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.api.converter.annotations.NodeType;
import org.eclipse.jubula.client.api.converter.annotations.SrcNode;
import org.eclipse.jubula.qa.api.converter.target.rcp.RuntimeContext;
import org.eclipse.jubula.tools.ComponentIdentifier;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SrcNode(UUID = "94647e1be2874050b43a259e99b692f7",
         type = NodeType.TEST_CASE)
public class SynchronizedClickIfExists {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SynchronizedClickIfExists.class);

    private RuntimeContext rtc = null;
    private ComponentIdentifier nn_nn_grc = null;

    public SynchronizedClickIfExists (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    public SynchronizedClickIfExists(RuntimeContext rtc2, ComponentIdentifier _nn_nn_grc){
		// TODO Auto-generated constructor stub
    	rtc = rtc2;
    	nn_nn_grc = _nn_nn_grc;
	}
	/** Clicks if it exits. Assume that after clicking it will disappear */
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        ComponentIdentifier id;

        rtc.doNotIgnoreCheckFailed();

        try {
        // Check whether grc exists
        new Ub_grc_checkExistence(
                rtc,
                rtc.getIdentifier("nn_nn_grc")
            ).execute(
                false
            );



        }

        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.VerifyFailed
        //       Re-Entry Property: RETRY
        //       Used Test Case: ClickLeftIfExists
        //            new ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.click.Ub_grc_clickLeft_single(rtc).execute(
        //            );

        finally {
          rtc.endLocalEventHandling(true, false, false, false);
        }
    }
}