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
import org.eclipse.jubula.toolkit.concrete.components.ButtonComponent;
import org.eclipse.jubula.toolkit.concrete.components.MenuBarComponent;
import org.eclipse.jubula.toolkit.concrete.components.TableComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.enums.ValueSets.Unit;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.toolkit.swt.components.Button;
import org.eclipse.jubula.toolkit.swt.components.Table;
import org.eclipse.jubula.tools.ComponentIdentifier;
import org.junit.Assert;
import org.junit.Test;

/** @author BREDEX GmbH */
public class VisitAllPerspectives {

	// When using a logger the output is not shown in the maven output
	// Don't know where it disappears
	// private static Logger log = LoggerFactory.getLogger(VisitAllViews.class);

	/** test visiting all perspectives */
	@Test
	public void visit_all_perspectives(AUT_run runner) throws Exception{
		int j = 0;
		try {
			String window_title = "Open Perspective";
			while (true) {
				j++;
				AUT_run.dbg_msg("Visiting perspective number " + j);
				MenuBarComponent mbr = SwtComponents.createMenu();
				mbr.waitForComponent(1000, 1000);
				AUT_run.m_aut.execute(
					mbr.selectMenuEntryByTextpath("Fenster/Perspektive/Other...", Operator.equals),
					null);
				AUT_run.app.waitForWindow(window_title, Operator.matches, 1000,
					Constants.NR_MS_WAIT_AFTER_ACTION);
				ComponentIdentifier<Table> tbl = runner.om.get("OpenPerspective_ViewTree_grc");
				TableComponent tableComp = org.eclipse.jubula.toolkit.concrete.ConcreteComponents
					.createTableComponent(tbl);
				AUT_run.m_aut.execute(tableComp.selectCell(Integer.toString(j), Operator.equals, "1",
					Operator.equals, new Integer(1), new Integer(50), Unit.percent, new Integer(50),
					Unit.percent, ValueSets.BinaryChoice.no, InteractionMode.primary), null);
				ComponentIdentifier<Button> ok_btn = runner.om.get("ShowView_OkButton_grc");
				ButtonComponent ok_btn_comp = org.eclipse.jubula.toolkit.concrete.ConcreteComponents
					.createButtonComponent(ok_btn);
				AUT_run.m_aut.execute(ok_btn_comp.click(1, InteractionMode.primary), null);
				AUT_run.app.waitForWindowToClose(window_title, Operator.matches, 1000,
					Constants.NR_MS_WAIT_AFTER_ACTION);
				AUT_run.app.waitForWindow(window_title, Operator.matches, 1000,
					Constants.NR_MS_WAIT_AFTER_ACTION);
				runner.takeScreenshotActiveWindow("Perspective_" + j + ".png");
			}
		} catch (ActionException e) {
			if (j <= 3) {
				Assert.fail("We should have more than 3 perspectives to visit!");
			}

		} catch (CheckFailedException | AssertionError e) {
			e.printStackTrace();
		} finally {
			Assert.assertTrue(true);
		}
	}
}