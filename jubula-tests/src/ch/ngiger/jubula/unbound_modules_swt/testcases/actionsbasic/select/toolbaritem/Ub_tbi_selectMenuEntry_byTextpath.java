package ch.ngiger.jubula.unbound_modules_swt.testcases.actionsbasic.select.toolbaritem;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.api.converter.annotations.NodeType;
import org.eclipse.jubula.client.api.converter.annotations.SrcNode;
import org.eclipse.jubula.qa.api.converter.target.rcp.RuntimeContext;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.tools.ComponentIdentifier;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@SrcNode(UUID = "4028808d1385c63a011385d70ef803a6",
         type = NodeType.TEST_CASE)
public class Ub_tbi_selectMenuEntry_byTextpath {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(Ub_tbi_selectMenuEntry_byTextpath.class);

    private RuntimeContext rtc;
    private ComponentIdentifier nn_nn_tbi;


    public Ub_tbi_selectMenuEntry_byTextpath (RuntimeContext _rtc,

        ComponentIdentifier _nn_nn_tbi
    ) {
        rtc = _rtc;

        nn_nn_tbi = _nn_nn_tbi;
    }

    public void execute(
        String TEXTPATH,
        String OPERATOR
    ) {
        AUT aut = rtc.getAUT();




        aut.execute(
            org.eclipse.jubula.toolkit.swt.SwtComponents.createToolItem(nn_nn_tbi)
                .selectMenuEntryByTextpath(
                    TEXTPATH
                    ,
                    Operator.literalAsEnum(OPERATOR)
                    ),
            null);




    }

	public void execute(String string, String string2, int i){
		// TODO Auto-generated method stub

	}
}