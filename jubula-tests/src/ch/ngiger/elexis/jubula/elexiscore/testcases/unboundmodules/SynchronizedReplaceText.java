package ch.ngiger.elexis.jubula.elexiscore.testcases.unboundmodules;

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

import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.Ub_grc_waitForComponent;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.check.Ub_grc_checkEnablement;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.check.componentwithtextinput.Ub_cti_checkEditability;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.componentwithtextinput.Ub_cti_replaceText;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.check.componentwithtext.Ub_ctx_checkText;

@SrcNode(UUID = "07a110937451400ea2330dc4088e49ed",
         type = NodeType.TEST_CASE)
public class SynchronizedReplaceText {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SynchronizedReplaceText.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier synch_text_input;
    
    
    public SynchronizedReplaceText (RuntimeContext _rtc,
        
        ComponentIdentifier _synch_text_input
    ) {
        rtc = _rtc;
        
        synch_text_input = _synch_text_input;
    }
    
    public void execute(
        String TEXT
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Wait for component
        new Ub_grc_waitForComponent(
                rtc,
                synch_text_input
            ).execute(
                100
                ,
                0
            );
        
        // Check enabled
        new Ub_grc_checkEnablement(
                rtc,
                synch_text_input
            ).execute(
                true
            );
        
        // Check editable
        new Ub_cti_checkEditability(
                rtc,
                synch_text_input
            ).execute(
                true
            );
        
        // Replace text
        new Ub_cti_replaceText(
                rtc,
                synch_text_input
            ).execute(
                TEXT
            );
        
        // Check text
        new Ub_ctx_checkText(
                rtc,
                synch_text_input
            ).execute(
                TEXT
                ,
                "equals"
            );
        
        
        
        
    }
}