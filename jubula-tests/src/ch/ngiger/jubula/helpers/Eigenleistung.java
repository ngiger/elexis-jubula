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
import org.junit.Assert;

import ch.ngiger.jubula.elexiscore.OM;

/**
 * @author BREDEX GmbH
 */
public class Eigenleistung extends Common {

	private Perspectives perspectives = null;

	public Eigenleistung(AUT aut, Application app){
		super(aut, app);
		perspectives = new Perspectives(aut, app);
		Utils.dbg_msg("Eigenleistung init " + m_aut + " app " + m_app);
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
		String tab_name = "Eigenleistung";
		// TODO Auto-generated method stub
		//testLoadFromStream();
		perspectives.openLeistungenPerspective();
		// perspectives.resetPerspective();
		waitForComponent(OM.CTabFolder_1_tpn);
		boolean tab_enabled = isEnabled(OM.CTabFolder_1_tpn);
		if (!tab_enabled) {
			AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "eigenleistung/ctab_not_enabled.png"); //$NON-NLS-1$
			Assert.assertTrue("Eigentleistung CTB must be enabled", tab_enabled);
		}
		// Blöcke has an umlaut
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app,
			"eigenleistung/before_selectin_bloecke.png"); //$NON-NLS-1$
		selectTabByValue(OM.CTabFolder_1_tpn, "Eigenleistung");
		clickComponent(OM.cv_ret_Eigenleistung_3_tbi);
		// clickComponent(OM.cv_ret_Block_3_tbi);

		waitForWindow(window_title);
		Utils.dbg_msg(String.format("createEigenleistung: a: %s d: %s cost %d/%d/%d", abbrev,
			description, cost, selling, time_needed));
		synchronizedTextReplace(OM.EigenleistungDialog_tKurz, abbrev);
		synchronizedTextReplace(OM.EigenleistungDialog_tName, description);
		synchronizedTextReplace(OM.EigenleistungDialog_tEK, Integer.toString(cost));
		synchronizedTextReplace(OM.EigenleistungDialog_tVK, Integer.toString(selling));
		synchronizedTextReplace(OM.EigenleistungDialog_tTime, Integer.toString(time_needed));
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "eigenleistung/create_done.png"); //$NON-NLS-1$
		pressEnter();
		waitForWindowClose(window_title);

		selectEigenleistung(abbrev, description);
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "eigenleistung/"+ abbrev+".png"); //$NON-NLS-1$ //$NON-NLS-2$
		//		selectTabByValue(OM.Eigenleistung_Table_1_tbl,description); // got: Operation not supported by the selected toolkit
		if (isEnabled(OM.Eigenleistung_Table_1_tbl)) {
			clickComponent(OM.Eigenleistung_Table_1_tbl);
			AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "eigenleistung/show.png"); //$NON-NLS-1$
		}
	}

	public void selectEigenleistung(String abbrev, String description){
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "eigenleistung/select_" + abbrev + ".png"); //$NON-NLS-1$
		selectTabByValue(OM.CTabFolder_1_tpn, "Eigenleistung");
		Utils.dbg_msg("selectEigenleistung: " + abbrev + " desc: " + description);
		if (isEnabled(OM.Eigenleistung_Code_txf)) {
			Utils.dbg_msg("selectEigenleistung: OM.Eigenleistung_Code_txf ");
			clickComponent(OM.Eigenleistung_Code_txf);
			synchronizedTextReplace(OM.Eigenleistung_Code_txf, abbrev.substring(0, 3));
			Utils.sleep1second();
		} else {
			Assert.fail("Eigenleistung_Code_txf not found");
		}
	}

}