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

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.List;

import org.eclipse.jubula.client.exceptions.ActionException;
import org.eclipse.jubula.toolkit.base.components.GraphicsComponent;
import org.eclipse.jubula.toolkit.concrete.ConcreteComponents;
import org.eclipse.jubula.toolkit.concrete.components.ComboComponent;
import org.eclipse.jubula.toolkit.concrete.components.TabComponent;
import org.eclipse.jubula.toolkit.concrete.components.TableComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets.BinaryChoice;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.enums.ValueSets.SearchType;
import org.eclipse.jubula.toolkit.enums.ValueSets.Unit;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.toolkit.swt.components.ToolItem;
import org.junit.Test;

import com.google.gson.Gson;

import ch.ngiger.jubula.elexiscore.OM;

/** @author BREDEX GmbH */
public class Patients {
	/** the logger */

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

	@Test
	public static void testLoadFromStream() throws FileNotFoundException{
		FileReader input = new FileReader(new File("rsc/patients.json"));
		Gson gson = new Gson();

		try {

			System.out.println("Reading JSON from a file");
			System.out.println("----------------------------");

			BufferedReader br = new BufferedReader(new FileReader(new File("rsc/country.json")));

			// convert the json string back to object
			Country countryObj = gson.fromJson(br, Country.class);
			System.out.println("Name Of Country: " + countryObj.getName());
			System.out.println("Population: " + countryObj.getPopulation());
			System.out.println("States are :");

			List<String> listOfStates = countryObj.getListOfStates();
			for (int i = 0; i < listOfStates.size(); i++) {
				System.out.println(listOfStates.get(i));
			}

			File file = new File("rsc/patients.json");
			input = new FileReader(file);
			System.out.println("input: " + file.getAbsolutePath() + " canRead " + file.canRead());
			BufferedReader br2 = new BufferedReader(new FileReader(file));
			MockPatient mockPat = gson.fromJson(br2, MockPatient.class);
			System.out.println("Reading okay");
			System.out.println("Family: " + mockPat.getFamilyName());

		} finally {

		}

		// Read more at http://www.java2blog.com/2013/11/gson-example-read-and-write-json.html#xM7ftH2eTXJggRF5.99
		//		  MockPatient mockPat = gson.fromJson(br, FileReader.class);

		/*
		 List<String> listOfStates = countryObj.getListOfStates();
		 for (int i = 0; i < listOfStates.size(); i++) {
		  System.out.println(listOfStates.get(i));
		 }

		} catch (IOException e) {
		 e.printStackTrace();
		}
		*/
	}

	/** test visiting all views */
	@Test
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
		Perspectives.openPatientenPerspective();
		//testLoadFromStream();
		family_name = familyName;
		Views.openViewByName("Daten/Patienten");

		// Click in View Patient.Namen auswählen
		//		TextInputComponent txt = SwtComponents.createTextInputComponent(OM.Patienten_SelectName_grc);
		//		AUT_run.m_aut.execute(txt.click(new Integer(1),InteractionMode.primary), null);
		Common.synchronizedTextReplace(OM.Patienten_SelectName_grc, familyName);//$NON-NLS-1$

		// Click create Patient
		ToolItem tbi = SwtComponents.createToolItem(OM.Patient_create_tbi);
		AUT_run.m_aut.execute(tbi.checkEnablement(true), null);
		AUT_run.m_aut.execute(tbi.click(new Integer(1), InteractionMode.primary), null);

		// Wait for create patient window
		Common.waitForWindow("Patient erfassen.*");
		AUT_run.takeScreenshotActiveWindow("create_patient_a.png"); //$NON-NLS-1$ //$NON-NLS-2$

		// Select sex by value
		ComboComponent choose =
			ConcreteComponents.createComboComponent(OM.CreatePatient_ChooseSexe_cbx);
		choose.selectEntryByValue("m", Operator.equals, SearchType.absolute);

		// Enter family name
		Common.synchronizedTextReplace(OM.CreatePatient_FamilyName_cti, familyName);//$NON-NLS-1$

		// Enter given name
		Common.synchronizedTextReplace(OM.CreatePatient_ChristianName_cti, firstName);//$NON-NLS-1$

		// Enter birthday
		Common.synchronizedTextReplace(OM.CreatePatient_Birthday_cti, birthday);//$NON-NLS-1$

		// Click Okay
		Common.clickComponent(OM.CreatePatient_OkButton_grc); //$NON-NLS-1$

		AUT_run.takeScreenshotActiveWindow("create_patient_done.png"); //$NON-NLS-1$ //$NON-NLS-2$
		Common.waitForWindowClose("Patient erfassen.*");
	}

	public void selectPatient(String familyName, String first_name){
		// Enter family name
		Perspectives.openPatientenPerspective();
		Common.synchronizedTextReplace(OM.Patienten_SelectName_grc, familyName);//$NON-NLS-1$
		Common.clickInMiddleOfComponent(OM.Pat_List_tbl);
		@SuppressWarnings("unchecked")
		TableComponent tbl = ConcreteComponents.createTableComponent(OM.Pat_List_tbl);
		tbl.selectCell("1", Operator.equals, "1", Operator.equals, new Integer(1), new Integer(50),
			Unit.percent, new Integer(50), Unit.percent, BinaryChoice.no, InteractionMode.primary);

		// Enter given name
		// TODO: Common.synchronizedTextReplace(OM.CreatePatient_ChristianName_cti, firstName);//$NON-NLS-1$
		tbl.selectCell("1", Operator.equals, "1", Operator.equals, new Integer(1), new Integer(50),
			Unit.percent, new Integer(50), Unit.percent, BinaryChoice.no, InteractionMode.primary);
	}

	public void selectContact(String familyName){
		// Wait for "Kontakt auswählen" window
		String window_title = "Kontakt ausw.*";
		Common.waitForWindow(window_title);

		// Enter Familie name in contact chooser
		Common.synchronizedTextReplace(OM.Kontaktauswählen_Bezeichung_1_name_txf, familyName);//$NON-NLS-1$

		Common.selectTopLeftCell(OM.Kontaktauswählen_Table_2_tbl);

		Common.sleep1second();
		Common.clickComponent(OM.SW_Available_Sites_Okay_btn); //$NON-NLS-1$

		Common.waitForWindowClose(window_title);
	}

	public void createCase(String invoice_method, String reason, String invoice_to_name,
		String invoice_number, String date){
		String window_title = ".*Neuer Fall.*";
		Perspectives.openPatientenPerspective();

		// Click in table cases
		Common.clickInMiddleOfComponent(OM.Cases_Table_1_tbl);

		// Click on Neuer Fall
		@SuppressWarnings("unchecked")
		ToolItem tbi = SwtComponents.createToolItem(OM.Cases_New_Case_tbi);
		AUT_run.m_aut.execute(tbi.checkEnablement(true), null);
		AUT_run.m_aut.execute(tbi.click(new Integer(1), InteractionMode.primary), null);

		// Wait for window "Neuer Fall"
		Common.waitForWindow(window_title);

		// TODO: Create real insurance number
		Common.synchronizedTextReplace(OM.NeuerFall_Versicherungs_Nummer_txf, invoice_number);//$NON-NLS-1$
		Common.synchronizedTextReplace(OM.NeuerFall_Text_1_txf, date);//$NON-NLS-1$ //$NON-NLS-2$
		Common.sleep1second();

		// Abrechnungsmethode auswählen
		@SuppressWarnings("unchecked")
		ComboComponent method_cbc =
			SwtComponents.createComboComponent(OM.Neuer_Fall_Abrechnungsmethode_cbc);
		AUT_run.m_aut.execute(
			method_cbc.selectEntryByValue(invoice_method, Operator.equals, SearchType.absolute),
			null);

		// Versicherungsgrund auswählen
		if (Common.componentIsEnabled(OM.Neuer_Fall_Versichicherungsgrund_cbc)) {
			@SuppressWarnings("unchecked")
			ComboComponent reason_cbc =
				SwtComponents.createComboComponent(OM.Neuer_Fall_Versichicherungsgrund_cbc);
			try {
				AUT_run.m_aut.execute(reason_cbc.selectEntryByValue(invoice_method, Operator.equals,
					SearchType.absolute), null);
			} catch (ActionException e) {
				AUT_run.dbg_msg(
					"Unable to set invoice_method" + invoice_method + " e " + e.getMessage());
			}
		}

		// Press Leistungsträger
		Common.clickComponent(OM.NeuerFall_Kostentrager_btn); //$NON-NLS-1$

		selectContact(invoice_to_name);
		AUT_run.takeScreenshotActiveWindow("create_case_done.png"); //$NON-NLS-1$

		Common.clickComponent(OM.NeuerFall_OK_btn); //$NON-NLS-1$
		Common.waitForWindowClose(window_title);
		Common.sleep1second();

	}

	/*
	 * Creates a consultation. We assume that a patient is selected and that
	 * we already selecting the corresponding case
	 * @param: date of the consultation
	 * @param: text of consultation
	 * @param: free_text in the kons_free text
	 */
	public void createConsultation(String info, String free_text){
		String second_window = "Zweite Konsultation für heute?";
		@SuppressWarnings("unchecked")
		TabComponent tab = SwtComponents.createCTabFolder(OM.CTabFolder_2_tpn);
		AUT_run.m_aut.execute(tab.selectTabByValue(".*Konsultation.*", Operator.matches), null);
		Common.sleep1second(); // Opening a consultation may take some time
		Common.clickComponent(OM.Kons_create_tbi);
		AUT_run.takeScreenshotActiveWindow("cons/create_tbi_pressed.png"); //$NON-NLS-1$

		// Create second consultation on same day
		@SuppressWarnings("unchecked")
		GraphicsComponent comp = org.eclipse.jubula.toolkit.base.AbstractComponents
			.createGraphicsComponent(OM.Konsultation_ToolItem_1_tbi);
		AUT_run.m_aut.execute(comp.selectContextMenuEntryByTextpath("Neue Konsultation",
			Operator.matches, InteractionMode.tertiary), null);

		Common.waitForWindow(second_window);
		Common.clickComponent(OM.ResetPerspektive_OkButton_grc);
		Common.waitForWindowClose(second_window);
		AUT_run.takeScreenshotActiveWindow("cons/should_have_created_kons.png"); //$NON-NLS-1$
		Common.clickComponent(OM.Kons_Texteingabe_txf);

		// Enter kons free text
		Common.synchronizedTextReplace(OM.Kons_Texteingabe_txf, info);
		Common.waitForComponent(OM.Kons_Freitext_txt);
		Common.clickComponent(OM.Kons_Freitext_txt);
		Common.synchronizedTextReplace(OM.Kons_Freitext_txt, free_text);
		Common.clickComponent(OM.CreatePatient_OkButton_grc);
		Common.waitForElexisMainWindow();
		AUT_run.takeScreenshotActiveWindow("cons/kons_done.png"); //$NON-NLS-1$

		Common.clickComponent(OM.Konsfenster_Save_tbi);

	}

	/*
	 * We assume an open consultation
	 */
	public void eigenleistungVerrechnen(String item){
		Common.clickComponent(OM.Kons_Verrechnung_grc);
		// Common.clickComponent(OM.Patientenübersicht_tbi);
		Common.openMenu("Fenster/Ansicht/Leistungen");
		Eigenleistung.selectEigenleistung(item);
		Common.selectTopLeftCell(OM.Eigenleistung_Alle_Table_1_tbl);
		Common.dragTopLeftCell(OM.Eigenleistung_Alle_Table_1_tbl);
		Common.dropIntoMiddleOfComponent(OM.Kons_Verrechnung_table);
		Common.clickComponent(OM.Kons_Texteingabe_txf);
		AUT_run.takeScreenshotActiveWindow("cons/kons_eigenleistung.png"); //$NON-NLS-1$
	}

	public void invoiceActiveConsultation(){

		@SuppressWarnings("unchecked")
		GraphicsComponent comp = org.eclipse.jubula.toolkit.base.AbstractComponents
			.createGraphicsComponent(OM.Cases_Table_1_tbl);
		comp.selectContextMenuEntryByTextpath("Rechnung erstellen.*", Operator.matches,
			InteractionMode.tertiary);
	}
}
