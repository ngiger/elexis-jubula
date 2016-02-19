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

import org.eclipse.jubula.client.Result;
import org.eclipse.jubula.client.exceptions.ActionException;
import org.eclipse.jubula.client.exceptions.CheckFailedException;
import org.eclipse.jubula.client.exceptions.CommunicationException;
import org.eclipse.jubula.client.exceptions.ComponentNotFoundException;
import org.eclipse.jubula.client.exceptions.ExecutionException;
import org.eclipse.jubula.toolkit.base.components.GraphicsComponent;
import org.eclipse.jubula.toolkit.concrete.ConcreteComponents;
import org.eclipse.jubula.toolkit.concrete.components.MenuBarComponent;
import org.eclipse.jubula.toolkit.concrete.components.TabComponent;
import org.eclipse.jubula.toolkit.concrete.components.TableComponent;
import org.eclipse.jubula.toolkit.concrete.components.TextInputComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets.BinaryChoice;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.Modifier;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.enums.ValueSets.Unit;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.tools.ComponentIdentifier;
import org.junit.Assert;

/** @author Niklaus Giger niklaus.giger@member.fsf.org */
public class Common {
	static MenuBarComponent mbr = SwtComponents.createMenu();

	public static void clickComponent(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		// Click Okay
		Assert.assertNotNull(cid + " may not be null", cid); //$NON-NLS-1$
		waitForComponent(cid);
		@SuppressWarnings("unchecked")
		GraphicsComponent comp =
			org.eclipse.jubula.toolkit.base.AbstractComponents.createGraphicsComponent(cid);
		AUT_run.m_aut.execute(comp.click(1, InteractionMode.primary), null);
	}

	public static void clickInMiddleOfComponent(
		@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		@SuppressWarnings("unchecked")
		GraphicsComponent comp =
			org.eclipse.jubula.toolkit.base.AbstractComponents.createGraphicsComponent(cid);
		AUT_run.m_aut.execute(comp.clickInComponent(new Integer(1), InteractionMode.primary,
			new Integer(1), Unit.percent, new Integer(50), Unit.percent), null);
	}

	public static boolean componentIsEnabled(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		// Click Okay
		Assert.assertNotNull(cid + " may not be null", cid); //$NON-NLS-1$
		@SuppressWarnings("unchecked")
		GraphicsComponent comp =
			org.eclipse.jubula.toolkit.base.AbstractComponents.createGraphicsComponent(cid);
		try {
			AUT_run.m_aut.execute(comp.waitForComponent(Constants.ONE_SECOND, 0), null);
			AUT_run.m_aut.execute(comp.checkEnablement(true), null);
			return true;
		} catch (CheckFailedException | ComponentNotFoundException e) {
			return false;
		}
	}

	public static void contextMenuByText(@SuppressWarnings("rawtypes") ComponentIdentifier cid, String menuEntry, boolean rightClick) {
		@SuppressWarnings("unchecked")
		GraphicsComponent comp = org.eclipse.jubula.toolkit.base.AbstractComponents
				.createGraphicsComponent(cid);
		InteractionMode mode = rightClick ? InteractionMode.secondary : InteractionMode.primary;
		Operator op = Operator.matches;
		try {
			 AUT_run.m_aut.execute(comp.selectContextMenuEntryByTextpath(menuEntry, op,
				 mode), null);
				String msg = String.format("Mode %s contextMenuByText %s op %s passed", mode.toString(), menuEntry, op.toString());
		} catch (ActionException | CheckFailedException | ComponentNotFoundException e) {
			String msg = String.format("Mode %s contextMenuByText %s op %s failed. Error %s", mode.toString(), menuEntry, op.toString(), e.getMessage());
			AUT_run.dbg_msg(msg);
			e.printStackTrace(AUT_run.writer);
			AUT_run.takeScreenshotActiveWindow("contextMenuByText_failed.png");
		}
	}

	public static void dragTopLeftCell(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		@SuppressWarnings("unchecked")
		TableComponent tbl = ConcreteComponents.createTableComponent(cid);
		Modifier[] modifierKeys = new Modifier[] {};
		AUT_run.m_aut.execute(
			tbl.dragCell(InteractionMode.primary, modifierKeys, "1", Operator.equals, "1",
				Operator.equals, new Integer(50), Unit.percent, new Integer(50), Unit.percent),
			null);
	}

	public static void dropIntoMiddleOfComponent(
		@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		@SuppressWarnings("unchecked")
		GraphicsComponent comp =
			org.eclipse.jubula.toolkit.base.AbstractComponents.createGraphicsComponent(cid);
		comp.drop(new Integer(50), Unit.percent, new Integer(50), Unit.percent,
			Constants.ONE_SECOND);
		 AUT_run.m_aut.execute(comp.drop(new Integer(50), Unit.percent, new Integer(50), Unit.percent,
				Constants.ONE_SECOND), null);
	}

	/*
	 * This is a clutch
	 */
	public static String getClipboarAsString(){
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
	public static String getTextFromCompent(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		@SuppressWarnings("unchecked")
		org.eclipse.jubula.toolkit.concrete.components.TextComponent tic =
			ConcreteComponents.createTextComponent(cid);
		AUT_run.m_aut.execute(tic.waitForComponent(Constants.ONE_SECOND, 0), null);
		AUT_run.m_aut.execute(tic.click(new Integer(1), InteractionMode.primary), null);
		Common.sleep1second();
		AUT_run.m_aut.execute(AUT_run.app.externalKeyCombination(new Modifier[] {
			Modifier.control
		}, "a"), null); //$NON-NLS-1$
		Common.sleep1second();
		AUT_run.m_aut.execute(AUT_run.app.externalKeyCombination(new Modifier[] {
			Modifier.control
		}, "c"), null); //$NON-NLS-1$
		return getClipboarAsString();
	}

	public static boolean isEnabled(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		Assert.assertNotNull(cid + " may not be null", cid); //$NON-NLS-1$
		waitForComponent(cid);
		Result<Object> result = null;
		@SuppressWarnings("unchecked")
		GraphicsComponent comp =
				org.eclipse.jubula.toolkit.base.AbstractComponents.createGraphicsComponent(cid);
		try {
			result = AUT_run.m_aut.execute(comp.click(1, InteractionMode.primary), null);
		} catch (ActionException e) {
			AUT_run.dbg_msg("isEnabled false as error "+ e.getMessage());
			return false;
		}
		boolean okay = result != null && result.isOK();
		AUT_run.dbg_msg("isEnabled will return "+okay);
		return okay;
	}

	public static void maximixeView(){
		AUT_run.dbg_msg("maximize does not work in elexis");
		/* Works only when running natively with keyboard set to de_CH, but not under xvfb
		AUT_run.m_aut.execute(AUT_run.app.externalKeyCombination(new Modifier[] {
			Modifier.none
		}, "m"), null);
		*/
	}

	@SuppressWarnings("rawtypes")
	public static int nrRowsInTable(ComponentIdentifier cid){
		AUT_run.dbg_msg(String.format("nrRowsInTable cid: " + cid));
		int j = 0;
		if (!Common.isEnabled(cid))
		{
			AUT_run.dbg_msg(String.format("nrRowsInTable return 0 as not enabled "));
			return 0;
		}
		try {
		Common.clickComponent(cid);
		Common.selectTopLeftCell(cid);
	} catch (ActionException | CheckFailedException | ComponentNotFoundException e) {
		String msg = String.format("nrRowsInTable j %d error %s %s ", j, e.getClass(), e.getMessage());
		System.out.println(msg);
		AUT_run.dbg_msg(msg);
		return 0;
	}
		@SuppressWarnings("unchecked")
		TableComponent tbl = ConcreteComponents.createTableComponent(cid);
		while (true) {
			try {
				AUT_run.dbg_msg("nrRowsInTable testing2 with = " + (j+1));
			AUT_run.m_aut.execute(tbl.selectCell(new Integer(j+1).toString(), Operator.equals, "1", Operator.equals,
				new Integer(1), new Integer(50), Unit.percent, new Integer(50), Unit.percent,
				BinaryChoice.no, InteractionMode.primary), null);
			} catch (ActionException | CheckFailedException | ComponentNotFoundException e) {
				String msg = String.format("nrRowsInTable j %d error %s %s ", j, e.getClass(), e.getMessage());
				System.out.println(msg);
				AUT_run.dbg_msg(msg);
				e.printStackTrace(System.out);
				e.printStackTrace(AUT_run.writer);
				return j;
			}
			j++;
		}
	}

	public static void openMenu(String menu){
		try {
			AUT_run.m_aut.execute(
				mbr.waitForComponent(Constants.ONE_SECOND * 5, Constants.NR_MS_WAIT_AFTER_ACTION),
				null);
			AUT_run.m_aut.execute(mbr.selectMenuEntryByTextpath(menu, Operator.matches), null);
		} catch (ExecutionException | CommunicationException e) {
			String msg = String.format("openMenu %s after 5 second failed", menu); //$NON-NLS-1$
			AUT_run.dbg_msg(msg);
			e.printStackTrace(AUT_run.writer);
			AUT_run.takeScreenshotActiveWindow("open_menu_failed.png"); //$NON-NLS-1$
			Assert.fail(msg);
		}
	}

	public static void pressEnter(){
		AUT_run.dbg_msg("pressEnter");
		/*
		 * Allows to send special character like "Enter"
		 */
		AUT_run.m_aut.execute(AUT_run.app.externalKeyCombination(new Modifier[] {}, "Enter"), null);
	}
	public static void selectTabByValue(@SuppressWarnings("rawtypes") ComponentIdentifier cid, String tabName) {
		@SuppressWarnings("unchecked")
		TabComponent tab = SwtComponents.createCTabFolder(cid);
		try {
			 AUT_run.m_aut.execute(tab.selectTabByValue(tabName, Operator.matches), null);
		} catch (ActionException | CheckFailedException | ComponentNotFoundException e) {
			String msg = String.format("selectTabByValue %s failed. Error %s", tabName, e.getMessage());
			AUT_run.dbg_msg(msg);
			e.printStackTrace(AUT_run.writer);
			AUT_run.takeScreenshotActiveWindow("selectTabByValue_failed.png");
		}
	}

	public static void selectTopLeftCell(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		@SuppressWarnings("unchecked")
		TableComponent tbl = ConcreteComponents.createTableComponent(cid);
		// AUT_run.m_aut.execute(comp.click(1, InteractionMode.primary), null);
		AUT_run.m_aut.execute(tbl.selectCell("1", Operator.equals, "1", Operator.equals,
			new Integer(1), new Integer(50), Unit.percent, new Integer(50), Unit.percent,
			BinaryChoice.no, InteractionMode.primary), null);
	}

	public static void sleep1second(){
		sleepMs(Constants.ONE_SECOND);
	}

	public static void sleepMs(int timoutInMs){
		try {
			Thread.sleep(timoutInMs);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	public static void synchronizedTextReplace(
		@SuppressWarnings("rawtypes") ComponentIdentifier cid, String newValue){
		synchronizedTextReplace(cid, newValue, true);
	}

	public static void synchronizedTextReplace(
		@SuppressWarnings("rawtypes") ComponentIdentifier cid, String newValue, boolean filter) {
		Assert.assertNotNull(cid + " may not be null", cid); //$NON-NLS-1$
		@SuppressWarnings("unchecked")
		TextInputComponent tic = SwtComponents.createTextInputComponent(cid);
		AUT_run.m_aut.execute(tic.waitForComponent(Constants.ONE_SECOND, 0), null);
		try {
			String changedValue = filter ? newValue.replaceAll("[^\\w\\s\\.-_/]", "_") : newValue; // Stuff like üis not possible
			Thread.sleep(100);
			AUT_run.dbg_msg(String.format("synchronizedTextReplace: %s -> %s %s",
				cid.toString(), newValue, filter ? "changed " + changedValue : " unfiltered"));
			AUT_run.m_aut.execute(tic.replaceText(changedValue), null);
			Thread.sleep(100);
			AUT_run.m_aut.execute(tic.checkText(changedValue, Operator.equals), null);
		} catch (InterruptedException | ActionException | CheckFailedException e) {
			String msg = String.format("synchronizedTextReplace: new: %s  error %s", newValue,
				e.getMessage());
			AUT_run.dbg_msg(msg);
			e.printStackTrace(AUT_run.writer);
			Assert.fail(msg);
		}

	}

	public static boolean waitForComponent(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		try {
			@SuppressWarnings("unchecked")
			GraphicsComponent comp =
				org.eclipse.jubula.toolkit.base.AbstractComponents.createGraphicsComponent(cid);
			AUT_run.m_aut.execute(comp.waitForComponent(Constants.ONE_SECOND, 0), null);
			return true;
		} catch (ActionException | CheckFailedException | ComponentNotFoundException e) {
			String msg = String.format("waitForComponent failed. Error %s", e.getMessage());
			AUT_run.dbg_msg(msg);
			e.printStackTrace(AUT_run.writer);
			AUT_run.takeScreenshotActiveWindow("waitForComponent_failed.png");
		}
		return false;
	}

	public static void waitForElexisMainWindow(){
		waitForWindow("Elexis.*", Constants.ONE_SECOND);
	}

	public static void waitForElexisMainWindow(int timeoutInMs){
		waitForWindow("Elexis.*", timeoutInMs);
	}

	public static void waitForWindow(String window_title){
		waitForWindow(window_title, Constants.ONE_SECOND);
	}

	public static void waitForWindow(String window_title, int timeoutInMs){
		try {
			AUT_run.m_aut.execute(
				AUT_run.app.waitForWindowActivation(window_title, Operator.matches, timeoutInMs, 0),
				null);
		} catch (ActionException e) {
			String msg = "waitForWindow " + window_title + " after " + timeoutInMs + " ms failed";
			AUT_run.dbg_msg(msg);
			AUT_run.takeScreenshotActiveWindow("window/wait_failed_" + window_title + ".png");
			Assert.fail(msg);
		}
	}

	public static void waitForWindowClose(String window_title){
		waitForWindowClose(window_title, Constants.ONE_SECOND);
	}

	public static void waitForWindowClose(String window_title, int timeoutInMs){
		try {
			AUT_run.m_aut.execute(
				AUT_run.app.waitForWindowToClose(window_title, Operator.matches, timeoutInMs, 0),
				null);
			AUT_run.m_aut.execute(
				AUT_run.app.checkExistenceOfWindow(window_title, Operator.matches, false), null);
		} catch (ActionException e) {
			String msg =
				"waitForWindowClose " + window_title + " after " + timeoutInMs + " ms failed";
			AUT_run.dbg_msg(msg);
			AUT_run.takeScreenshotActiveWindow("window/close_failed_" + window_title + ".png");
			Assert.fail(msg);
		}
	}
	public static void writeStringToResultsFile(String msg, String filename){
		AUT_run.dbg_msg("writeStringToResultsFile: RESULT_DIR >" + AUT_run.SAVE_RESULTS_DIR + "<");
		File full = new File(AUT_run.SAVE_RESULTS_DIR + "/" + filename);
		AUT_run.dbg_msg("writeStringToResultsFile: " + full.getAbsolutePath());
		try {
			PrintWriter writer = new PrintWriter(full, "UTF-8");
			writer.println(msg);
			writer.flush();
			writer.close();
		} catch (FileNotFoundException | UnsupportedEncodingException e) {}
	}

}
