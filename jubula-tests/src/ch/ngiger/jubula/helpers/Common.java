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

import org.eclipse.jubula.client.exceptions.CheckFailedException;
import org.eclipse.jubula.toolkit.concrete.ConcreteComponents;
import org.eclipse.jubula.toolkit.concrete.components.ButtonComponent;
import org.eclipse.jubula.toolkit.concrete.components.MenuBarComponent;
import org.eclipse.jubula.toolkit.concrete.components.TextInputComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.Modifier;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.toolkit.swt.components.Button;
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void openMenu(String menu){
		AUT_run.m_aut.execute(
			mbr.waitForComponent(Constants.ONE_SECOND, Constants.NR_MS_WAIT_AFTER_ACTION), null);
		AUT_run.m_aut.execute(mbr.selectMenuEntryByTextpath(menu, Operator.matches), null); //$NON-NLS-1$
	}

	public static void waitForElexisMainWindow(int timeoutInMs){
		waitForWindow("Elexis.*", timeoutInMs);
	}

	public static void waitForWindow(String windowTitle, int timeoutInMs){
		AUT_run.m_aut.execute(
			AUT_run.app.waitForWindowActivation(windowTitle, Operator.matches, timeoutInMs, 0),
			null);
		AUT_run.m_aut
			.execute(AUT_run.app.checkExistenceOfWindow(windowTitle, Operator.matches, true), null);
	}

	public static void waitForWindowClose(String windowTitle, int timeoutInMs){
		AUT_run.m_aut.execute(
			AUT_run.app.waitForWindowToClose(windowTitle, Operator.matches, timeoutInMs, 0), null);
		AUT_run.m_aut.execute(
			AUT_run.app.checkExistenceOfWindow(windowTitle, Operator.matches, false), null);
	}

	public static boolean buttonIsEnabled(String id){
		// Click Okay
		@SuppressWarnings("unchecked")
		ComponentIdentifier<Button> cid = AUT_run.om.get(id);
		Assert.assertNotNull(id + " may not be null", cid); //$NON-NLS-1$
		ButtonComponent btn = ConcreteComponents.createButtonComponent(cid);
		AUT_run.m_aut.execute(btn.waitForComponent(Constants.ONE_SECOND, 0), null);
		try {
			AUT_run.m_aut.execute(btn.checkEnablement(true), null);
			return true;
		} catch (CheckFailedException e) {
			return false;
		}
	}

	public static void clickButton(String id){
		// Click Okay
		@SuppressWarnings("unchecked")
		ComponentIdentifier<Button> cid = AUT_run.om.get(id);
		Assert.assertNotNull(id + " may not be null", cid); //$NON-NLS-1$
		ButtonComponent btn = ConcreteComponents.createButtonComponent(cid);
		AUT_run.m_aut.execute(btn.waitForComponent(Constants.ONE_SECOND, 0), null);
		AUT_run.m_aut.execute(btn.click(1, InteractionMode.primary), null);
	}

	public static void synchronizedTextReplace(String id, String newValue){
		@SuppressWarnings("unchecked")
		ComponentIdentifier<TextInputComponent> cid = AUT_run.om.get(id);
		Assert.assertNotNull(id + " may not be null", cid); //$NON-NLS-1$
		TextInputComponent tic = SwtComponents.createTextInputComponent(cid);
		AUT_run.m_aut.execute(tic.waitForComponent(Constants.ONE_SECOND, 0), null);
		try {
			Thread.sleep(1000);
			AUT_run.dbg_msg("synchronizedTextReplace: " + id + " -> " + newValue);
			AUT_run.m_aut.execute(tic.replaceText(newValue), null);
			Thread.sleep(1000);
			AUT_run.m_aut.execute(tic.checkText(newValue, Operator.equals), null);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/*
	 * This is the only way I could think of by getting the value of text component, which
	 * selects the component, selects all text, copies it to the clipboard and reads the local clipboard
	 * Therefore it will fail miserably if your AUT is running on another host!
	 */
	public static String getTextFromCompent(String id){
		@SuppressWarnings("unchecked")
		ComponentIdentifier<? extends org.eclipse.jubula.toolkit.concrete.components.TextComponent> cid =
			AUT_run.om.get(id);
		Assert.assertNotNull(id + " may not be null", cid); //$NON-NLS-1$
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
		File full = new File( AUT_run.SAVE_RESULTS_DIR + "/" + filename);
		AUT_run.dbg_msg("writeStringToResultsFile: " + full.getAbsolutePath());
		try {
			PrintWriter writer = new PrintWriter(full, "UTF-8");
			writer.println(msg);
			writer.flush();
			writer.close();
		} catch (FileNotFoundException | UnsupportedEncodingException e) {}
	}

}
