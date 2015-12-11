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

/** @author BREDEX GmbH */
public class Invoice {
	/*
	 * Opens the view Rechnungsübersicht and takes a screenshot
	 * @param: snapshot if != null name of screenshot
	 *
	 */

	public static void showInvoices(String snapshot){
		Common.openMenu("Abrechnung/Rechnungsübersicht.*");
		Common.maximixeView();
		AUT_run.takeScreenshotActiveWindow(snapshot);
	}

}