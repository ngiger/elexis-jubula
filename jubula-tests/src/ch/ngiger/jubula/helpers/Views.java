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

import java.util.ArrayList;
import java.util.List;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.exceptions.CheckFailedException;
import org.eclipse.jubula.toolkit.concrete.ConcreteComponents;
import org.eclipse.jubula.toolkit.concrete.components.Application;
import org.eclipse.jubula.toolkit.concrete.components.TableComponent;
import org.eclipse.jubula.toolkit.concrete.components.TextInputComponent;
import org.eclipse.jubula.toolkit.concrete.components.TreeComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets;
import org.eclipse.jubula.toolkit.enums.ValueSets.BinaryChoice;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.enums.ValueSets.SearchType;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.toolkit.swt.components.Tree;
import org.eclipse.jubula.toolkit.swt.components.TreeTable;
import org.eclipse.jubula.tools.ComponentIdentifier;
import org.junit.Assert;
import org.junit.Test;

import ch.ngiger.jubula.Messages;
import ch.ngiger.jubula.elexiscore.OM;

/** @author BREDEX GmbH */
public class Views extends Common {

	private final static String window_other = "Fenster.*/Ansicht.*/Other.*";
	@SuppressWarnings("unchecked")
	private final static TextInputComponent selViewCti =
		ConcreteComponents.createTextInputComponent(OM.ShowView_SelView_cti);
	@SuppressWarnings("unchecked")
	private final static TableComponent viewTree =
		ConcreteComponents.createTableComponent(OM.ShowView_ViewTree_grc);//$NON-NLS-1$
	@SuppressWarnings("unchecked")
	private final static TreeTable tbl2 = SwtComponents.createTreeTable(OM.ShowView_ViewTree_grc);//$NON-NLS-1$

	public Views(AUT aut, Application app){
		super(aut, app);
		Utils.dbg_msg("Views init " + m_aut + " app " + m_app);
	}

	void openViewByName(String name){
		openMenu(window_other);
		if (!waitForWindow("Show View", 5 * Constants.ONE_SECOND)) {
			Assert.fail("finishInstallSelectedSW: Unable to open Show View");
		}

		selViewCti.replaceText(name);
		tbl2.waitForComponent(Constants.ONE_SECOND, 10);
		AUT_run.m_aut.execute(viewTree.click(new Integer(1), InteractionMode.primary), null);
		AUT_run.m_aut.execute(tbl2.selectNodeByTextpath(SearchType.absolute, new Integer(0), name,
			Operator.matches, 1, InteractionMode.primary, BinaryChoice.no), null);

		clickComponent(OM.ShowView_OkButton_grc);
		Utils.sleep1second();
		waitForElexisMainWindow(Constants.ONE_SECOND);
	}


	public boolean openViewByIndex(String index){
		openMenu(window_other);
		if (!waitForWindow("Show View", 5 * Constants.ONE_SECOND)) {
			Assert.fail("finishInstallSelectedSW: Unable to open Show View");
		}

		selViewCti.replaceText(index);
		tbl2.waitForComponent(Constants.ONE_SECOND, 10);
		AUT_run.m_aut.execute(viewTree.click(new Integer(1), InteractionMode.primary), null);
		AUT_run.m_aut.execute(tbl2.selectNodeByIndexpath(SearchType.absolute,
			new Integer(0), index, new Integer(1), InteractionMode.primary,
			ValueSets.BinaryChoice.no), null);

		clickComponent(OM.ShowView_OkButton_grc);
		Utils.sleep1second();
		waitForElexisMainWindow(Constants.ONE_SECOND);
		maximixeView();
		return true;
	}

	public List<String> getAllViewIndices() {
		Utils.dbg_msg("getAllViewIndices");
		String new_pos = "first_time"; //$NON-NLS-1$ //$NON-NLS-2$
		List<String> indices = new ArrayList<>();
		openMenu(Messages.getString("VisitAllViews.7")); //$NON-NLS-1$
		waitForWindow( Messages.getString("VisitAllViews.4"));

		int major = 0, minor = 0;
		@SuppressWarnings("unchecked")
		ComponentIdentifier<Tree> tree = OM.ShowView_ViewTree_grc; //$NON-NLS-1$
		Assert.assertNotNull("ShowView_ViewTree_grc may not be null", tree);
		TreeComponent treeComp = ConcreteComponents.createTreeComponent(tree);
		while (true) {
			major++;
			minor = 1;
			while (true) {
				new_pos = Integer.toString(major) + "/" + Integer.toString(minor); //$NON-NLS-1$
				try {
					AUT_run.m_aut.execute(treeComp.checkExistenceOfNodeByIndexpath(SearchType.absolute, new Integer(0), new_pos, true), null);
					AUT_run.m_aut.execute(treeComp.selectNodeByIndexpath(SearchType.absolute,
						new Integer(0), new_pos, new Integer(1), InteractionMode.primary,
						ValueSets.BinaryChoice.no), null);
					// This does not work as it throws ActionException Operation not supported by the selected toolkit.
					// Utils.dbg_msg("value is " + Common.getTextFromCompent(OM.ShowView_ViewTree_grc));
					indices.add(new_pos);
					if (indices.size() % 10 == 0) {
						AUT_run.takeScreenshotActiveWindow(AUT_run.m_aut, AUT_run.app,
						"Views/View_" + major + "/" + minor + "_overview.png"); //$NON-NLS-1$ //$NON-NLS-2$
					}
					minor++;
				} catch (CheckFailedException e) {
					if (minor == 1 ) {
						pressEscape(); // close window
						return indices;
					}
					AUT_run.takeScreenshotActiveWindow(AUT_run.m_aut, AUT_run.app,
						"Views/View_" + major + "/" + minor + "_last.png"); //$NON-NLS-1$ //$NON-NLS-2$
					minor = -1;
					break;
				}
			}
		}
	}
	public static void visitOneview(String index) {
		Utils.dbg_msg("visiting "+index);

	}
	/** test visiting all views */
	@Test
	public void visit_all_views() throws Exception{
		List<String> indices = getAllViewIndices();
		indices.forEach((index) -> visitOneview(index));
	}
}