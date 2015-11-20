package ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.api.converter.annotations.NodeType;
import org.eclipse.jubula.client.api.converter.annotations.SrcNode;
import org.eclipse.jubula.qa.api.converter.target.rcp.RuntimeContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SrcNode(UUID = "21d5642e2f0440e493728c413a3258ec",
         type = NodeType.TEST_CASE)
public class RestartElexisAndOpenLeistungen {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(RestartElexisAndOpenLeistungen.class);

    private RuntimeContext rtc;

    public RestartElexisAndOpenLeistungen (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }

    public void execute(
    ) {
        AUT aut = rtc.getAUT();




        // Take screenshot before restart
        new Screenshot(
                rtc
            ).execute(
                "screenshots/sw-inst/before_restart.png"
            );
        // Comment: As told in documentation opens with same configuration. But we might use the new one

        // TODO: restart elexis
        // Restart Elexis

        // Take screenshot after restart
        new Screenshot(
                rtc
            ).execute(
                "screenshots/sw-inst/after_restart.png"
            );

        // Must open first Leistungen (take long time)
        new OpenPerspectiveLeistungFirstTime(
                rtc
            ).execute(
            );




    }
}