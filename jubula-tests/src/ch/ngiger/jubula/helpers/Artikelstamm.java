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
import org.eclipse.jubula.toolkit.concrete.components.TabComponent;
import org.eclipse.jubula.toolkit.concrete.components.TableComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.enums.ValueSets.Unit;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.toolkit.swt.components.ToolItem;
import org.junit.Assert;

/** @author Niklaus Giger niklaus.giger@member.fsf.org */
public class Artikelstamm {
	static public String checkDefaultArtiketlstamm(String filename){
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

	@SuppressWarnings("unchecked")
	static public void importArtikelstamm(String filename){
		filename = checkDefaultArtiketlstamm(filename);
		File stamm = new File(filename);
		Assert.assertTrue("Stamm must exist and be readable: " + stamm.getAbsolutePath(), //$NON-NLS-1$
			stamm.canRead());

		Perspectives.openPerspectiveByName("Artikel");
		Common.waitForElexisMainWindow(Constants.ONE_SECOND);
		Perspectives.resetPerspective();

		AUT_run.dbg_msg("Importing " + stamm.getAbsolutePath()); //$NON-NLS-1$
		AUT_run.takeScreenshotActiveWindow("import_artikelstamm/p_artikel.png"); //$NON-NLS-1$
		TabComponent ctab = SwtComponents.createTabComponent(AUT_run.om.get("CTab_Artikel")); //$NON-NLS-1$
		AUT_run.m_aut.execute(ctab.selectTabByValue("Artikelstamm", Operator.equals), null);

		ToolItem toolbarMenu = SwtComponents.createToolItem(AUT_run.om.get("Artikelstamm_ToolbarMenu"));

		AUT_run.takeScreenshotActiveWindow("import_artikelstamm/tab_artikel.png"); //$NON-NLS-1$
		Common.sleep1second();
		AUT_run.m_aut.execute(toolbarMenu.selectContextMenuEntryByTextpath("Import.*", Operator.matches,
			InteractionMode.primary), null);
		String import_name = "Datenimport";
		Common.waitForWindow(import_name, Constants.ONE_SECOND);

		Common.synchronizedTextReplace("Artikelstamm_import_file", stamm.getAbsolutePath()); //$NON-NLS-1$
		AUT_run.takeScreenshotActiveWindow("import_artikelstamm/" + stamm.getName() + ".png"); //$NON-NLS-1$

		Common.clickButton("CreatePatient_OkButton_grc"); //$NON-NLS-1$
		// Importing the artikelstamm may take a long time
		Common.waitForWindowClose(import_name, 120 * Constants.ONE_SECOND);
		/*
				// Check Artikel_import_already_imported_ok_btn
				new Ub_grc_checkExistence(
				        rtc,
				        rtc.getIdentifier("Artikel_import_already_imported_ok_btn")
				    ).execute(
				        false
				    );
		*/

		/* Got: window "Problem Occurred" with text
			Fehler beim Einlesen der Import-Datei
			javax.xml.bind.UnmarshalException
			 - with linked exception:
			[org.xml.sax.SAXParseException; lineNumber: 2; columnNumber: 188; cvc-elt.1: Deklaration des Elements 'ARTIKELSTAMM' kann nicht gefunden werden.]
		 */
		// Common.waitForWindow("Problem Occurred", 5 * Constants.ONE_SECOND);

		Common.waitForElexisMainWindow(5 * Constants.ONE_SECOND);
		AUT_run.takeScreenshotActiveWindow("import_artikelstamm/Artikelstamm_Import_done.png"); //$NON-NLS-1$

		// Enter Aspirin to search
		Common.synchronizedTextReplace("Artikelstamm_Bezeichung_txt", "Aspirin"); //$NON-NLS-1$

		// Refresh Artikelstamm
		Common.clickButton("Artikelstamm_refresh_btn"); //$NON-NLS-1$

		// Give Elexis some time to show the drug
		Common.sleep1second();

		// Select first article
		TableComponent artTabl =
			ConcreteComponents.createTableComponent(AUT_run.om.get("Artikelstamm_Table_1_tbl"));
		AUT_run.m_aut.execute(artTabl.clickInComponent(new Integer(1), InteractionMode.primary,
			new Integer(50), Unit.percent, new Integer(50), Unit.percent), null);

		// TODO: get value of article and debug it
		AUT_run.m_aut.execute(artTabl.checkText(".*Aspirin.*", Operator.matches), null);
		AUT_run.takeScreenshotActiveWindow("import_artikelstamm/Artikelstamm_Aspirin.png"); //$NON-NLS-1$
	}

}