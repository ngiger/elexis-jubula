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
import org.eclipse.jubula.toolkit.concrete.ConcreteComponents;
import org.eclipse.jubula.toolkit.concrete.components.MenuBarComponent;
import org.eclipse.jubula.toolkit.concrete.components.TableComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.enums.ValueSets.Unit;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.toolkit.swt.components.Table;
import org.eclipse.jubula.tools.ComponentIdentifier;
import org.junit.Assert;
import org.junit.Test;

import ch.ngiger.jubula.Messages;

/** @author BREDEX GmbH */
public class Perspectives {

	public static void resetPerspective(){
		Common.openMenu("Fenster/Perspektive/Reset.*");
		Common.waitForWindow("Reset Perspective", Constants.ONE_SECOND);
		Common.clickButton("ResetPerspektive_OkButton_grc"); //$NON-NLS-1$
	}

	public static void openPerspectiveByName(String name){
		MenuBarComponent mbr = SwtComponents.createMenu();
		mbr.waitForComponent(Constants.ONE_SECOND, 10);

		AUT_run.m_aut.execute(
			mbr.selectMenuEntryByTextpath("Fenster/Perspektive/Other...", Operator.equals), null);
		Common.waitForWindow("Open Perspective", Constants.ONE_SECOND);

		@SuppressWarnings("unchecked")
		TableComponent tbl =
			ConcreteComponents.createTableComponent(AUT_run.om.get("OpenPerspective_ViewTree_grc"));
		AUT_run.m_aut.execute(tbl.clickInComponent(new Integer(1), InteractionMode.primary,
			new Integer(50), Unit.percent, new Integer(50), Unit.percent), null);
		AUT_run.m_aut.execute(tbl.selectCell(name, Operator.matches, "1", Operator.equals,
			new Integer(1), new Integer(50), Unit.percent, new Integer(50), Unit.percent,
			ValueSets.BinaryChoice.no, InteractionMode.primary), null);
		Common.clickButton("ShowView_OkButton_grc");
	}

	/** test visiting all perspectives */
	@Test
	public void visit_all_perspectives(AUT_run runner) throws Exception{
		int j = 0;
		try {
			String window_title = Messages.getString("VisitAllPerspectives.0"); //$NON-NLS-1$
			while (true) {
				j++;
				AUT_run.dbg_msg("Visiting perspective number " + j); //$NON-NLS-1$
				MenuBarComponent mbr = SwtComponents.createMenu();
				mbr.waitForComponent(1000, 1000);
				AUT_run.m_aut.execute(
					mbr.selectMenuEntryByTextpath(Messages.getString("VisitAllPerspectives.2"), //$NON-NLS-1$
						Operator.equals),
					null);
				AUT_run.m_aut.execute(AUT_run.app.waitForWindow(window_title, Operator.matches, 1000,
					Constants.NR_MS_WAIT_AFTER_ACTION), null);
				@SuppressWarnings({
					"unchecked", "static-access"
				})
				ComponentIdentifier<Table> tbl = runner.om.get("OpenPerspective_ViewTree_grc"); //$NON-NLS-1$
				TableComponent tableComp = org.eclipse.jubula.toolkit.concrete.ConcreteComponents
					.createTableComponent(tbl);
				AUT_run.m_aut.execute(tableComp.selectCell(Integer.toString(j), Operator.equals,
					"1", //$NON-NLS-1$
					Operator.equals, new Integer(1), new Integer(50), Unit.percent, new Integer(50),
					Unit.percent, ValueSets.BinaryChoice.no, InteractionMode.primary), null);
				// TODO: We should get the name of the selected perspective
				Common.clickButton("ShowView_OkButton_grc");

				Common.waitForWindowClose(window_title, Constants.ONE_SECOND);
				Common.waitForElexisMainWindow(Constants.ONE_SECOND);
				AUT_run.takeScreenshotActiveWindow("Perspective_" + j + ".png"); //$NON-NLS-1$ //$NON-NLS-2$
			}
		} catch (ActionException e) {
			if (j <= 3) {
				Assert.fail("We should have more than 3 perspectives to visit!"); //$NON-NLS-1$
			}

		} catch (CheckFailedException | AssertionError e) {
			e.printStackTrace();
		} finally {
			Assert.assertTrue(true);
		}
	}
}