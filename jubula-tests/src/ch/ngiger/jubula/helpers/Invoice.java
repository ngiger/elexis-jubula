/*******************************************************************************
 * Copyright (c) 2015 BREDEX GmbH.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     BREDEX GmbH - initial API and implementation and/or initial documentation
 *******************************************************************************/
package ch.ngiger.jubula.helpers;

import ch.ngiger.jubula.elexiscore.OM;

/** @author BREDEX GmbH */
public class Invoice {
	/*
	 * Opens the view Rechnungsübersicht and takes a screenshot
	 * @param: snapshot if != null name of screenshot
	 *
	 */

	public static void showInvoices(String snapshot){
		Views.openViewByName("Abrechnung/Rechnungsübersicht.*");
		Common.maximixeView();
		if (snapshot != null) {
			AUT_run.takeScreenshotActiveWindow(snapshot);
		}
	}
	public static String getInvoicesAsString(String snapshot){
		Views.openViewByName("Abrechnung/Rechnungsübersicht.*");
		Common.clickComponent(OM.Pat_List_tbl);
		Common.contextMenuByText(OM.BillSummary_ToolItem, "Export.*", false);
		String text = Common.getClipboarAsString();
		if (snapshot != null) {
			AUT_run.takeScreenshotActiveWindow(snapshot);
		}
		AUT_run.dbg_msg("getInvoicesAsString: till EOS\n" + text + "EOS\n");
		return text;
	}

}