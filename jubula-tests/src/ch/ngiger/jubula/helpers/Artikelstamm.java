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

import java.io.File;

import org.eclipse.jubula.qa.api.converter.target.rcp.RuntimeContext;
import org.eclipse.jubula.toolkit.concrete.ConcreteComponents;
import org.eclipse.jubula.toolkit.concrete.components.TableComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.Modifier;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.enums.ValueSets.Unit;
import org.junit.Assert;

import ch.ngiger.jubula.elexiscore.OM;

/** @author Niklaus Giger niklaus.giger@member.fsf.org */
public class Artikelstamm {
	static public String checkDefaultArtikelstamm(String filename){
		String full_name = filename;
		if (filename == null) {
			filename = AUT_run.class.getClassLoader()
				.getResource(RuntimeContext.DEFAULT_ARTIKELSTAMM).getPath();
			full_name = System.getProperty("user.dir") + filename;
		}
		File stamm = new File(full_name);
		Assert.assertTrue("Stamm must exist and be readable: " + full_name, //$NON-NLS-1$
			stamm.canRead());
		return full_name;
	}

	static public void selectFirstItemMatching(String item) {
		// Enter Aspirin to search
		Common.synchronizedTextReplace(OM.Artikelstamm_Bezeichung_txt, item); //$NON-NLS-1$

		// Refresh Artikelstamm
		Common.clickComponent(OM.Artikelstamm_refresh_btn); //$NON-NLS-1$

		// Give Elexis some time to show the drug
		Common.sleep1second();
		
		// Select first article
		TableComponent artTabl =
			ConcreteComponents.createTableComponent(OM.Artikelstamm_Table_1_tbl);
		AUT_run.m_aut.execute(artTabl.clickInComponent(new Integer(1), InteractionMode.primary,
			new Integer(50), Unit.percent, new Integer(50), Unit.percent), null);

		AUT_run.takeScreenshotActiveWindow("import_artikelstamm/" + item + ".png"); //$NON-NLS-1$

		String should_match = ".*" + item + ".*";
		AUT_run.m_aut.execute(artTabl.checkText(should_match, Operator.matches), null);
	}

	@SuppressWarnings("unchecked")
	static public void importArtikelstamm(String filename){
		filename = checkDefaultArtikelstamm(filename);
		File stamm = new File(filename);
		Assert.assertTrue("Stamm must exist and be readable: " + stamm.getAbsolutePath(), //$NON-NLS-1$
			stamm.canRead());

		Perspectives.openPerspectiveByName("Artikel");
		Common.waitForElexisMainWindow(Constants.ONE_SECOND);
		Perspectives.resetPerspective();

		AUT_run.dbg_msg("Importing " + stamm.getAbsolutePath()); //$NON-NLS-1$
		AUT_run.takeScreenshotActiveWindow("import_artikelstamm/p_artikel.png"); //$NON-NLS-1$
		Common.selectTabByValue(OM.CTab_Artikel, "Artikelstamm");

		AUT_run.takeScreenshotActiveWindow("import_artikelstamm/tab_artikel.png"); //$NON-NLS-1$
		Common.sleep1second();
		Common.contextMenuByText(OM.Artikelstamm_ToolbarMenu, "Import.*", false);

		String import_name = "Datenimport";
		Common.waitForWindow(import_name, Constants.ONE_SECOND);

		// Common.synchronizedTextReplace(OM.Artikelstamm_import_file, stamm.getAbsolutePath()); //$NON-NLS-1$
		// synchronizedTextReplace has problems with /
		Common.clickComponent(OM.Artikelstamm_import_file);
		AUT_run.m_aut.execute(AUT_run.app.copyTextToClipboard(stamm.getAbsolutePath()), null);
		AUT_run.m_aut.execute(AUT_run.app.externalKeyCombination(new Modifier[] {Modifier.control}, "A"), null);
		AUT_run.m_aut.execute(AUT_run.app.externalKeyCombination(new Modifier[] {Modifier.control}, "V"), null);
		AUT_run.takeScreenshotActiveWindow("import_artikelstamm/" + stamm.getName() + ".png"); //$NON-NLS-1$

		Common.clickComponent(OM.CreatePatient_OkButton_grc); //$NON-NLS-1$
		// Importing the artikelstamm may take a long time
		Common.waitForWindowClose(import_name, 120 * Constants.ONE_SECOND);
		// Common.waitForWindow("Problem Occurred", 5 * Constants.ONE_SECOND);

		Common.waitForElexisMainWindow(60 * Constants.ONE_SECOND);
		AUT_run.takeScreenshotActiveWindow("import_artikelstamm/Artikelstamm_Import_done.png"); //$NON-NLS-1$

		selectFirstItemMatching("ASPIRIN");

	}

}