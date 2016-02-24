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

import java.awt.HeadlessException;
import java.awt.Toolkit;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.Result;
import org.eclipse.jubula.client.exceptions.ActionException;
import org.eclipse.jubula.client.exceptions.CheckFailedException;
import org.eclipse.jubula.client.exceptions.CommunicationException;
import org.eclipse.jubula.client.exceptions.ComponentNotFoundException;
import org.eclipse.jubula.client.exceptions.ExecutionException;
import org.eclipse.jubula.communication.CAP;
import org.eclipse.jubula.toolkit.base.components.GraphicsComponent;
import org.eclipse.jubula.toolkit.concrete.ConcreteComponents;
import org.eclipse.jubula.toolkit.concrete.components.Application;
import org.eclipse.jubula.toolkit.concrete.components.MenuBarComponent;
import org.eclipse.jubula.toolkit.concrete.components.TabComponent;
import org.eclipse.jubula.toolkit.concrete.components.TableComponent;
import org.eclipse.jubula.toolkit.concrete.components.TextInputComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets.AUTActivationMethod;
import org.eclipse.jubula.toolkit.enums.ValueSets.BinaryChoice;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.Modifier;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.enums.ValueSets.Unit;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.tools.ComponentIdentifier;
import org.junit.Assert;

/**
 * @author Niklaus Giger niklaus.giger@member.fsf.org
 */
public class Common {

	static MenuBarComponent mbr = SwtComponents.createMenu();

	private AUT m_aut;
	private Application elexis;
	private Perspectives perspectives = null;

	public Common(AUT aut, Application app){
		elexis = app;
		m_aut = aut;
		perspectives = new Perspectives(aut, app);
	}

	public <T> Result<T> execute(CAP cap, T payload)
		throws ExecutionException, CommunicationException{
		return m_aut.execute(cap, payload);
	}

	public void clickComponent(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		// Click Okay
		Assert.assertNotNull(cid + " may not be null", cid); //$NON-NLS-1$
		waitForComponent(cid);
		@SuppressWarnings("unchecked")
		GraphicsComponent comp =
			org.eclipse.jubula.toolkit.base.AbstractComponents.createGraphicsComponent(cid);
		m_aut.execute(comp.click(1, InteractionMode.primary), null);
	}

	public void clickInMiddleOfComponent(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		@SuppressWarnings("unchecked")
		GraphicsComponent comp =
			org.eclipse.jubula.toolkit.base.AbstractComponents.createGraphicsComponent(cid);
		m_aut.execute(comp.clickInComponent(new Integer(1), InteractionMode.primary, new Integer(1),
			Unit.percent, new Integer(50), Unit.percent), null);
	}

	public boolean componentIsEnabled(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		// Click Okay
		Assert.assertNotNull(cid + " may not be null", cid); //$NON-NLS-1$
		@SuppressWarnings("unchecked")
		GraphicsComponent comp =
			org.eclipse.jubula.toolkit.base.AbstractComponents.createGraphicsComponent(cid);
		try {
			m_aut.execute(comp.waitForComponent(Constants.ONE_SECOND, 0), null);
			m_aut.execute(comp.checkEnablement(true), null);
			return true;
		} catch (CheckFailedException | ComponentNotFoundException e) {
			return false;
		}
	}

	public void contextMenuByText(@SuppressWarnings("rawtypes") ComponentIdentifier cid,
		String menuEntry, boolean rightClick){
		@SuppressWarnings("unchecked")
		GraphicsComponent comp =
			org.eclipse.jubula.toolkit.base.AbstractComponents.createGraphicsComponent(cid);
		InteractionMode mode = rightClick ? InteractionMode.secondary : InteractionMode.primary;
		Operator op = Operator.matches;
		try {
			m_aut.execute(comp.selectContextMenuEntryByTextpath(menuEntry, op, mode), null);
			String msg = String.format("Mode %s contextMenuByText %s op %s passed", mode.toString(),
				menuEntry, op.toString());
			Utils.dbg_msg(msg);
		} catch (ActionException | CheckFailedException | ComponentNotFoundException e) {
			String msg = String.format("Mode %s contextMenuByText %s op %s failed. Error %s",
				mode.toString(), menuEntry, op.toString(), e.getMessage());
			Utils.dbg_msg(msg);
			e.printStackTrace(Utils.writer);
			Utils.takeScreenshotActiveWindow("contextMenuByText_failed.png");
		}
	}

	public void dragTopLeftCell(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		@SuppressWarnings("unchecked")
		TableComponent tbl = ConcreteComponents.createTableComponent(cid);
		Modifier[] modifierKeys = new Modifier[] {};
		m_aut.execute(
			tbl.dragCell(InteractionMode.primary, modifierKeys, "1", Operator.equals, "1",
				Operator.equals, new Integer(50), Unit.percent, new Integer(50), Unit.percent),
			null);
	}

	public void dropIntoMiddleOfComponent(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		@SuppressWarnings("unchecked")
		GraphicsComponent comp =
			org.eclipse.jubula.toolkit.base.AbstractComponents.createGraphicsComponent(cid);
		comp.drop(new Integer(50), Unit.percent, new Integer(50), Unit.percent,
			Constants.ONE_SECOND);
		m_aut.execute(comp.drop(new Integer(50), Unit.percent, new Integer(50), Unit.percent,
			Constants.ONE_SECOND), null);
	}

	/*
	 * This is a clutch
	 */
	public String getClipboarAsString(){
		String data = null;
		try {
			data = (String) Toolkit.getDefaultToolkit().getSystemClipboard()
				.getData(DataFlavor.stringFlavor);
		} catch (HeadlessException | UnsupportedFlavorException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return data;
	}

	/*
	 * This is the only way I could think of by getting the value of text component, which
	 * selects the component, selects all text, copies it to the clipboard and reads the local clipboard
	 * Therefore it will fail miserably if your AUT is running on another host!
	 */
	public String getTextFromCompent(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		@SuppressWarnings("unchecked")
		org.eclipse.jubula.toolkit.concrete.components.TextComponent tic =
			ConcreteComponents.createTextComponent(cid);
		m_aut.execute(tic.waitForComponent(Constants.ONE_SECOND, 0), null);
		m_aut.execute(tic.click(new Integer(1), InteractionMode.primary), null);
		Utils.sleep1second();
		m_aut.execute(elexis.externalKeyCombination(new Modifier[] {
			Modifier.control
		}, "a"), null); //$NON-NLS-1$
		Utils.sleep1second();
		m_aut.execute(elexis.externalKeyCombination(new Modifier[] {
			Modifier.control
		}, "c"), null); //$NON-NLS-1$
		return getClipboarAsString();
	}

	public boolean isEnabled(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		Assert.assertNotNull(cid + " may not be null", cid); //$NON-NLS-1$
		waitForComponent(cid);
		Result<Object> result = null;
		@SuppressWarnings("unchecked")
		GraphicsComponent comp =
			org.eclipse.jubula.toolkit.base.AbstractComponents.createGraphicsComponent(cid);
		try {
			result = m_aut.execute(comp.click(1, InteractionMode.primary), null);
		} catch (ActionException e) {
			Utils.dbg_msg("isEnabled false as error " + e.getMessage());
			return false;
		}
		boolean okay = result != null && result.isOK();
		Utils.dbg_msg("isEnabled will return " + okay);
		return okay;
	}

	public void maximixeView(){
		Utils.dbg_msg("maximize does not work in elexis");
		/* Works only when running natively with keyboard set to de_CH, but not under xvfb
		m_aut.execute(AUT_run.app.externalKeyCombination(new Modifier[] {
			Modifier.none
		}, "m"), null);
		*/
	}

	@SuppressWarnings("rawtypes")
	public int nrRowsInTable(ComponentIdentifier cid){
		Utils.dbg_msg(String.format("nrRowsInTable cid: " + cid));
		int j = 0;
		if (!isEnabled(cid)) {
			Utils.dbg_msg(String.format("nrRowsInTable return 0 as not enabled "));
			return 0;
		}
		try {
			clickComponent(cid);
			selectTopLeftCell(cid);
		} catch (ActionException | CheckFailedException | ComponentNotFoundException e) {
			String msg =
				String.format("nrRowsInTable j %d error %s %s ", j, e.getClass(), e.getMessage());
			System.out.println(msg);
			Utils.dbg_msg(msg);
			return 0;
		}
		@SuppressWarnings("unchecked")
		TableComponent tbl = ConcreteComponents.createTableComponent(cid);
		while (true) {
			try {
				Utils.dbg_msg("nrRowsInTable testing2 with = " + (j + 1));
				m_aut.execute(
					tbl.selectCell(new Integer(j + 1).toString(), Operator.equals, "1",
						Operator.equals, new Integer(1), new Integer(50), Unit.percent,
						new Integer(50), Unit.percent, BinaryChoice.no, InteractionMode.primary),
					null);
			} catch (ActionException | CheckFailedException | ComponentNotFoundException e) {
				String msg = String.format("nrRowsInTable j %d error %s %s ", j, e.getClass(),
					e.getMessage());
				System.out.println(msg);
				Utils.dbg_msg(msg);
				e.printStackTrace(System.out);
				e.printStackTrace(Utils.writer);
				return j;
			}
			j++;
		}
	}

	public void openMenu(String menu){
		try {
			m_aut.execute(
				mbr.waitForComponent(Constants.ONE_SECOND * 30, Constants.NR_MS_WAIT_AFTER_ACTION),
				null);
			m_aut.execute(mbr.selectMenuEntryByTextpath(menu, Operator.matches), null);
		} catch (ExecutionException | CommunicationException e) {
			String msg = String.format("openMenu %s after 5 second failed", menu + //$NON-NLS-1$
				" " + e.getMessage()); //$NON-NLS-1$
			Utils.dbg_msg(msg);
			e.printStackTrace(Utils.writer);
			Utils.takeScreenshotActiveWindow("open_menu_failed.png"); //$NON-NLS-1$
			Assert.fail(msg);
		}
	}

	public void pressEnter(){
		Utils.dbg_msg("pressEnter");
		/*
		 * Allows to send special character like "Enter"
		 */
		m_aut.execute(elexis.externalKeyCombination(new Modifier[] {}, "Enter"), null);
	}

	public void selectTabByValue(@SuppressWarnings("rawtypes") ComponentIdentifier cid,
		String tabName){
		@SuppressWarnings("unchecked")
		TabComponent tab = SwtComponents.createCTabFolder(cid);
		try {
			m_aut.execute(tab.selectTabByValue(tabName, Operator.matches), null);
		} catch (ActionException | CheckFailedException | ComponentNotFoundException e) {
			String msg =
				String.format("selectTabByValue %s failed. Error %s", tabName, e.getMessage());
			Utils.dbg_msg(msg);
			e.printStackTrace(Utils.writer);
			Utils.takeScreenshotActiveWindow("selectTabByValue_failed.png");
		}
	}

	public void selectTopLeftCell(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		@SuppressWarnings("unchecked")
		TableComponent tbl = ConcreteComponents.createTableComponent(cid);
		// m_aut.execute(comp.click(1, InteractionMode.primary), null);
		m_aut.execute(tbl.selectCell("1", Operator.equals, "1", Operator.equals, new Integer(1),
			new Integer(50), Unit.percent, new Integer(50), Unit.percent, BinaryChoice.no,
			InteractionMode.primary), null);
	}

	public void initialWorkWithRunFromScatch(){
		perspectives.openPatientenPerspective();
		perspectives.resetPerspective();
		// We must open Leistungen first, as this take a lot of time
		perspectives.openLeistungenPerspective();
		org.eclipse.jubula.toolkit.concrete.components.Application application =
			SwtComponents.createApplication();
		Utils.sleep1second(); // Don't know why this is needed!
		m_aut.execute(application.activate(AUTActivationMethod.titlebar), null);
	}

	public void synchronizedTextReplace(@SuppressWarnings("rawtypes") ComponentIdentifier cid,
		String newValue){
		synchronizedTextReplace(cid, newValue, true);
	}

	public void synchronizedTextReplace(@SuppressWarnings("rawtypes") ComponentIdentifier cid,
		String newValue, boolean filter){
		Assert.assertNotNull(cid + " may not be null", cid); //$NON-NLS-1$
		@SuppressWarnings("unchecked")
		TextInputComponent tic = SwtComponents.createTextInputComponent(cid);
		m_aut.execute(tic.waitForComponent(Constants.ONE_SECOND, 0), null);
		try {
			String changedValue = filter ? newValue.replaceAll("[^\\w\\s\\.-_/]", "_") : newValue; // Stuff like üis not possible
			Thread.sleep(100);
			Utils.dbg_msg(String.format("synchronizedTextReplace: %s -> %s %s", cid.toString(),
				newValue, filter ? "changed " + changedValue : " unfiltered"));
			m_aut.execute(tic.replaceText(changedValue), null);
			Thread.sleep(100);
			m_aut.execute(tic.checkText(changedValue, Operator.equals), null);
		} catch (InterruptedException | ActionException | CheckFailedException e) {
			String msg = String.format("synchronizedTextReplace: new: %s  error %s", newValue,
				e.getMessage());
			Utils.dbg_msg(msg);
			e.printStackTrace(Utils.writer);
			Assert.fail(msg);
		}

	}

	public boolean waitForComponent(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		try {
			@SuppressWarnings("unchecked")
			GraphicsComponent comp =
				org.eclipse.jubula.toolkit.base.AbstractComponents.createGraphicsComponent(cid);
			m_aut.execute(comp.waitForComponent(Constants.ONE_SECOND, 0), null);
			return true;
		} catch (ActionException | CheckFailedException | ComponentNotFoundException e) {
			String msg = String.format("waitForComponent failed. Error %s", e.getMessage());
			Utils.dbg_msg(msg);
			e.printStackTrace(Utils.writer);
			Utils.takeScreenshotActiveWindow("waitForComponent_failed.png");
		}
		return false;
	}

	public void waitForElexisMainWindow(){
		waitForWindow("Elexis.*", Constants.ONE_SECOND);
	}

	public void waitForElexisMainWindow(int timeoutInMs){
		waitForWindow("Elexis.*", timeoutInMs);
	}

	public void waitForWindow(String window_title){
		waitForWindow(window_title, Constants.ONE_SECOND);
	}

	public void waitForWindow(String window_title, int timeoutInMs){
		try {
			m_aut.execute(
				elexis.waitForWindowActivation(window_title, Operator.matches, timeoutInMs, 0),
				null);
		} catch (ActionException e) {
			String msg = "waitForWindow " + window_title + " after " + timeoutInMs + " ms failed";
			Utils.dbg_msg(msg);
			Utils.takeScreenshotActiveWindow("window/wait_failed_" + window_title + ".png");
			Assert.fail(msg);
		}
	}

	public void waitForWindowClose(String window_title){
		waitForWindowClose(window_title, Constants.ONE_SECOND);
	}

	public void waitForWindowClose(String window_title, int timeoutInMs){
		try {
			m_aut.execute(
				elexis.waitForWindowToClose(window_title, Operator.matches, timeoutInMs, 0), null);
			m_aut.execute(elexis.checkExistenceOfWindow(window_title, Operator.matches, false),
				null);
		} catch (ActionException e) {
			String msg =
				"waitForWindowClose " + window_title + " after " + timeoutInMs + " ms failed";
			Utils.dbg_msg(msg);
			Utils.takeScreenshotActiveWindow("window/close_failed_" + window_title + ".png");
			Assert.fail(msg);
		}
	}

	public void writeStringToResultsFile(String msg, String filename){
		Utils.dbg_msg("writeStringToResultsFile: RESULT_DIR >" + Utils.SAVE_RESULTS_DIR + "<");
		File full = new File(Utils.SAVE_RESULTS_DIR + "/" + filename);
		Utils.dbg_msg("writeStringToResultsFile: " + full.getAbsolutePath());
		try {
			PrintWriter writer = new PrintWriter(full, "UTF-8");
			writer.println(msg);
			writer.flush();
			writer.close();
		} catch (FileNotFoundException | UnsupportedEncodingException e) {}
	}

}
