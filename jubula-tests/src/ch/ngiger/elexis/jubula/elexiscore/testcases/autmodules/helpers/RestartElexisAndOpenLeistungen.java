package ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers;

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

import ch.ngiger.elexis.jubula.elexiscore.CTDS;

import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.Screenshot;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.restartapplication.restart.Ub_app_restart;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.OpenPerspectiveLeistungFirstTime;

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
        
        // Restart Elexis
        new Ub_app_restart(
                rtc
            ).execute(
            );
        
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