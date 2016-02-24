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
import org.eclipse.jubula.client.exceptions.ActionException;
import org.eclipse.jubula.client.exceptions.CheckFailedException;
import org.eclipse.jubula.toolkit.concrete.ConcreteComponents;
import org.eclipse.jubula.toolkit.concrete.components.Application;
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

	private Common runner = null;

	public Perspectives(AUT aut, Application app){
		runner = new Common(aut, app);
	}

	static boolean first_leistungen = true;

	public void resetPerspective(){
		runner.openMenu("Fenster/Perspektive/Reset.*");
		runner.waitForWindow("Reset Perspective", Constants.ONE_SECOND);
		runner.clickComponent(OM.ResetPerspektive_OkButton_grc); //$NON-NLS-1$
	}

	private void fastOpenPerspectives(@SuppressWarnings("rawtypes") ComponentIdentifier cid,
		String name){
		if (runner.componentIsEnabled(cid)) {
			Utils.dbg_msg("fastOpenPerspectives: " + name + " by cid");
			runner.clickComponent(cid);
		} else {
			Utils.dbg_msg("fastOpenPerspectives: " + name + " via menu");
			openPerspectiveByName(name + ".*"); // Match (default) for Patientenübersicht
		}

	}

	public void openAbrechnungsPerspective(){
		fastOpenPerspectives(OM.Abrechnungen_tbi, "Abrechnung");
	}

	public void openAdressenPerspective(){
		fastOpenPerspectives(OM.Adressen_tbi, "Adressen");
	}

	public void openArtikelPerspective(){
		fastOpenPerspectives(OM.Artikel_tbi, "Artikel");
	}

	public void openBestellungenPerspective(){
		fastOpenPerspectives(OM.Bestellungen_tbi, "Bestellungen");
	}

	/*
	 * openLeistungenPerspective take some time the first time, as we have to
	 * create all LOINC items
	 */
	public void openLeistungenPerspective(){
		String name = "Leistungen";
		Utils
			.dbg_msg("openLeistungenPerspective: " + name + " first_leistungen is " + first_leistungen);
		if (first_leistungen) {
			Utils.dbg_msg("fastOpenPerspectives: " + name + " via menu");
			openPerspectiveByName(name + ".*"); // Match (default) for Patientenübersicht
			// Comment: Niklaus did see 110 second on his PC with PostgreSQL (2014.05.24)
			Utils.sleepMs(5 * Constants.ONE_SECOND);
			runner.waitForWindowClose(".*Progress.*", 120 * Constants.ONE_SECOND);
			Utils.takeScreenshotActiveWindow("Leistungen_first_time.png"); //$NON-NLS-1$
			first_leistungen = false;
		} else {
			fastOpenPerspectives(OM.Perspective_Leistungen_tbi, name);
		}

	}

	public void openPatientenPerspective(){
		fastOpenPerspectives(OM.Patientenübersicht_tbi, "Patienten");
	}

	public void openReminderPerspective(){
		fastOpenPerspectives(OM.Reminder_tbi, "Reminder");
	}

	public void openPerspectiveByName(String name){
		String localized_name = Messages.getString("VisitAllPerspectives.2");
		Utils.dbg_msg(String.format("openPerspectiveByName %s via %s", name, localized_name));
		runner.openMenu(localized_name);
		runner.waitForWindow("Open Perspective", Constants.ONE_SECOND);
		@SuppressWarnings("unchecked")
		TableComponent tbl =
			ConcreteComponents.createTableComponent(OM.OpenPerspective_ViewTree_grc);
		AUT_run.m_aut.execute(tbl.clickInComponent(new Integer(1), InteractionMode.primary,
			new Integer(50), Unit.percent, new Integer(50), Unit.percent), null);
		AUT_run.m_aut.execute(tbl.selectCell(name, Operator.matches, "1", Operator.equals,
			new Integer(1), new Integer(50), Unit.percent, new Integer(50), Unit.percent,
			ValueSets.BinaryChoice.no, InteractionMode.primary), null);
		runner.clickComponent(OM.ShowView_OkButton_grc);
	}

	/** test visiting all perspectives */
	@Test
	public void visit_all_perspectives() throws Exception{
		int j = 0;
		try {
			String window_title = Messages.getString("VisitAllPerspectives.0"); //$NON-NLS-1$
			while (true) {
				j++;
				Utils.dbg_msg("Visiting perspective number " + j); //$NON-NLS-1$
				runner.openMenu(Messages.getString("VisitAllPerspectives.2"));
				AUT_run.m_aut.execute(AUT_run.elexis.waitForWindow(window_title, Operator.matches,
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
				runner.clickComponent(OM.ShowView_OkButton_grc);

				runner.waitForWindowClose(window_title);
				runner.waitForElexisMainWindow(Constants.ONE_SECOND);
				Utils.takeScreenshotActiveWindow("Perspective_" + j + ".png"); //$NON-NLS-1$ //$NON-NLS-2$
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