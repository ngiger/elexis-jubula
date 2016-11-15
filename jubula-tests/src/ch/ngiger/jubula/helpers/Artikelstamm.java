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

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.toolkit.concrete.ConcreteComponents;
import org.eclipse.jubula.toolkit.concrete.components.Application;
import org.eclipse.jubula.toolkit.concrete.components.TableComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.Modifier;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.enums.ValueSets.Unit;
import org.junit.Assert;

import ch.ngiger.jubula.elexiscore.OM;

/**
 * @author Niklaus Giger niklaus.giger@member.fsf.org
 */
public class Artikelstamm extends Common {

	private Perspectives m_perspectives;

	public Artikelstamm(AUT aut, Application app, Perspectives perspectives){
		super(aut, app);
		m_perspectives = perspectives;
		Utils.dbg_msg("Artikelstamm init " + m_aut + " app " + m_app);
	}

	public String checkDefaultArtikelstamm(String filename){
		String full_name = filename;
		if (filename == null) {
			return null;
		}
		File stamm = new File(full_name);
		if (!stamm.canRead()) {
			Utils.dbg_msg("Stamm must exist and be readable: " + full_name);//$NON-NLS-1$
			return null;
		}
		return full_name;
	}

	public void selectFirstItemMatching(String item){
		// Enter Aspirin to search
		synchronizedTextReplace(OM.Artikelstamm_Bezeichung_txt, item); //$NON-NLS-1$

		// Refresh Artikelstamm
		if (componentIsEnabled(OM.Artikelstamm_ret_unknown_2_tbi))
		{
			clickComponent(OM.Artikelstamm_ret_unknown_2_tbi); //$NON-NLS-1$
		}
		if (componentIsEnabled(OM.Artikelstamm_refresh_btn))
		{
			clickComponent(OM.Artikelstamm_refresh_btn); //$NON-NLS-1$
		}

		// Give Elexis some time to show the drug
		Utils.sleep1second();

		// Select first article
		TableComponent artTabl =
			ConcreteComponents.createTableComponent(OM.Artikelstamm_Table_1_tbl);
		AUT_run.m_aut.execute(artTabl.clickInComponent(new Integer(1), InteractionMode.primary,
			new Integer(50), Unit.percent, new Integer(50), Unit.percent), null);

		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "import_artikelstamm/" + item + ".png"); //$NON-NLS-1$

		String should_match = ".*" + item + ".*";
		AUT_run.m_aut.execute(artTabl.checkText(should_match, Operator.matches), null);
	}

	public void openArtikelstammView(){
		m_perspectives.openArtikelPerspective();
		waitForElexisMainWindow(Constants.ONE_SECOND);
		selectTabByValue(OM.CTab_Artikel, "Artikelstamm");
		// Void problems with migration
		Utils.sleep1second();
		waitForElexisMainWindow(Constants.ONE_SECOND * 10);
	}

	@SuppressWarnings("unchecked")
	public boolean importArtikelstamm(String filename){
		filename = checkDefaultArtikelstamm(filename);
		if (filename == null) {
			return false;
		}
		File stamm = new File(filename);
		if (!stamm.canRead()) {
			Utils.dbg_msg("Stamm must exist and be readable: " + stamm.getAbsolutePath()); //$NON-NLS-1$
			return false;
		}
		openArtikelstammView();
		Utils.dbg_msg("Importing " + stamm.getAbsolutePath()); //$NON-NLS-1$

		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "import_artikelstamm/tab_artikel.png"); //$NON-NLS-1$
		Utils.sleep1second();
		contextMenuByText(OM.Artikelstamm_ToolbarMenu, "Import.*", false);

		String import_name = "Datenimport";
		if (!waitForWindow(import_name, Constants.ONE_SECOND))
		{
			Assert.fail("importArtikelstamm: Unable to open " + import_name);
		}

		// runner.synchronizedTextReplace(OM.Artikelstamm_import_file, stamm.getAbsolutePath()); //$NON-NLS-1$
		// synchronizedTextReplace has problems with /
		clickComponent(OM.Artikelstamm_import_file);
		AUT_run.m_aut.execute(AUT_run.app.copyTextToClipboard(stamm.getAbsolutePath()), null);
		AUT_run.m_aut.execute(AUT_run.app.externalKeyCombination(new Modifier[] {
			Modifier.control
		}, "A"), null);
		AUT_run.m_aut.execute(AUT_run.app.externalKeyCombination(new Modifier[] {
			Modifier.control
		}, "V"), null);
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app,
			"import_artikelstamm/" + stamm.getName() + ".png"); //$NON-NLS-1$

		clickComponent(OM.CreatePatient_OkButton_grc); //$NON-NLS-1$
		// Importing the artikelstamm may take a long time
		// fails at this
		Utils.sleep1second(); // Be sure that the window popped up
		// but it might be too short to be detected!
		if (!waitForElexisMainWindow(60 * Constants.ONE_SECOND))
		{
			Assert.fail("importArtikelstamm: failed");
		}
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app,
			"import_artikelstamm/Artikelstamm_Import_done.png"); //$NON-NLS-1$

		selectFirstItemMatching("ASPIRIN");
		return true;

	}

}