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

import org.eclipse.jubula.toolkit.concrete.ConcreteComponents;
import org.eclipse.jubula.toolkit.concrete.components.TabComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.junit.Test;

import ch.ngiger.jubula.elexiscore.OM;

/** @author BREDEX GmbH */
public class Eigenleistung {
	/**
	 * the logger
	 *
	 * @param i
	 */
	@Test
	@SuppressWarnings("unchecked")
	/*
	 * @param: abbrev abbreviated name of block
	 * @param: description full description
	 * @param: cost in cents
	 * @param: selling in cents
	 * @param: time in minutes
	 *
	 */

	public static void createEigenleistung(String abbrev, String description, int cost, int selling,
		int time_needed){
		String window_title = "Eigenleistung";
		// TODO Auto-generated method stub
		//testLoadFromStream();
		Perspectives.openLeistungenPerspective();
		TabComponent tab = SwtComponents.createCTabFolder(OM.CTabFolder_1_tpn);
		AUT_run.m_aut.execute(tab.checkEnablement(true), null);
		// Blöcke has an umlaut
		AUT_run.m_aut.execute(tab.selectTabByValue("Bl.cke", Operator.matches), null);
		Common.clickComponent(OM.Blöcke_EigeneLeistungenhinzufügen_btn);

		Common.waitForWindow(window_title);
		AUT_run.dbg_msg(String.format("createEigenleistung: a: %s d: %s cost %d/%d/%d", abbrev,
			description, cost, selling, time_needed));
		Common.synchronizedTextReplace(OM.Eigenleistung_Text_1_txf, description);
		Common.synchronizedTextReplace(OM.Eigenleistung_Text_2_txf, abbrev);
		Common.synchronizedTextReplace(OM.Eigenleistung_Text_3_txf, Integer.toString(cost));
		Common.synchronizedTextReplace(OM.Eigenleistung_Text_4_txf, Integer.toString(selling));
		Common.synchronizedTextReplace(OM.Eigenleistung_Text_5_txf, Integer.toString(time_needed));
		AUT_run.takeScreenshotActiveWindow("eigenleistung/create_done.png"); //$NON-NLS-1$
		Common.pressEnter();
		Common.waitForWindowClose(window_title);

		selectEigenleistung(description);
		AUT_run.takeScreenshotActiveWindow("eigenleistung/3_chars.png"); //$NON-NLS-1$
		TabComponent eigen = ConcreteComponents.createTabComponent(OM.Eigenleistung_Table_1_tbl);
		eigen.selectTabByValue(description, Operator.equals);
		AUT_run.takeScreenshotActiveWindow("eigenleistung/show.png"); //$NON-NLS-1$
	}

	public static void selectEigenleistung(String description){
		@SuppressWarnings("unchecked")
		TabComponent tab = SwtComponents.createCTabFolder(OM.CTabFolder_1_tpn);
		AUT_run.m_aut.execute(tab.selectTabByValue("Eigenleistung", Operator.matches), null);
		Common.synchronizedTextReplace(OM.Eigenleistung_Code_txf, description.substring(0, 3));
	}

}