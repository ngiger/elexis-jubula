package ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.sw_installation;

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

import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.sw_installation.Install_all_SW_components_from_all_sites;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.Screenshot;
import ch.ngiger.elexis.jubula.elexiscore.testcases.unboundmodules.SynchronizedClick;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.EHEmpty;

@SrcNode(UUID = "47b9d07c78a44fbba8534e6436833788",
         type = NodeType.TEST_CASE)
public class SW_Install_Second_Try_MightFail {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SW_Install_Second_Try_MightFail.class);
    
    private RuntimeContext rtc;
    
    public SW_Install_Second_Try_MightFail (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        rtc.doNotIgnoreCheckFailed();
        
        try {
        
        
        // This time it might fail, because Finish button noch checked
        new Install_all_SW_components_from_all_sites(
                rtc
            ).execute(
            );
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new Screenshot(
                //rtc
            //).execute(
                //"SW-Installation failed.png"
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new SynchronizedClick(
                //rtc,
                //rtc.getIdentifier("SW_Install_Cancel")
            //).execute(
            //);
        
        
        
        }
        
        
        catch (CheckFailedException e) {
            log.debug("Exception during test execution", e);
            // TODO: Commented out event handler. (Commenting in does not necessarily lead to same test execution as in ITE)
            //new EHEmpty(rtc
                //).execute(
                        //);
        }
        
        finally {
          rtc.endLocalEventHandling(true, false, false, false);
        }
    }
}