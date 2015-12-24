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
import org.eclipse.jubula.toolkit.concrete.components.TableComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.enums.ValueSets.Unit;
import org.eclipse.jubula.toolkit.swt.components.Table;
import org.eclipse.jubula.tools.ComponentIdentifier;
import org.junit.Assert;
import org.junit.Test;

import ch.ngiger.jubula.Messages;
import ch.ngiger.jubula.elexiscore.OM;

/** @author BREDEX GmbH */
public class Perspectives {
	static boolean first_leistungen = true;

	public static void resetPerspective(){
		Common.openMenu("Fenster/Perspektive/Reset.*");
		Common.waitForWindow("Reset Perspective", Constants.ONE_SECOND);
		Common.clickComponent(OM.ResetPerspektive_OkButton_grc); //$NON-NLS-1$
	}

	private static void fastOpenPerspectives(@SuppressWarnings("rawtypes") ComponentIdentifier cid,
		String name){
		if (Common.componentIsEnabled(cid)) {
			AUT_run.dbg_msg("fastOpenPerspectives: " + name + " by cid");
			Common.clickComponent(cid);
		} else {
			AUT_run.dbg_msg("fastOpenPerspectives: " + name + " via menu");
			Perspectives.openPerspectiveByName(name + ".*"); // Match (default) for Patientenübersicht
		}

	}

	public static void openAbrechnungsPerspective(){
		fastOpenPerspectives(OM.Abrechnungen_tbi, "Abrechnung");
	}

	public static void openAdressenPerspective(){
		fastOpenPerspectives(OM.Adressen_tbi, "Adressen");
	}

	public static void openArtikelPerspective(){
		fastOpenPerspectives(OM.Artikel_tbi, "Artikel");
	}

	public static void openBestellungenPerspective(){
		fastOpenPerspectives(OM.Bestellungen_tbi, "Bestellungen");
	}

	/*
	 * openLeistungenPerspective take some time the first time, as we have to
	 * create all LOINC items
	 */
	public static void openLeistungenPerspective(){
		String name = "Leistungen";
		AUT_run
			.dbg_msg("fastOpenPerspectives: " + name + " first_leistungen is " + first_leistungen);
		if (first_leistungen) {
			AUT_run.dbg_msg("fastOpenPerspectives: " + name + " via menu");
			Perspectives.openPerspectiveByName(name + ".*"); // Match (default) for Patientenübersicht
			// Comment: Niklaus did see 110 second on his PC with PostgreSQL (2014.05.24)
			Common.sleepMs(5 * Constants.ONE_SECOND);
			Common.waitForWindowClose(".*Progress.*", 120 * Constants.ONE_SECOND);
			AUT_run.takeScreenshotActiveWindow("Leistungen_first_time.png"); //$NON-NLS-1$
			first_leistungen = false;
		} else {
			@SuppressWarnings("rawtypes")
			ComponentIdentifier cid = OM.Perspective_Leistungen_tbi;
			if (Common.componentIsEnabled(cid)) {
				AUT_run.dbg_msg("fastOpenPerspectives: " + name + " by cid");
				Common.clickComponent(cid);
			}
		}

	}

	public static void openPatientenPerspective(){
		fastOpenPerspectives(OM.Patientenübersicht_tbi, "Patienten");
	}

	public static void openReminderPerspective(){
		fastOpenPerspectives(OM.Reminder_tbi, "Reminder");
	}

	public static void openPerspectiveByName(String name){
		String localized_name = Messages.getString("VisitAllPerspectives.2");
		AUT_run.dbg_msg(String.format("openPerspectiveByName %s via %s", name, localized_name));
		Common.openMenu(localized_name);
		Common.waitForWindow("Open Perspective", Constants.ONE_SECOND);
		@SuppressWarnings("unchecked")
		TableComponent tbl =
			ConcreteComponents.createTableComponent(OM.OpenPerspective_ViewTree_grc);
		AUT_run.m_aut.execute(tbl.clickInComponent(new Integer(1), InteractionMode.primary,
			new Integer(50), Unit.percent, new Integer(50), Unit.percent), null);
		AUT_run.m_aut.execute(tbl.selectCell(name, Operator.matches, "1", Operator.equals,
			new Integer(1), new Integer(50), Unit.percent, new Integer(50), Unit.percent,
			ValueSets.BinaryChoice.no, InteractionMode.primary), null);
		Common.clickComponent(OM.ShowView_OkButton_grc);
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
				Common.openMenu(Messages.getString("VisitAllPerspectives.2"));
				AUT_run.m_aut.execute(AUT_run.app.waitForWindow(window_title, Operator.matches,
					1000, Constants.NR_MS_WAIT_AFTER_ACTION), null);
				@SuppressWarnings({
					"unchecked"
				})
				ComponentIdentifier<Table> tbl = OM.OpenPerspective_ViewTree_grc;
				TableComponent tableComp = org.eclipse.jubula.toolkit.concrete.ConcreteComponents
					.createTableComponent(tbl);
				AUT_run.m_aut.execute(tableComp.selectCell(Integer.toString(j), Operator.equals,
					"1", //$NON-NLS-1$
					Operator.equals, new Integer(1), new Integer(50), Unit.percent, new Integer(50),
					Unit.percent, ValueSets.BinaryChoice.no, InteractionMode.primary), null);
				// TODO: We should get the name of the selected perspective
				Common.clickComponent(OM.ShowView_OkButton_grc);

				Common.waitForWindowClose(window_title);
				Common.waitForElexisMainWindow(Constants.ONE_SECOND);
				AUT_run.takeScreenshotActiveWindow("Perspective_" + j + ".png"); //$NON-NLS-1$ //$NON-NLS-2$
			}
		} catch (ActionException e) {
			if (j <= 3) {
				Assert.fail("We should have more than 3 perspectives to visit!"); //$NON-NLS-1$
			}

		} catch (CheckFailedException e) {
			e.printStackTrace();
		} finally {
			Assert.assertTrue(true);
		}
	}
}