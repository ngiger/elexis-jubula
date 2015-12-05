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

import org.eclipse.jubula.toolkit.concrete.ConcreteComponents;
import org.eclipse.jubula.toolkit.concrete.components.ComboComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.enums.ValueSets.SearchType;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.toolkit.swt.components.ToolItem;
import org.junit.Test;

import com.google.gson.Gson;

/** @author BREDEX GmbH */
public class Patients {
	/** the logger */
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
		//testLoadFromStream();

		Views.openViewByName("Daten/Patienten");

		// Click in View Patient.Namen auswählen
		//		TextInputComponent txt = SwtComponents.createTextInputComponent(AUT_run.om.get("Patienten_SelectName_grc"));
		//		AUT_run.m_aut.execute(txt.click(new Integer(1),InteractionMode.primary), null);
		Common.synchronizedTextReplace("Patienten_SelectName_grc", familyName);//$NON-NLS-1$

		// Click create Patient
		ToolItem tbi = SwtComponents.createToolItem(AUT_run.om.get("Patient_create_tbi"));
		AUT_run.m_aut.execute(tbi.click(new Integer(1), InteractionMode.primary), null);
		AUT_run.m_aut.execute(tbi.checkEnablement(true), null);

		// Wait for create patient window
		Common.waitForWindow("Patient erfassen.*", Constants.ONE_SECOND);

		// Select sex by value
		ComboComponent choose =
			ConcreteComponents.createComboComponent(AUT_run.om.get("CreatePatient_ChooseSexe_cbx"));
		choose.selectEntryByValue("m", Operator.equals, SearchType.absolute);

		//// Enter family name
		Common.synchronizedTextReplace("CreatePatient_FamilyName_cti", familyName);//$NON-NLS-1$

		//// Enter given name
		Common.synchronizedTextReplace("CreatePatient_ChristianName_cti", firstName);//$NON-NLS-1$

		// Enter birthday
		Common.synchronizedTextReplace("CreatePatient_Birthday_cti", birthday);//$NON-NLS-1$

		// Click Okay
		Common.clickButton("CreatePatient_OkButton_grc"); //$NON-NLS-1$

		Common.waitForWindowClose("Patient erfassen.*", Constants.ONE_SECOND);
	}
}