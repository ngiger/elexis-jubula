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

import org.eclipse.jubula.client.exceptions.ActionException;
import org.eclipse.jubula.client.exceptions.CheckFailedException;
import org.eclipse.jubula.client.exceptions.ComponentNotFoundException;
import org.eclipse.jubula.toolkit.concrete.ConcreteComponents;
import org.eclipse.jubula.toolkit.concrete.components.TableComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets.BinaryChoice;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.enums.ValueSets.Unit;

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

	public static int getNumberOfInvoices(){
		int j = 0;
		AUT_run.dbg_msg("getNumberOfInvoices j = " + j);
		Common.clickComponent(OM.Rechnungsübersicht_tbl);
		Common.selectTopLeftCell(OM.Rechnungsübersicht_tbl);
		@SuppressWarnings("unchecked")
		TableComponent tbl = ConcreteComponents.createTableComponent(OM.Rechnungsübersicht_tbl);
		while (true) {
			try {
				AUT_run.dbg_msg("getNumberOfInvoices testing with = " + (j+1));
			AUT_run.m_aut.execute(tbl.selectCell(new Integer(j+1).toString(), Operator.equals, "1", Operator.equals,
				new Integer(1), new Integer(50), Unit.percent, new Integer(50), Unit.percent,
				BinaryChoice.no, InteractionMode.primary), null);
			} catch (ActionException | CheckFailedException | ComponentNotFoundException e) {
				AUT_run.dbg_msg(String.format("getNumberOfInvoices j %d error %s ", j, e.getMessage()));
				break;
			}
			j++;
		}
		AUT_run.dbg_msg("getNumberOfInvoices returning " + j);
		return j-1;
	}

}