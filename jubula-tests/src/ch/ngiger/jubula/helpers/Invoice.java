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

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.toolkit.concrete.components.Application;

import ch.ngiger.jubula.elexiscore.OM;

/** @author BREDEX GmbH */
public class Invoice {

	private Common runner = null;
	private Views views = null;

	public Invoice(AUT aut, Application app){
		views = new Views(aut, app);
		runner = new Common(aut, app);
	}

	/*
	 * Opens the view Rechnungsübersicht and takes a screenshot
	 * @param: snapshot if != null name of screenshot
	 *
	 */

	public void showInvoices(String snapshot){
		views.openViewByName("Abrechnung/Rechnungsübersicht.*");
		runner.maximixeView();
		if (snapshot != null) {
			Utils.takeScreenshotActiveWindow(snapshot);
		}
	}
	public String getInvoicesAsString(String snapshot){
		views.openViewByName("Abrechnung/Rechnungsübersicht.*");
		runner.clickComponent(OM.Pat_List_tbl);
		runner.contextMenuByText(OM.BillSummary_ToolItem, "Export.*", false);
		String text = runner.getClipboarAsString();
		if (snapshot != null) {
			Utils.takeScreenshotActiveWindow(snapshot);
		}
		Utils.dbg_msg("getInvoicesAsString: till EOS\n" + text + "EOS\n");
		return text;
	}

}