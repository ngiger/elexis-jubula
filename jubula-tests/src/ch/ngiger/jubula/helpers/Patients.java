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

import java.util.List;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.exceptions.ActionException;
import org.eclipse.jubula.toolkit.concrete.ConcreteComponents;
import org.eclipse.jubula.toolkit.concrete.components.Application;
import org.eclipse.jubula.toolkit.concrete.components.ComboComponent;
import org.eclipse.jubula.toolkit.concrete.components.TableComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets.BinaryChoice;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.enums.ValueSets.SearchType;
import org.eclipse.jubula.toolkit.enums.ValueSets.Unit;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.toolkit.swt.components.ToolItem;
import org.junit.Assert;

import ch.ngiger.jubula.elexiscore.OM;

/**
 * @author BREDEX GmbH
 */
public class Patients extends Common {

	private Views views = null;
	private Perspectives perspectives = null;

	public Patients(AUT aut, Application app){
		super(aut, app);
		Utils.dbg_msg("Patients init " + m_aut + " app " + m_app);
		perspectives = new Perspectives(aut, app);
		views = new Views(aut, app);
	}

	private String family_name;

	// When using a logger the output is not shown in the maven output
	// Don't know where it disappears
	// private static Logger log = LoggerFactory.getLogger(VisitAllViews.class);
	public class Country {

		String name;
		int population;
		private List<String> listOfStates;

		//getter and setter methods

		public String getName(){
			return name;
		}

		public void setName(String name){
			this.name = name;
		}

		public int getPopulation(){
			return population;
		}

		public void setPopulation(int population){
			this.population = population;
		}

		public List<String> getListOfStates(){
			return listOfStates;
		}

		public void setListOfStates(List<String> listOfStates){
			this.listOfStates = listOfStates;
		}

	}

	public class MockPatient {
		private String familyName; // , firstName, birthDay, sex, address, plz, place;

		public String getFamilyName(){
			return familyName;
		}

		public void setFamilyName(String familiyName){
			this.familyName = familiyName;
		}
		/*
				public String getFirstName(){
					return firstName;
				}

				public void setFirstName(String firstName){
					this.firstName = firstName;
				}

				public String getBirthDay(){
					return birthDay;
				}

				public void setBirthDay(String birthDay){
					this.birthDay = birthDay;
				}

				public String getSex(){
					return sex;
				}

				public void setSex(String sex){
					this.sex = sex;
				}

				public String getAddress(){
					return address;
				}

				public void setAddress(String address){
					this.address = address;
				}

				public String getPlz(){
					return plz;
				}

				public void setPlz(String plz){
					this.plz = plz;
				}

				public String getPlace(){
					return place;
				}

				public void setPlace(String place){
					this.place = place;
				}
				*/

	}

	/** test creating a patient */
	@SuppressWarnings("unchecked")
	/*
	 * @param: runner
	 * @param: name
	 * @param: firstName
	 * @param: birthday
	 *
	 */
	public void createPatient(String familyName, String firstName, String birthday)
		throws Exception{
		perspectives.openPatientenPerspective();
		//testLoadFromStream();
		family_name = familyName;
		views.openViewByName("Daten/Patienten");

		// Click in View Patient.Namen auswählen
		//		TextInputComponent txt = SwtComponents.createTextInputComponent(OM.Patienten_SelectName_grc);
		//		AUT_run.m_aut.execute(txt.click(new Integer(1),InteractionMode.primary), null);
		synchronizedTextReplace(OM.Patienten_SelectName_grc, familyName);//$NON-NLS-1$

		// Click create Patient
		ToolItem tbi = SwtComponents.createToolItem(OM.Patient_create_tbi);
		AUT_run.m_aut.execute(tbi.checkEnablement(true), null);
		AUT_run.m_aut.execute(tbi.click(new Integer(1), InteractionMode.primary), null);

		// Wait for create patient window
		waitForWindow("Patient erfassen.*");
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "create_patient_a.png"); //$NON-NLS-1$ //$NON-NLS-2$

		// Select sex by value
		ComboComponent choose =
			ConcreteComponents.createComboComponent(OM.CreatePatient_ChooseSexe_cbx);
		choose.selectEntryByValue("m", Operator.equals, SearchType.absolute);

		// Enter family name
		synchronizedTextReplace(OM.CreatePatient_FamilyName_cti, familyName);//$NON-NLS-1$

		// Enter given name
		synchronizedTextReplace(OM.CreatePatient_ChristianName_cti, firstName);//$NON-NLS-1$

		// Enter birthday
		synchronizedTextReplace(OM.CreatePatient_Birthday_cti, birthday);//$NON-NLS-1$

		// Click Okay
		clickComponent(OM.CreatePatient_OkButton_grc); //$NON-NLS-1$

		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "create_patient_done.png"); //$NON-NLS-1$ //$NON-NLS-2$
		waitForWindowClose("Patient erfassen.*");
	}

	public void selectPatient(String familyName, String first_name){
		// Enter family name
		perspectives.openPatientenPerspective();
		synchronizedTextReplace(OM.Patienten_SelectName_grc, familyName);//$NON-NLS-1$
		clickInMiddleOfComponent(OM.Pat_List_tbl);
		@SuppressWarnings("unchecked")
		TableComponent tbl = ConcreteComponents.createTableComponent(OM.Pat_List_tbl);
		tbl.selectCell("1", Operator.equals, "1", Operator.equals, new Integer(1), new Integer(50),
			Unit.percent, new Integer(50), Unit.percent, BinaryChoice.no, InteractionMode.primary);

		// Enter given name
		// TODO: synchronizedTextReplace(OM.CreatePatient_ChristianName_cti, firstName);//$NON-NLS-1$
		tbl.selectCell("1", Operator.equals, "1", Operator.equals, new Integer(1), new Integer(50),
			Unit.percent, new Integer(50), Unit.percent, BinaryChoice.no, InteractionMode.primary);
	}

	public void selectContact(String familyName){
		// Wait for "Kontakt auswählen" window
		String window_title = "Kontakt ausw.*";
		waitForWindow(window_title);

		// Enter Familie name in contact chooser
		synchronizedTextReplace(OM.Kontaktauswählen_Bezeichung_1_name_txf, familyName);//$NON-NLS-1$

		selectTopLeftCell(OM.Kontaktauswählen_Table_2_tbl);

		Utils.sleep1second();
		clickComponent(OM.SW_Available_Sites_Okay_btn); //$NON-NLS-1$

		waitForWindowClose(window_title);
	}

	public void selectCasesWindow(){
		perspectives.openPatientenPerspective();
		// Click in table cases
		clickInMiddleOfComponent(OM.Cases_Table_1_tbl);

	}

	public void createCase(String invoice_method, String reason, String invoice_to_name,
		String invoice_number, String date){
		String window_title = ".*Neuer Fall.*";
		selectCasesWindow();

		// Click on Neuer Fall
		@SuppressWarnings("unchecked")
		ToolItem tbi = SwtComponents.createToolItem(OM.Cases_New_Case_tbi);
		AUT_run.m_aut.execute(tbi.checkEnablement(true), null);
		AUT_run.m_aut.execute(tbi.click(new Integer(1), InteractionMode.primary), null);

		// Wait for window "Neuer Fall"
		waitForWindow(window_title);

		// TODO: Create real insurance number
		synchronizedTextReplace(OM.NeuerFall_Versicherungs_Nummer_txf, invoice_number);//$NON-NLS-1$
		synchronizedTextReplace(OM.NeuerFall_Text_1_txf, date);//$NON-NLS-1$ //$NON-NLS-2$
		Utils.sleep1second();

		// Abrechnungsmethode auswählen
		@SuppressWarnings("unchecked")
		ComboComponent method_cbc =
			SwtComponents.createComboComponent(OM.Neuer_Fall_Abrechnungsmethode_cbc);
		AUT_run.m_aut.execute(
			method_cbc.selectEntryByValue(invoice_method, Operator.equals, SearchType.absolute),
			null);

		// Versicherungsgrund auswählen
		if (componentIsEnabled(OM.Neuer_Fall_Versichicherungsgrund_cbc)) {
			@SuppressWarnings("unchecked")
			ComboComponent reason_cbc =
				SwtComponents.createComboComponent(OM.Neuer_Fall_Versichicherungsgrund_cbc);
			try {
				AUT_run.m_aut.execute(reason_cbc.selectEntryByValue(invoice_method, Operator.equals,
					SearchType.absolute), null);
			} catch (ActionException e) {
				Utils.dbg_msg(
					"Unable to set invoice_method" + invoice_method + " e " + e.getMessage());
			}
		}

		// Press Leistungsträger
		clickComponent(OM.NeuerFall_Kostentrager_btn); //$NON-NLS-1$

		selectContact(invoice_to_name);
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "create_case_done.png"); //$NON-NLS-1$

		clickComponent(OM.NeuerFall_OK_btn); //$NON-NLS-1$
		waitForWindowClose(window_title);
		Utils.sleep1second();

	}

	public void selectAndClickInKonsView(){
		selectTabByValue(OM.CTabFolder_2_tpn, ".*Konsultation.*");
		Utils.sleep1second(); // Opening a consultation may take some time
	}

	/*
	 * Creates a consultation. We assume that a patient is selected and that
	 * we already selecting the corresponding case
	 * @param: date of the consultation
	 * @param: text of consultation
	 * @param: free_text in the kons_free text
	 */
	public void createConsultation(String info, String free_text){
		String second_window = "Zweite Konsultation.*";
		selectAndClickInKonsView();
		clickComponent(OM.Kons_create_tbi);
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "cons/create_tbi_pressed.png"); //$NON-NLS-1$

		// Create second consultation on same day
		contextMenuByText(OM.Konsultation_ToolItem_1_tbi, "Neue Konsultation", false);
		waitForWindow(second_window);
		clickComponent(OM.ResetPerspektive_OkButton_grc);
		waitForWindowClose(second_window);
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "cons/should_have_created_kons.png"); //$NON-NLS-1$
		clickComponent(OM.Kons_Texteingabe_txf);
		Utils.sleep1second(); // TODO: why???
		synchronizedTextReplace(OM.Kons_Texteingabe_txf, info);
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "cons/kons_10.png"); //$NON-NLS-1$

		clickComponent(OM.Kons_Diagnose_Freitext_öffnen);
		// Here I have problems at the moment
		// Enter kons free text
		clickComponent(OM.Kons_Freitext_txt);
		synchronizedTextReplace(OM.Kons_Freitext_txt, free_text);
		pressEnter();
		clickComponent(OM.CreatePatient_OkButton_grc);
		//		clickComponent(OM.Kons_Diagnose_Freitext_öffnen);

		waitForElexisMainWindow();
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "cons/kons_done.png"); //$NON-NLS-1$

		clickComponent(OM.Konsfenster_Save_tbi);

	}

	/*
	 * We assume an open consultation
	 */
	public void eigenleistungVerrechnen(Eigenleistung eigenleistung, String abbrev, String name){
		Utils.dbg_msg("eigenleistungVerrechnen: " + name); //$NON-NLS-1$
		if (!componentIsEnabled(OM.Kons_Verrechnung_grc))  {
			AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "cons/eigenleistung/start.png"); //$NON-NLS-1$
			perspectives.openPatientenPerspective();
			perspectives.resetPerspective();
			AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "cons/eigenleistung/resetted.png"); //$NON-NLS-1$
			selectAndClickInKonsView();
			AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "cons/eigenleistung/in_cons_view.png"); //$NON-NLS-1$
		}

		// Clicking on Kons_Verrechnung_grc opens the perspective full
		clickComponent(OM.Kons_Verrechnung_grc);
		Utils.sleep1second();
		eigenleistung.selectEigenleistung(abbrev, name);
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "cons/eigenleistung/item.png"); //$NON-NLS-1$
		if (isEnabled(OM.Eigenleistung_Alle_Table_1_tbl)) {
			selectTopLeftCell(OM.Eigenleistung_Alle_Table_1_tbl);
		} else {
			Assert.fail("Eigenleistung_Alle_Table_1_tbl not found");

		}
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "cons/eigenleistung/item_selected.png"); //$NON-NLS-1$
		dragTopLeftCell(OM.Eigenleistung_Alle_Table_1_tbl);
		Utils.sleepMs(100); // This delay is sometimes needed, or jenkins build fail
		dropIntoMiddleOfComponent(OM.Kons_Verrechnung_table);
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "cons/eigenleistung/dropped.png"); //$NON-NLS-1$
		Utils.sleepMs(100); // This delay is sometimes needed, or jenkins build fail
		clickComponent(OM.Kons_Texteingabe_txf);
		Utils.sleepMs(100); // This delay is sometimes needed, or jenkins build fail
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "cons/eigenleistung/done.png"); //$NON-NLS-1$
	}

	public void invoiceActiveConsultation(){
		perspectives.openPatientenPerspective();
		perspectives.resetPerspective();
		selectCasesWindow();
		Utils.sleep1second();
		selectTopLeftCell(OM.Cases_Table_1_tbl);
		Utils.sleep1second();
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "cons/invoice/before_invocing.png"); //$NON-NLS-1$
		contextMenuByText(OM.Cases_Table_1_tbl, "Rechnung erstellen.*", true);
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "cons/invoice/active_done.png"); //$NON-NLS-1$
	}

	public void artikelstammItemVerrechnen(Artikelstamm artikelstamm, String item){
		if (AUT_run.isMedelexis) {
			Utils.dbg_msg("Da medelexis kein artikelstammItemVerrechnen: " + item); //$NON-NLS-1$
			return;
		}
		Utils.dbg_msg("artikelstammItemVerrechnen: " + item); //$NON-NLS-1$
		if (!componentIsEnabled(OM.Kons_Verrechnung_grc))  {
			perspectives.openPatientenPerspective();
			perspectives.resetPerspective();
			selectAndClickInKonsView();
		}
		boolean res = waitForComponent(OM.Kons_Verrechnung_grc);
		Utils.dbg_msg("Kons_Verrechnung_grc here1 ?: "+ res + " and enabled? " + componentIsEnabled(OM.Kons_Verrechnung_grc));
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "cons/artikel/start.png"); //$NON-NLS-1$
		res = waitForComponent(OM.Kons_Verrechnung_grc);
		Utils.dbg_msg("Kons_Verrechnung_grc here2 ?: "+ res + " and enabled? " + componentIsEnabled(OM.Kons_Verrechnung_grc));
		clickComponent(OM.Kons_Verrechnung_grc);

		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "cons/artikel/start2.png"); //$NON-NLS-1$
		clickComponent(OM.Kons_Verrechnung_grc);
		Utils.sleep1second();
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "cons/artikel/all_tabs.png"); //$NON-NLS-1$
		selectTabByValue(OM.CTabFolder_1_tpn, "Artikelstamm");
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "cons/artikel/selected_artikelstamm.png"); //$NON-NLS-1$
		artikelstamm.selectFirstItemMatching(item);
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "cons/artikel/before_drag_top_left.png"); //$NON-NLS-1$
		Utils.sleepMs(100); // This delay is sometimes needed, or jenkins build fail
		dragTopLeftCell(OM.Artikelstamm_Alle_Table_1_tbl);
		Utils.sleepMs(100); // This delay is sometimes needed, or jenkins build fail
		dropIntoMiddleOfComponent(OM.Kons_Verrechnung_table);
		Utils.sleepMs(100); // This delay is sometimes needed, or jenkins build fail
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "cons/artikel/after_drop.png"); //$NON-NLS-1$
		clickComponent(OM.Kons_Verrechnung_table);
		AUT_run.takeScreenshotActiveWindow(m_aut, m_app, "cons/artikel/after_click_in_rechnunstable.png"); //$NON-NLS-1$
		Utils.dbg_msg("artikelstammItemVerrechnen done: " + item); //$NON-NLS-1$
	}

	public void selectFirstPatient(){
		synchronizedTextReplace(OM.Patienten_SelectName_grc, "D'A");//$NON-NLS-1$
		synchronizedTextReplace(OM.Patienten_SelectName_grc, "");//$NON-NLS-1$
		// clickInMiddleOfComponent(OM.Patients_Filter_Name);
		clickInMiddleOfComponent(OM.Pat_List_tbl);
		@SuppressWarnings("unchecked")
		TableComponent tbl = ConcreteComponents.createTableComponent(OM.Pat_List_tbl);
		tbl.click(1, InteractionMode.primary);
		tbl.selectCell("1", Operator.equals, "1", Operator.equals, new Integer(1), new Integer(50),
			Unit.percent, new Integer(50), Unit.percent, BinaryChoice.no, InteractionMode.primary);
		tbl.click(1, InteractionMode.primary);
		tbl.selectCell("2", Operator.equals, "1", Operator.equals, new Integer(1), new Integer(50),
			Unit.percent, new Integer(50), Unit.percent, BinaryChoice.no, InteractionMode.primary);
		tbl.click(1, InteractionMode.primary);
;	}

}
