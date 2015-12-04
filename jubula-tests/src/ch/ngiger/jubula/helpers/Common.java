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

import org.eclipse.jubula.toolkit.concrete.ConcreteComponents;
import org.eclipse.jubula.toolkit.concrete.components.ButtonComponent;
import org.eclipse.jubula.toolkit.concrete.components.TextInputComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.toolkit.swt.components.Button;
import org.eclipse.jubula.tools.ComponentIdentifier;
import org.junit.Assert;

/** @author Niklaus Giger niklaus.giger@member.fsf.org */
public class Common {

	public static void waitForElexisMainWindow(int timeoutInMs){
		waitForWindow("Elexis.*", timeoutInMs);
	}

	public static void waitForWindow(String windowTitle, int timeoutInMs){
		AUT_run.app.waitForWindowActivation(windowTitle, Operator.matches, timeoutInMs, 0);
		AUT_run.app.checkExistenceOfWindow(windowTitle, Operator.matches, true);
	}

	public static void waitForWindowClose(String windowTitle, int timeoutInMs){
		AUT_run.app.waitForWindowToClose(windowTitle, Operator.matches, timeoutInMs, 0);
		AUT_run.app.checkExistenceOfWindow(windowTitle, Operator.matches, false);
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
		AUT_run.m_aut.execute(tic.replaceText(newValue), null);
		AUT_run.m_aut.execute(tic.checkText(newValue, Operator.equals), null);
	}

}