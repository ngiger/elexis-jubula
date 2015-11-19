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

import ch.ngiger.elexis.jubula.elexiscore.testcases.unboundmodules.SynchronizedClick;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.keycombination.Ub_app_pressKeyCombination_CTRL_A;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.inputviakeyboard.application.keycombination.Ub_app_pressKeyCombination_CTRL_C;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.executeexternalcommand.Ub_app_executeExternalCommand;

@SrcNode(UUID = "6574afdb65eb41eda7bafb08f00941f7",
         type = NodeType.TEST_CASE)
public class Save_txt_field_to_file_via_xclip {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Save_txt_field_to_file_via_xclip.class);
    
    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_txt;
    
    
    public Save_txt_field_to_file_via_xclip (RuntimeContext _rtc,
        
        ComponentIdentifier _nn_nn_txt
    ) {
        rtc = _rtc;
        
        nn_nn_txt = _nn_nn_txt;
    }
    
    public void execute(
        String FILE_NAME
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Select text field
        new SynchronizedClick(
                rtc,
                nn_nn_txt
            ).execute(
            );
        
        // Select all
        new Ub_app_pressKeyCombination_CTRL_A(
                rtc
            ).execute(
            );
        
        // Copy to clipboard
        new Ub_app_pressKeyCombination_CTRL_C(
                rtc
            ).execute(
            );
        //// Comment: Disabled at the moment as it creates problem on MacOSX and Windows
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Save clipboard to file (NOOP at the moment)
        //new Ub_app_executeExternalCommand(
                //rtc
            //).execute(
                //"bash -c \"xclip -o > " + FILE_NAME + "\""
                //,
                //0
                //,
                //true
                //,
                //1000
            //);
        
        
        
        
    }
}