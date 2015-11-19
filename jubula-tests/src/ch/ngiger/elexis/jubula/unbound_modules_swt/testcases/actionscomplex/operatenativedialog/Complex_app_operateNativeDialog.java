package ch.ngiger.elexis.jubula.unbound_modules_swt.testcases.actionscomplex.operatenativedialog;

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

import ch.ngiger.elexis.jubula.unbound_modules_swt.CTDS;

import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.Ub_app_wait;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.Ub_app_externalInputText;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.Ub_app_externalPressAnyKey_noModifier;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.Ub_app_externalPressAnyKey_noModifier_Enter;

@SrcNode(UUID = "8ab6b0831f179045011f179176ed0003",
         type = NodeType.TEST_CASE)
public class Complex_app_operateNativeDialog {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Complex_app_operateNativeDialog.class);
    
    private RuntimeContext rtc;
    
    public Complex_app_operateNativeDialog (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    /** This Test Case will enter a filename into a native window and press enter */
    public void execute(
        String FILENAME,
        String FILE_EXTENSION
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        new Ub_app_wait(
                rtc
            ).execute(
                2500
            );
        
        new Ub_app_externalInputText(
                rtc
            ).execute(
                FILENAME
            );
        
        new Ub_app_externalPressAnyKey_noModifier(
                rtc
            ).execute(
                "PERIOD"
            );
        
        new Ub_app_externalInputText(
                rtc
            ).execute(
                FILE_EXTENSION
            );
        
        new Ub_app_externalPressAnyKey_noModifier_Enter(
                rtc
            ).execute(
            );
        
        new Ub_app_wait(
                rtc
            ).execute(
                2500
            );
        
        
        
        
    }
}