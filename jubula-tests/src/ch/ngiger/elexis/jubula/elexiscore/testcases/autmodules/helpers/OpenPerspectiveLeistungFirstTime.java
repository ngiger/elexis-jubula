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

import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.OpenPerspectiveByName;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.Ub_app_wait;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindowtoclose.Ub_app_waitForWindowToClose;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.Screenshot;

@SrcNode(UUID = "986ae047b37f4acba827bacb341a178e",
         type = NodeType.TEST_CASE)
public class OpenPerspectiveLeistungFirstTime {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(OpenPerspectiveLeistungFirstTime.class);
    
    private RuntimeContext rtc;
    
    public OpenPerspectiveLeistungFirstTime (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        new OpenPerspectiveByName(
                rtc
            ).execute(
                ".*Leistungen.*"
            );
        
        // Wait 5 seconds to see progress or not
        new Ub_app_wait(
                rtc
            ).execute(
                5000
            );
        // Comment: Niklaus did see 110 second on his PC with PostgreSQL (2014.05.24)
        
        // Wait max 240 seconds for Progess window to close
        new Ub_app_waitForWindowToClose(
                rtc
            ).execute(
                ".*Progress.*"
                ,
                "matches"
                ,
                240000
                ,
                100
            );
        
        // Take a screeshot of the Leistungen
        new Screenshot(
                rtc
            ).execute(
                "screenshots/leistungen.png"
            );
        
        
        
        
    }
}