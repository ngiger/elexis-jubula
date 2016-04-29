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
import org.eclipse.jubula.toolkit.enums.ValueSets.Modifier;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.enums.ValueSets.Unit;
import org.eclipse.jubula.toolkit.swt.components.Table;
import org.eclipse.jubula.tools.ComponentIdentifier;
import org.junit.Assert;

import ch.ngiger.jubula.Messages;
import ch.ngiger.jubula.elexiscore.OM;

/**
 * @author BREDEX GmbH
 */
public class Perspectives extends Common {

	static boolean first_leistungen = true;

	public Perspectives(AUT aut, Application app){
		super(aut, app);
		Utils.dbg_msg("Perspectives init " + m_aut + " app " + m_app);
	}

	public void resetPerspective(){
		openMenu("Fenster/Perspektive/Reset.*");
		if ( !waitForWindow("Reset Perspective", Constants.ONE_SECOND))
		{
			Assert.fail("resetPerspective: Unable to open Reset Perspective");
		}
		clickComponent(OM.ResetPerspektive_OkButton_grc); //$NON-NLS-1$
	}

	private void fastOpenPerspectives(@SuppressWarnings("rawtypes") ComponentIdentifier cid,
		String name){
		if (componentIsEnabled(cid)) {
			Utils.dbg_msg("fastOpenPerspectives: " + name + " by cid");
			clickComponent(cid);
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
		Utils.dbg_msg(
			"openLeistungenPerspective: " + name + " first_leistungen is " + first_leistungen);
		if (first_leistungen) {
			Utils.dbg_msg("fastOpenPerspectives: " + name + " via menu");
			openPerspectiveByName(name + ".*"); // Match (default) for Patientenübersicht
			// Comment: Niklaus did see 110 second on his PC with PostgreSQL (2014.05.24)
			Utils.sleepMs(5 * Constants.ONE_SECOND);
			Utils.dbg_msg("waitForWindowClose:");
			waitForWindowClose(".*Progress.*", 120 * Constants.ONE_SECOND);
			AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "Leistungen_first_time.png"); //$NON-NLS-1$
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
		openMenu(localized_name);
		if (!waitForWindow("Open Perspective", Constants.ONE_SECOND))
		{
			Assert.fail("openPerspectiveByName: Unable to open " + name);
		}
		@SuppressWarnings("unchecked")
		TableComponent tbl =
			ConcreteComponents.createTableComponent(OM.OpenPerspective_ViewTree_grc);
		AUT_run.m_aut.execute(tbl.clickInComponent(new Integer(1), InteractionMode.primary,
			new Integer(50), Unit.percent, new Integer(50), Unit.percent), null);
		AUT_run.m_aut.execute(tbl.selectCell(name, Operator.matches, "1", Operator.equals,
			new Integer(1), new Integer(50), Unit.percent, new Integer(50), Unit.percent,
			ValueSets.BinaryChoice.no, InteractionMode.primary), null);
		clickComponent(OM.ShowView_OkButton_grc);
	}

	/** test visiting all perspectives */
	public void visit_all_perspectives() throws Exception{
		int j = 0;
		try {
			String window_title = Messages.getString("VisitAllPerspectives.0"); //$NON-NLS-1$
			while (true) {
				j++;
				Utils.dbg_msg("Visiting perspective number " + j); //$NON-NLS-1$
				openMenu(Messages.getString("VisitAllPerspectives.2"));
				waitForWindow(window_title);
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
				clickComponent(OM.ShowView_OkButton_grc);

				waitForWindowClose(window_title);
				waitForElexisMainWindow(Constants.ONE_SECOND);
				AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "Perspective_" + j + ".png"); //$NON-NLS-1$ //$NON-NLS-2$
			}
		} catch (ActionException e) {
			clickComponent(OM.ShowView_OkButton_grc);
			waitForElexisMainWindow(Constants.ONE_SECOND);
			if (j <= 3) {
				Assert.fail("We should have more than 3 perspectives to visit!"); //$NON-NLS-1$
			}

		} catch (CheckFailedException e) {
			e.printStackTrace();
		} finally {
			Assert.assertTrue(true);
		}
	}

	public void initialSetup(){
		first_leistungen = true;
		closeMultipleProblems();
		// We must open Leistungen first, as this take a lot of time
		openLeistungenPerspective();
		openPatientenPerspective();
		resetPerspective();
	}

	public void closeMultipleProblems(){
		int j = 0;
		int maxTries = 15;
		while (j < maxTries)
		{
			j++;
			Utils.dbg_msg("closeMultipleProblems. Trying pressEnter " + j + " of "+maxTries + " maxTries");
			if (j % 2 == 0) {
				Utils.dbg_msg("press Escape");
				AUT_run.m_aut.execute(m_app.externalKeyCombination(new Modifier[] {}, "Escape"), null);
			} else {
				pressEnter();
			}
			if (waitForWindowClose(".*Multiple problems.*", 1000)) {
				Utils.dbg_msg("closeMultipleProblems succeeded");
				return;
			}
		}
	}

}