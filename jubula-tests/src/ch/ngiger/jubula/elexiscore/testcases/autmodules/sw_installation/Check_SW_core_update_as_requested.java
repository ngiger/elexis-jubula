package ch.ngiger.jubula.elexiscore.testcases.autmodules.sw_installation;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.api.converter.annotations.NodeType;
import org.eclipse.jubula.client.api.converter.annotations.SrcNode;
import org.eclipse.jubula.qa.api.converter.target.rcp.RuntimeContext;
import org.eclipse.jubula.qa.api.converter.target.rcp.VariableStore;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SrcNode(UUID = "52b76da1c9bf4c8c80bac8103dfe8698", type = NodeType.TEST_CASE)
public class Check_SW_core_update_as_requested {

	/** the logger */
	private static Logger log = LoggerFactory.getLogger(Check_SW_core_update_as_requested.class);

	private RuntimeContext rtc;
	private boolean must_upgrade = false;

	public Check_SW_core_update_as_requested(RuntimeContext _rtc){
		rtc = _rtc;
	}

	/** The request comes from the environment variable TEST_UDF_SW_MUST_UPGRADE. Defaults to no */
	public void execute(String MUST_UPGRADE){
		if (must_upgrade) {
			AUT aut = rtc.getAUT();

			// TODO: set must_upgrade from environment variable

			// Check for Updates using ${MUST_UPGRADE}
			new SW_check_for_updates(rtc, rtc.getIdentifier("SW_update_information_ok_btn"))
				.execute("" + VariableStore.getInstance().getValue("MUST_UPGRADE") + "");
		}
	}
}