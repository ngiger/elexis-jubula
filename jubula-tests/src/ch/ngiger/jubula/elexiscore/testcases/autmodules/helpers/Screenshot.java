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

import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.executeexternalcommand.Ub_app_executeExternalCommand;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.takescreenshot.Ub_app_takeScreenshotOfActiveWindow_allParams;

@SrcNode(UUID = "7eb5f0389f0344989f68e011800b7a3e",
         type = NodeType.TEST_CASE)
public class Screenshot {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Screenshot.class);
    
    private RuntimeContext rtc;
    
    public Screenshot (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
        String DESTINATION
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Log screenshot
        //new Ub_app_executeExternalCommand(
                //rtc
            //).execute(
                //"logger \"I was here from Jubula\" suite " + VariableStore.getInstance().getValue("TEST_TESTSUITE") + " nach " + DESTINATION + ""
                //,
                //0
                //,
                //true
                //,
                //1000
            //);
        
        // Take a Screenshot
        new Ub_app_takeScreenshotOfActiveWindow_allParams(
                rtc
            ).execute(
                DESTINATION
                ,
                0
                ,
                "rename"
                ,
                100
                ,
                true
                ,
                0
                ,
                0
                ,
                0
                ,
                0
            );
        
        
        
        
    }
}