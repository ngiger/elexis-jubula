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
public class Invoice extends Common {

	private Views views = null;

	public Invoice(){
		views = new Views();
	}

	/*
	 * Opens the view Rechnungsübersicht and takes a screenshot
	 * @param: snapshot if != null name of screenshot
	 *
	 */

	public void showInvoices(String snapshot){
		views.openViewByName("Abrechnung/Rechnungsübersicht.*");
		maximixeView();
		if (snapshot != null) {
			Utils.takeScreenshotActiveWindow(snapshot);
		}
	}
	public String getInvoicesAsString(String snapshot){
		views.openViewByName("Abrechnung/Rechnungsübersicht.*");
		clickComponent(OM.Pat_List_tbl);
		contextMenuByText(OM.BillSummary_ToolItem, "Export.*", false);
		String text = getClipboarAsString();
		if (snapshot != null) {
			Utils.takeScreenshotActiveWindow(snapshot);
		}
		Utils.dbg_msg("getInvoicesAsString: till EOS\n" + text + "EOS\n");
		return text;
	}

}