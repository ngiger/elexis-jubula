package ch.ngiger.jubula.elexiscore.testsuites.testsuites;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.api.converter.annotations.NodeType;
import org.eclipse.jubula.client.api.converter.annotations.SrcNode;
import org.eclipse.jubula.qa.api.converter.target.rcp.RuntimeContext;
import org.eclipse.jubula.qa.api.converter.target.rcp.VariableStore;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ch.ngiger.jubula.elexiscore.testcases.autmodules.SW_show_about;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.RestartElexisAndOpenLeistungen;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.sw_installation.Install_all_SW_components_from_all_sites;

@SrcNode(UUID = "dda24a380a2647e28c7ea7802fcc2809",
         type = NodeType.TEST_SUITE)
public class TST_UPGRADE {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(TST_UPGRADE.class);

    private RuntimeContext rtc;

    public TST_UPGRADE (AUT _aut) {
        rtc = new RuntimeContext(_aut, true, false, false, true);
    }
    /** Will only return okay if there is something to upgrade */
    public void execute(
    ) {




        // Show about info before upgrade
        new SW_show_about(
                rtc
            ).execute(
                "About.*"
                ,
                ".*Installation Detail.*"
            );
        // Comment: If $MUST_UPGRADE can be set via environment variable TEST_UDV_MUST_UPGRADE. Sa.http://help.eclipse.org/indigo/index.jsp?topic=%2Forg.eclipse.jubula.client.ua.help%2Fhtml%2Fmanual%2Fnode108.html

        // Set expection for SW-upgrade
        String value = VariableStore.getInstance().getValue("MUST_UPGRADE");
        VariableStore.getInstance().addVariable("MUST_UPGRADE", value);


        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Override expection from environment here!
        //new Ub_app_storeValue(
                //rtc
            //).execute(
                //"MUST_UPGRADE"
                //,
                //"false"
            //);
        //// Comment: The request comes from the environment variable TEST_UDF_SW_MUST_UPGRADE. Defaults to no

        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Check SW core update as requested
        //new Check_SW_core_update_as_requested(
                //rtc
            //).execute(
                //"" + VariableStore.getInstance().getValue("SW_MUST_UPGRADE") + ""
            //);

        // Install all stuff from all P2 sites
        new Install_all_SW_components_from_all_sites(
                rtc
            ).execute(
            );

        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Wait up to 60' that no update is running before restarting
        //new Ub_app_waitForWindowToClose(
                //rtc
            //).execute(
                //"Installin.*"
                //,
                //"matches"
                //,
                //60000
                //,
                //100
            //);

        // Restart Elexis to be sure that the new components work
        new RestartElexisAndOpenLeistungen(
                rtc
            ).execute(
            );

        // Show about info after upgrade
        new SW_show_about(
                rtc
            ).execute(
                "About.*"
                ,
                ".*Installation Detail.*"
            );
        //// Comment: Does not work at the moment. Beta-2 would upgrade

        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// No no more core updates should be necessary
        //new SW_check_for_updates(
                //rtc,
                //rtc.getIdentifier("SW_update_information_ok_btn")
            //).execute(
                //"false"
            //);



    }
}