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
import org.eclipse.jubula.toolkit.concrete.ConcreteComponents;
import org.eclipse.jubula.toolkit.concrete.components.Application;
import org.eclipse.jubula.toolkit.concrete.components.TableComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets.BinaryChoice;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.enums.ValueSets.Unit;

import ch.ngiger.jubula.elexiscore.OM;

/** @author BREDEX GmbH */
public class Invoice extends Common {


	public Invoice(AUT aut, Application app){
		super(aut, app);
		Utils.dbg_msg("Eigenleistung init " + m_aut + " app " + m_app);
	}

	/*
	 * Opens the view Rechnungsübersicht and takes a screenshot
	 * @param: snapshot if != null name of screenshot
	 *
	 */

	public void showInvoices(String snapshot){
		openViewByName("Abrechnung/Rechnungsübersicht.*");
		maximixeView();
		if (snapshot != null) {
			AUT_run.takeScreenshotActiveWindow(m_aut, m_app, snapshot);
		}
	}

	public String getInvoicesAsString(String snapshot){
		openViewByName("Abrechnung/Rechnungsübersicht.*");
    AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "invoice_overview_a.png");
    Utils.sleep1second();
    clickInMiddleOfComponent(OM.Bills_Overview_tbl);
	@SuppressWarnings("unchecked")
	TableComponent tbl = ConcreteComponents.createTableComponent(OM.Bills_Overview_tbl);
	tbl.click(1, InteractionMode.primary);
	tbl.selectCell("1", Operator.equals, "1", Operator.equals, new Integer(1), new Integer(50),
		Unit.percent, new Integer(50), Unit.percent, BinaryChoice.no, InteractionMode.primary);
	tbl.click(1, InteractionMode.primary);

    // clickComponent(OM.Pat_List_tbl);
    AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "invoice_overview_c.png");
    Utils.sleep1second();
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