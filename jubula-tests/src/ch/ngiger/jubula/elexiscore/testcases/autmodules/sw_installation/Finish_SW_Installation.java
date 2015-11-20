package ch.ngiger.jubula.elexiscore.testcases.autmodules.sw_installation;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.api.converter.annotations.NodeType;
import org.eclipse.jubula.client.api.converter.annotations.SrcNode;
import org.eclipse.jubula.qa.api.converter.target.rcp.RuntimeContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.SynchronizedClick;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindow.Ub_app_waitForWindow_matches;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindowtoclose.Ub_app_waitForWindowToClose;

@SrcNode(UUID = "330bf0790ae14c819601bd793e430abb",
         type = NodeType.TEST_CASE)
public class Finish_SW_Installation {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Finish_SW_Installation.class);

    private RuntimeContext rtc;

    public Finish_SW_Installation (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    /** We assume to be inside the SW-Update dialog */
    public void execute(
    ) {
        AUT aut = rtc.getAUT();


        rtc.doNotIgnoreCheckFailed();

        try {


        // Click Finish
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("SW_Install_Finish_btn")
            ).execute(
            );

        // Wait for "Install" window
        new Ub_app_waitForWindowToClose(
                rtc
            ).execute(
                "Install"
                ,
                "matches"
                ,
                30000
                ,
                200
            );
        // Comment: We assume -Declipse.p2.unsignedPolicy=allow passed as vmarg to the application

        // Wait for "Installing Software" window
        new Ub_app_waitForWindow_matches(
                rtc
            ).execute(
                "Installing Software"
                ,
                15000
                ,
                200
            );
        //// Comment: We assume -Declipse.p2.unsignedPolicy=allow passed as vmarg to the application

        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Click SW_SecurityWarning_OK_btn
        //new SynchronizedClick(
                //rtc,
                //rtc.getIdentifier("SW_SecurityWarning_OK_btn")
            //).execute(
            //);

        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Wait for "Security Warning"
        //new Ub_app_waitForWindowToClose(
                //rtc
            //).execute(
                //"Security Warning"
                //,
                //"matches"
                //,
                //15000
                //,
                //200
            //);

        // Wait max 3" for 'Software Updates' windows
        new Ub_app_waitForWindow_matches(
                rtc
            ).execute(
                "Software Updates"
                ,
                180000
                ,
                200
            );

        // Wait max 3" for window "Installing Software" to close
        new Ub_app_waitForWindowToClose(
                rtc
            ).execute(
                "Installing Software"
                ,
                "matches"
                ,
                180000
                ,
                200
            );
        // Comment: If we clicked "now", we could not detect restart of application

        // Click on "No"
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("SW-Update-Dialog.no")
            ).execute(
            );

        // Wait for window 'Software Updates" closed
        new Ub_app_waitForWindowToClose(
                rtc
            ).execute(
                "Software Updates"
                ,
                "matches"
                ,
                15000
                ,
                200
            );

        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Set MUST_UPGRADE to false, as we completed SW installation
        //new Ub_app_storeValue(
                //rtc
            //).execute(
                //"MUST_UPGRADE"
                //,
                //"false"
            //);



        }

        // TODO: This test case used Event Handler which you have to replace manually:
        //       Event Type: TestErrorEvent.VerifyFailed
        //       Re-Entry Property: EXIT
        //       Used Test Case: Exit if check failed (Next button)
        //            new ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.EHEmpty(rtc).execute(
        //            );

        finally {
          rtc.endLocalEventHandling(true, false, false, false);
        }
    }
}