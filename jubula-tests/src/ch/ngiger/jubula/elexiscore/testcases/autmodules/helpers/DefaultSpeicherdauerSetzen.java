package ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers;

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

import ch.ngiger.jubula.elexiscore.CTDS;

import ch.ngiger.jubula.elexiscore.testcases.autmodules.preferences.SelectPreferenceItem;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.waitforwindow.Ub_app_waitForWindow;
import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.SynchronizedReplaceText;
import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.Screenshot;
import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.SynchronizedClick;

@SrcNode(UUID = "2b84c22924c04ca79ea4852654db0d2f",
         type = NodeType.TEST_CASE)
public class DefaultSpeicherdauerSetzen {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(DefaultSpeicherdauerSetzen.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier synch_text_input;
    
    
    public DefaultSpeicherdauerSetzen (RuntimeContext _rtc,
        
        ComponentIdentifier _synch_text_input
    ) {
        rtc = _rtc;
        
        synch_text_input = _synch_text_input;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Select Preferences..General
        new SelectPreferenceItem(
                rtc
            ).execute(
                "Allgemein"
            );
        
        new Ub_app_waitForWindow(
                rtc
            ).execute(
                "Preferences"
                ,
                "matches"
                ,
                10000
                ,
                10
            );
        
        // Speicherdauer setzen
        new SynchronizedReplaceText(
                rtc,
                synch_text_input
            ).execute(
                "6"
            );
        
        // Screenshot of logpath
        new Screenshot(
                rtc
            ).execute(
                "screenshots/log_file.png"
            );
        
        // Click apply
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("Preferences_ApplyButton_grc")
            ).execute(
            );
        
        // Click OK
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("Preferences_OkButton_grc")
            ).execute(
            );
        
        
        
        
    }
}