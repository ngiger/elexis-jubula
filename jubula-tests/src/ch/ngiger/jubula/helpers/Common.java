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
import org.eclipse.jubula.toolkit.base.AbstractComponents;
import org.eclipse.jubula.toolkit.base.components.GraphicsComponent;
import org.eclipse.jubula.toolkit.concrete.ConcreteComponents;
import org.eclipse.jubula.toolkit.concrete.components.Application;
import org.eclipse.jubula.toolkit.concrete.components.MenuBarComponent;
import org.eclipse.jubula.toolkit.concrete.components.TabComponent;
import org.eclipse.jubula.toolkit.concrete.components.TableComponent;
import org.eclipse.jubula.toolkit.concrete.components.TextComponent;
import org.eclipse.jubula.toolkit.concrete.components.TextInputComponent;
import org.eclipse.jubula.toolkit.concrete.components.TreeComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets;
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

	public AUT m_aut;
	protected Application m_app;

	public Common(AUT aut, Application app){
		m_aut = aut;
		m_app = app;
		Utils.dbg_msg("Common init " + m_aut + " app " + m_app + " logging");
		m_aut.setCAPtoConsoleLogging(true);
	}

	/**
	 * Waits max 1 second for component to be present. Then clicks in the component
	 *
	 * @param: cid	a ComponentIdentifier
	 */
	@SuppressWarnings("rawtypes")
	public void clickComponent(ComponentIdentifier cid){
		Assert.assertNotNull(cid + " may not be null", cid); //$NON-NLS-1$
		waitForComponent(cid);
		@SuppressWarnings("unchecked")
		GraphicsComponent comp = AbstractComponents.createGraphicsComponent(cid);
		m_aut.execute(comp.click(1, InteractionMode.primary), null);
	}

	/**
	 * Waits max 1 second for component to be present. Then clicks in the component
	 *
	 * @param: cid	a ComponentIdentifier
	 */
	public void clickInMiddleOfComponent(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		waitForComponent(cid);
		@SuppressWarnings("unchecked")
		GraphicsComponent comp = AbstractComponents.createGraphicsComponent(cid);
		m_aut.execute(comp.clickInComponent(new Integer(1), InteractionMode.primary, new Integer(1),
			Unit.percent, new Integer(50), Unit.percent), null);
	}

	/**
	 * Waits max 1 second for component to be present. Then clicks in the top right (e.g. combo box)
	 *
	 * @param: cid	a ComponentIdentifier
	 */
	public void clickTopRightOfComponent(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		waitForComponent(cid);
		@SuppressWarnings("unchecked")
		GraphicsComponent comp = AbstractComponents.createGraphicsComponent(cid);
		m_aut.execute(comp.clickInComponent(new Integer(1), InteractionMode.primary, new Integer(99),
			Unit.percent, new Integer(1), Unit.percent), null);
	}

	public boolean componentIsEnabled(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		// Click Okay
		Assert.assertNotNull(cid + " may not be null", cid); //$NON-NLS-1$
		@SuppressWarnings("unchecked")
		GraphicsComponent comp = AbstractComponents.createGraphicsComponent(cid);
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
		GraphicsComponent comp = AbstractComponents.createGraphicsComponent(cid);
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
			e.printStackTrace(Utils.getWriter());
			AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "contextMenuByText_failed.png");
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
		GraphicsComponent comp = AbstractComponents.createGraphicsComponent(cid);
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

	/**
	 * Return the text from a Text Component.
	 *
	 * @param  ComponentIdentifier
	 *
	 * @return Text or "" if component does not support readValue()
	 */
	public static String getTextFromCompent(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		@SuppressWarnings("unchecked")
		TextComponent tic =
			ConcreteComponents.createTextComponent(cid);
		AUT_run.m_aut.execute(tic.waitForComponent(Constants.ONE_SECOND, 0), null);
		try {
			Result<Object> txt = AUT_run.m_aut.execute(tic.readValue(), null);
			return txt.getReturnValue();
		} catch (ActionException | ComponentNotFoundException e) {
			return "empty";
		}
	}

	public boolean isEnabled(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		Assert.assertNotNull(cid + " may not be null", cid); //$NON-NLS-1$
		waitForComponent(cid);
		Result<Object> result = null;
		@SuppressWarnings("unchecked")
		GraphicsComponent comp =
			AbstractComponents.createGraphicsComponent(cid);
		try {
			result = m_aut.execute(comp.click(1, InteractionMode.primary), null);
		} catch (ActionException | ComponentNotFoundException e) {
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
		*/
		 // bot.menu(IDEWorkbenchMessages.Workbench_window).menu("Maximize Active View or Editor").click();
		// Workbench action (id: "maximize", commandId: "org.eclipse.ui.window.maximizePart"): Maximize/restore the active part.
		m_aut.execute(AUT_run.app.clickInActiveWindow(2, InteractionMode.primary, new Integer(1), Unit.percent, new Integer(1), Unit.percent), null);
		// m_aut.execute(AUT_run.app.externalKeyCombination(new Modifier[] {Modifier.control}, "m"), null); // this does not work!
		// m_aut.execute(AUT_run.app.externalKeyCombination(new Modifier[] {Modifier.control}, "n"), null); // this open open view dialog
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
				Utils.dbg_msg(msg);
				return j;
			}
			j++;
		}
	}

	public boolean openMenu(String menu){
		Utils.dbg_msg(String.format("openMenu: %s %s", menu, mbr.toString())); //$NON-NLS-1$ //$NON-NLS-2$
		try {
			m_aut.execute(
				mbr.waitForComponent(Constants.ONE_SECOND * 120, Constants.NR_MS_WAIT_AFTER_ACTION),
				null);
			m_aut.execute(mbr.selectMenuEntryByTextpath(menu, Operator.matches), null);
			Utils.dbg_msg(String.format("openMenu %s done", menu)); //$NON-NLS-1$
			return true;
		} catch (ExecutionException | CommunicationException e) {
			String msg = String.format("openMenu %s after 120 second failed", menu + //$NON-NLS-1$
				" " + e.getMessage()); //$NON-NLS-1$
			Utils.dbg_msg(msg);
			e.printStackTrace(Utils.getWriter());
			AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "open_menu_failed.png"); //$NON-NLS-1$
			// Assert.fail(msg);
		}
		pressEscape();
		return false;
	}

	public void pressEscape(){
		Utils.dbg_msg("press Escape");
		AUT_run.m_aut.execute(m_app.externalKeyCombination(new Modifier[] {}, "Escape"), null);
	}

	public void pressEnter(){
		Utils.dbg_msg("pressEnter");
		m_aut.execute(m_app.externalKeyCombination(new Modifier[] {}, "Enter"), null);
	}

	/**
	 * Select a given tab, by passing the tabName as a match, e.g. Bl.cke will match Blöcke
	 * @param cid
	 * @param tabName
	 */
	public void selectTabByValue(@SuppressWarnings("rawtypes") ComponentIdentifier cid,
		String tabName){
		waitForComponent(cid);
		@SuppressWarnings("unchecked")
		TabComponent tab = SwtComponents.createCTabFolder(cid);
		try {
			m_aut.execute(tab.selectTabByValue(tabName, Operator.matches), null);
		} catch (ActionException | CheckFailedException | ComponentNotFoundException e) {
			String msg =
				String.format("selectTabByValue %s failed. Error %s", tabName, e.getMessage());
			Utils.dbg_msg(msg);
			e.printStackTrace(Utils.getWriter());
			AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "selectTabByValue_failed.png");
		}
	}

	public boolean selectTopLeftCell(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		@SuppressWarnings("unchecked")
		TableComponent tbl = ConcreteComponents.createTableComponent(cid);
		// m_aut.execute(comp.click(1, InteractionMode.primary), null);
		try {
		m_aut.execute(tbl.selectCell("1", Operator.equals, "1", Operator.equals, new Integer(1),
			new Integer(50), Unit.percent, new Integer(50), Unit.percent, BinaryChoice.no,
			InteractionMode.primary), null);
		} catch (ActionException | CheckFailedException
				| IllegalArgumentException e) {
			String msg = String.format("selectTopLeftCell:error %s", e.getMessage());
			Utils.dbg_msg(msg);
			e.printStackTrace(Utils.getWriter());
			return false;
		}
		return true;
	}

	public boolean selectTreeItem(@SuppressWarnings("rawtypes") ComponentIdentifier cid, String textpath){
		@SuppressWarnings("unchecked")
		TreeComponent tbl = ConcreteComponents.createTreeComponent(cid);
		// m_aut.execute(comp.click(1, InteractionMode.primary), null);
		try {
		m_aut.execute(tbl.selectNodeByTextpath(ValueSets.SearchType.absolute, new Integer(0), textpath, Operator.matches, new Integer(1), InteractionMode.primary, BinaryChoice.no), null);
		} catch (ActionException | CheckFailedException
				| IllegalArgumentException e) {
			String msg = String.format("selectTreeItem: error %s", e.getMessage());
			Utils.dbg_msg(msg);
			e.printStackTrace(Utils.getWriter());
			return false;
		}
		return true;
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
			Utils.dbg_msg("synchronizedTextReplace: is enabled");
			m_aut.execute(tic.checkEditability(true), null);
			Utils.dbg_msg("synchronizedTextReplace: is editable");
			String changedValue = filter ? newValue.replaceAll("[^\\w\\s\\.-_/]", "_") : newValue; // Stuff like üis not possible
			Thread.sleep(100);
			Utils.dbg_msg(String.format("synchronizedTextReplace: %s -> %s",
				newValue, filter ? "changed " + changedValue : " unfiltered"));
			m_aut.execute(tic.replaceText(changedValue), null);
			Thread.sleep(100);
			m_aut.execute(tic.checkText(changedValue, Operator.equals), null);
		} catch (InterruptedException | ActionException | CheckFailedException
				| IllegalArgumentException e) {
			String msg = String.format("synchronizedTextReplace: new: %s  error %s", newValue,
				e.getMessage());
			Utils.dbg_msg(msg);
			e.printStackTrace(Utils.getWriter());
			Assert.fail(msg);
		}

	}

	public boolean waitForComponent(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		try {
			@SuppressWarnings("unchecked")
			GraphicsComponent comp = AbstractComponents.createGraphicsComponent(cid);
			m_aut.execute(comp.waitForComponent(Constants.ONE_SECOND, 0), null);
			return true;
		} catch (ActionException | CheckFailedException | ComponentNotFoundException e) {
			String msg = String.format("waitForComponent failed. Error %s", e.getMessage());
			Utils.dbg_msg(msg);
			e.printStackTrace(Utils.getWriter());
			AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "waitForComponent_failed.png");
		}
		return false;
	}

	public boolean waitForElexisMainWindow(){
		return waitForWindow("Elexis.*", Constants.ONE_SECOND);
	}

	public boolean waitForElexisMainWindow(int timeoutInMs){
		return waitForWindow("Elexis.*", timeoutInMs);
	}

	public boolean waitForWindow(String window_title){
		return waitForWindow(window_title, Constants.ONE_SECOND);
	}

	public boolean waitForWindow(String window_title, int timeoutInMs){
		try {
			m_aut.execute(
				m_app.waitForWindowActivation(window_title, Operator.matches, timeoutInMs, 0),
				null);
			return true;
		} catch (ActionException e) {
			String msg = "waitForWindow " + window_title + " after " + timeoutInMs + " ms failed";
			Utils.dbg_msg(msg);
			AUT_run.takeScreenshotActiveWindow(m_aut, m_app,
				"window/wait_failed_" + window_title + ".png");
			return false;
		}
	}

	public boolean waitForWindowClose(String window_title){
		return waitForWindowClose(window_title, Constants.ONE_SECOND);
	}

	public boolean waitForWindowClose(String window_title, int timeoutInMs){
		try {
			Utils.dbg_msg("waitForWindowClose: "+ window_title);
			m_aut.execute(
				m_app.waitForWindowToClose(window_title, Operator.matches, timeoutInMs, 0), null);
			m_aut.execute(m_app.checkExistenceOfWindow(window_title, Operator.matches, false),
				null);
			return true;
		} catch (ActionException e) {
			String msg =
				"waitForWindowClose " + window_title + " after " + timeoutInMs + " ms failed";
			Utils.dbg_msg(msg);
			AUT_run.takeScreenshotActiveWindow(m_aut, m_app,
				"window/close_failed_" + window_title + ".png");
			return false;
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

	public boolean labelTextMatches(@SuppressWarnings("rawtypes") ComponentIdentifier cid,
		String value){
		Assert.assertNotNull(cid + " may not be null", cid); //$NON-NLS-1$
		@SuppressWarnings("unchecked")
		TextComponent lbl = SwtComponents.createLabel(cid);
		m_aut.execute(lbl.waitForComponent(Constants.ONE_SECOND, 0), null);
		try {
			Result<Object> txt = m_aut.execute(lbl.readValue(), null);
			System.out.println(txt.getReturnValue());
		Result<Object> res = m_aut.execute(lbl.checkText(value, Operator.equals), null);
			String msg = String.format("labelTextMatches: value: %s is okay. res is " + res, value);
			Utils.dbg_msg(msg);
			return true;
		} catch (ActionException | CheckFailedException
				| IllegalArgumentException e) {
			String msg = String.format("labelTextMatches: value: %s  error %s", value,
				e.getMessage());
			Utils.dbg_msg(msg);
			return false;
		}

	}

}
