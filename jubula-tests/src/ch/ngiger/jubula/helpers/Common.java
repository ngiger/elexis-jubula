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

import org.eclipse.jubula.client.exceptions.ActionException;
import org.eclipse.jubula.client.exceptions.CheckFailedException;
import org.eclipse.jubula.client.exceptions.ComponentNotFoundException;
import org.eclipse.jubula.toolkit.base.components.GraphicsComponent;
import org.eclipse.jubula.toolkit.concrete.ConcreteComponents;
import org.eclipse.jubula.toolkit.concrete.components.MenuBarComponent;
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

	public static void openMenu(String menu){
		try {
			AUT_run.m_aut.execute(
				mbr.waitForComponent(Constants.ONE_SECOND * 5, Constants.NR_MS_WAIT_AFTER_ACTION),
				null);
			AUT_run.m_aut.execute(mbr.selectMenuEntryByTextpath(menu, Operator.matches), null);
		} catch (ActionException e) {
			String msg = String.format("openMenu %s after 5 second failed", menu); //$NON-NLS-1$
			AUT_run.dbg_msg(msg);
			e.printStackTrace(AUT_run.writer);
			AUT_run.takeScreenshotActiveWindow("open_menu_failed.png"); //$NON-NLS-1$
			Assert.fail(msg);
		}
	}

	public static void waitForElexisMainWindow(){
		waitForWindow("Elexis.*", Constants.ONE_SECOND);
	}

	public static void waitForElexisMainWindow(int timeoutInMs){
		waitForWindow("Elexis.*", timeoutInMs);
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

	public static void waitForWindow(String window_title){
		waitForWindow(window_title, Constants.ONE_SECOND);
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

	public static boolean waitForComponent(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		try {
			@SuppressWarnings("unchecked")
			GraphicsComponent comp =
				org.eclipse.jubula.toolkit.base.AbstractComponents.createGraphicsComponent(cid);
			AUT_run.m_aut.execute(comp.waitForComponent(Constants.ONE_SECOND, 0), null);
			return true;
		} catch (ActionException | CheckFailedException | ComponentNotFoundException e) {
			String msg = String.format("waitForComponent failed. Error %s", e.getMessage());
			e.printStackTrace(AUT_run.writer);
			AUT_run.dbg_msg(msg);
			AUT_run.takeScreenshotActiveWindow("waitForComponent_failed.png");
		}
		return false;
	}

	public static void clickComponent(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		// Click Okay
		Assert.assertNotNull(cid + " may not be null", cid); //$NON-NLS-1$
		waitForComponent(cid);
		@SuppressWarnings("unchecked")
		GraphicsComponent comp =
			org.eclipse.jubula.toolkit.base.AbstractComponents.createGraphicsComponent(cid);
		AUT_run.m_aut.execute(comp.click(1, InteractionMode.primary), null);
	}

	public static void pressEnter(){
		AUT_run.dbg_msg("pressEnter");
		/*
		 * Allows to send special character like "Enter"
		 */
		AUT_run.m_aut.execute(AUT_run.app.externalKeyCombination(new Modifier[] {}, "Enter"), null);
	}

	public static void maximixeView(){
		AUT_run.dbg_msg("maximize does not work in elexis");
		/* Works only when running natively with keyboard set to de_CH, but not under xvfb
		AUT_run.m_aut.execute(AUT_run.app.externalKeyCombination(new Modifier[] {
			Modifier.none
		}, "m"), null);
		*/
	}

	public static void synchronizedTextReplace(
		@SuppressWarnings("rawtypes") ComponentIdentifier cid, String newValue){
		Assert.assertNotNull(cid + " may not be null", cid); //$NON-NLS-1$
		@SuppressWarnings("unchecked")
		TextInputComponent tic = SwtComponents.createTextInputComponent(cid);
		AUT_run.m_aut.execute(tic.waitForComponent(Constants.ONE_SECOND, 0), null);
		try {
			String changedValue = newValue.replaceAll("[^\\w\\s\\.-_]", "_"); // Stuff like üis not possible
			Thread.sleep(1000);
			AUT_run.dbg_msg(String.format("synchronizedTextReplace: %s -> %s changed %s",
				cid.toString(), newValue, changedValue));
			AUT_run.m_aut.execute(tic.replaceText(changedValue), null);
			Thread.sleep(100);
			AUT_run.m_aut.execute(tic.checkText(changedValue, Operator.equals), null);
		} catch (InterruptedException | ActionException e) {
			String msg = String.format("synchronizedTextReplace: new: %s error %s", newValue,
				e.getMessage());
			AUT_run.dbg_msg(msg);
			e.printStackTrace(AUT_run.writer);
			Assert.fail(msg);

		}
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

	public static void selectTopLeftCell(@SuppressWarnings("rawtypes") ComponentIdentifier cid){
		@SuppressWarnings("unchecked")
		TableComponent tbl = ConcreteComponents.createTableComponent(cid);
		// AUT_run.m_aut.execute(comp.click(1, InteractionMode.primary), null);
		AUT_run.m_aut.execute(tbl.selectCell("1", Operator.equals, "1", Operator.equals,
			new Integer(1), new Integer(50), Unit.percent, new Integer(50), Unit.percent,
			BinaryChoice.no, InteractionMode.primary), null);
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
	}

}
