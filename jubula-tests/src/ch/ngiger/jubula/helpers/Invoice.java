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
public class Invoice extends Common {

	private Views views = null;

	public Invoice(AUT aut, Application app){
		super(aut, app);
		views = new Views(aut, app);
		Utils.dbg_msg("Eigenleistung init " + m_aut + " app " + m_app);
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
			AUT_run.takeScreenshotActiveWindow(m_aut, m_app, snapshot);
		}
	}

	public String getInvoicesAsString(String snapshot){
		views.openViewByName("Abrechnung/Rechnungsübersicht.*");
		clickComponent(OM.Pat_List_tbl);
		contextMenuByText(OM.BillSummary_ToolItem, "Export.*", false);
		Utils.sleep1second(); // Sometimes we got an empty String
		String text = getClipboarAsString();
		if (snapshot != null) {
			AUT_run.takeScreenshotActiveWindow(m_aut, m_app, snapshot);
		}
		Utils.dbg_msg("getInvoicesAsString: till EOS\n" + text + "EOS\n");
		return text;
	}

}