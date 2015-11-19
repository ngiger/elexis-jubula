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

import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.expandtree.Ub_tre_expandNode_byIndexpath;
import ch.ngiger.elexis.jubula.unbound_modules_concrete.testcases.actionsbasic.wait.application.Ub_app_wait;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.sw_installation.Select_SW_Component_to_install;
import ch.ngiger.elexis.jubula.unbound_modules_swt.testcases.actionsbasic.select.treetable.Ub_trt_selectEntryByIndexpath_specifyColumn;
import ch.ngiger.elexis.jubula.unbound_modules_swt.testcases.actionsbasic.select.treetable.Ub_trt_selectEntryByTextpath_specifyColumn;
import ch.ngiger.elexis.jubula.elexiscore.testcases.unboundmodules.SynchronizedClick;

@SrcNode(UUID = "ea9efffa90d5417fa9a29fb94e9e4c6a",
         type = NodeType.TEST_CASE)
public class SW_Install_select_componen_is_unused {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(SW_Install_select_componen_is_unused.class);
    
    private RuntimeContext rtc;
    
    public SW_Install_select_componen_is_unused (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new Ub_tre_expandNode_byIndexpath(
                //rtc,
                //rtc.getIdentifier("SW_Install_SW_List")
            //).execute(
                //"absolute"
                //,
                //0
                //,
                //"1"
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new Ub_app_wait(
                //rtc
            //).execute(
                //500
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new Select_SW_Component_to_install(
                //rtc
            //).execute(
                //"1/1"
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new Select_SW_Component_to_install(
                //rtc
            //).execute(
                //"2/1"
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new Select_SW_Component_to_install(
                //rtc
            //).execute(
                //"3/1"
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new Ub_trt_selectEntryByIndexpath_specifyColumn(
                //rtc,
                //rtc.getIdentifier("SW_Install_SW_List")
            //).execute(
                //"absolute"
                //,
                //0
                //,
                //"1/1"
                //,
                //1
                //,
                //1
                //,
                //1
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Select Basispakete
        //new Ub_trt_selectEntryByTextpath_specifyColumn(
                //rtc,
                //rtc.getIdentifier("SW_Install_SW_List")
            //).execute(
                //"absolute"
                //,
                //0
                //,
                //"Basispakete"
                //,
                //"equals"
                //,
                //1
                //,
                //1
                //,
                //1
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new Ub_app_wait(
                //rtc
            //).execute(
                //500
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Click
        //new SynchronizedClick(
                //rtc,
                //rtc.getIdentifier("SW_Install_SW_List")
            //).execute(
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new Ub_app_wait(
                //rtc
            //).execute(
                //1000
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Select Basispakete
        //new Ub_trt_selectEntryByTextpath_specifyColumn(
                //rtc,
                //rtc.getIdentifier("SW_Install_SW_List")
            //).execute(
                //"absolute"
                //,
                //0
                //,
                //"Basispakete"
                //,
                //"equals"
                //,
                //1
                //,
                //1
                //,
                //1
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Select Dokumentenverwaltung
        //new Ub_trt_selectEntryByTextpath_specifyColumn(
                //rtc,
                //rtc.getIdentifier("SW_Install_SW_List")
            //).execute(
                //"absolute"
                //,
                //0
                //,
                //"Dokumentenverwaltung"
                //,
                //"equals"
                //,
                //1
                //,
                //1
                //,
                //1
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new Ub_app_wait(
                //rtc
            //).execute(
                //1000
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Select Dokumentenverwaltung
        //new Ub_trt_selectEntryByTextpath_specifyColumn(
                //rtc,
                //rtc.getIdentifier("SW_Install_SW_List")
            //).execute(
                //"absolute"
                //,
                //0
                //,
                //"Dokumentenverwaltung"
                //,
                //"equals"
                //,
                //1
                //,
                //1
                //,
                //1
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new Ub_app_wait(
                //rtc
            //).execute(
                //1000
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Select elexis_3_core
        //new Ub_trt_selectEntryByTextpath_specifyColumn(
                //rtc,
                //rtc.getIdentifier("SW_Install_SW_List")
            //).execute(
                //"absolute"
                //,
                //0
                //,
                //"elexis_3_core"
                //,
                //"equals"
                //,
                //1
                //,
                //1
                //,
                //1
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Select elexis_3_core
        //new Ub_trt_selectEntryByTextpath_specifyColumn(
                //rtc,
                //rtc.getIdentifier("SW_Install_SW_List")
            //).execute(
                //"absolute"
                //,
                //0
                //,
                //"elexis_3_core"
                //,
                //"equals"
                //,
                //1
                //,
                //1
                //,
                //1
            //);
        
        
        
        
    }
}