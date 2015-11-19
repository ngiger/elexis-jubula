package ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules;

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

import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.preferences.SelectItemPressApplyAndOkay;
import ch.ngiger.elexis.jubula.elexiscore.testcases.work_ng.patienten.UC_1_Patienten_Erfassen;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.patienten.NeuenPatientenErfassen;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.patienten.Fall_Erfassen;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.helpers.OpenViewByName;
import ch.ngiger.elexis.jubula.elexiscore.testcases.autmodules.preferences.SelectPreferenceItem;

@SrcNode(UUID = "bb11cf9b783047fc952299f597dc1cf0",
         type = NodeType.TEST_CASE)
public class FULLTEST_BROKEN {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(FULLTEST_BROKEN.class);
    
    private RuntimeContext rtc;
    
    public FULLTEST_BROKEN (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }
    
    public void execute(
    ) {
        AUT aut = rtc.getAUT();
        
        
        
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new SelectItemPressApplyAndOkay(
                //rtc
            //).execute(
                //"Druckereinstellung.*"
            //);
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //new SelectItemPressApplyAndOkay(
                //rtc
            //).execute(
                //"Help/Content"
            //);
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //for (CTDS.PATIENTEN row : CTDS.PATIENTEN.data) {
            //new UC_1_Patienten_Erfassen(
                //rtc
            //).execute(
                //row.FAMILYNAME,
                //row.BIRTHDAY,
                //row.GIVENNAME,
                //row.SEX
                //);
        //}
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //for (CTDS.PATIENTEN row : CTDS.PATIENTEN.data) {
            //new NeuenPatientenErfassen(
                //rtc
            //).execute(
                //row.FAMILYNAME,
                //row.BIRTHDAY,
                //row.GIVENNAME,
                //row.SEX
                //);
        //}
        
        // Hint: this line is commented out because its correspondent node in the ITE was inactive
        //// Fall erfassen
        //new Fall_Erfassen(
                //rtc
            //).execute(
                //"Bernasconi"
                //,
                //"VVG"
                //,
                //"Anderes"
                //,
                //"Unfall 800"
                //,
                //""
                //,
                //""
            //);
        
        for (CTDS.VIEWS row : CTDS.VIEWS.data) {
            // Open all views
            new OpenViewByName(
                rtc
            ).execute(
                row.VIEWNAME
                );
        }
        
        for (CTDS.PREFERENCES row : CTDS.PREFERENCES.data) {
            // Open all Preferences
            new SelectPreferenceItem(
                rtc
            ).execute(
                row.PREFERENCES_PATH
                );
        }
        
        
        
        
    }
}