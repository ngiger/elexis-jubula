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

import org.junit.Assert;

import ch.ngiger.jubula.elexiscore.OM;

/** @author BREDEX GmbH */
public class Eigenleistung extends Common {

	private Perspectives perspectives = null;
	public Eigenleistung(){
		perspectives = new Perspectives();
	}

	/*
	 * @param: abbrev abbreviated name of block
	 * @param: description full description
	 * @param: cost in cents
	 * @param: selling in cents
	 * @param: time in minutes
	 *
	 */

	public void createEigenleistung(String abbrev, String description, int cost, int selling,
		int time_needed){
		String window_title = "Eigenleistung";
		// TODO Auto-generated method stub
		//testLoadFromStream();
		perspectives.openLeistungenPerspective();
		perspectives.resetPerspective();
		waitForComponent(OM.CTabFolder_1_tpn);
		boolean tab_enabled = isEnabled(OM.CTabFolder_1_tpn);
		if (!tab_enabled) {
			Utils.takeScreenshotActiveWindow("eigenleistung/ctab_not_enabled.png"); //$NON-NLS-1$
			Assert.assertTrue("Eigentleistung CTB must be enabled", tab_enabled);
		}
		// Blöcke has an umlaut
		Utils.takeScreenshotActiveWindow("eigenleistung/before_selectin_bloecke.png"); //$NON-NLS-1$
		selectTabByValue(OM.CTabFolder_1_tpn, "Bl.cke");
		clickComponent(OM.Blöcke_EigeneLeistungenhinzufügen_btn);

		waitForWindow(window_title);
		Utils.dbg_msg(String.format("createEigenleistung: a: %s d: %s cost %d/%d/%d", abbrev,
			description, cost, selling, time_needed));
		synchronizedTextReplace(OM.Eigenleistung_Text_1_txf, description);
		synchronizedTextReplace(OM.Eigenleistung_Text_2_txf, abbrev);
		synchronizedTextReplace(OM.Eigenleistung_Text_3_txf, Integer.toString(cost));
		synchronizedTextReplace(OM.Eigenleistung_Text_4_txf, Integer.toString(selling));
		synchronizedTextReplace(OM.Eigenleistung_Text_5_txf, Integer.toString(time_needed));
		Utils.takeScreenshotActiveWindow("eigenleistung/create_done.png"); //$NON-NLS-1$
		pressEnter();
		waitForWindowClose(window_title);

		selectEigenleistung(description);
		Utils.takeScreenshotActiveWindow("eigenleistung/3_chars.png"); //$NON-NLS-1$
		selectTabByValue(OM.Eigenleistung_Table_1_tbl,description);
		Utils.takeScreenshotActiveWindow("eigenleistung/show.png"); //$NON-NLS-1$
	}

	public void selectEigenleistung(String description){
		selectTabByValue(OM.CTabFolder_1_tpn, "Eigenleistung");
		synchronizedTextReplace(OM.Eigenleistung_Code_txf, description.substring(0, 3));
	}

}