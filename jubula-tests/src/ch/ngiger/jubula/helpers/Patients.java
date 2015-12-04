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
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.LinkedHashMap;
import java.util.List;

import org.eclipse.jubula.toolkit.concrete.ConcreteComponents;
import org.eclipse.jubula.toolkit.concrete.components.ComboComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets.InteractionMode;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.enums.ValueSets.SearchType;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.toolkit.swt.components.ToolItem;
import org.junit.Assert;
import org.junit.Test;
import org.yaml.snakeyaml.Yaml;

/** @author BREDEX GmbH */
public class Patients {
	/** the logger */
	// When using a logger the output is not shown in the maven output
	// Don't know where it disappears
	// private static Logger log = LoggerFactory.getLogger(VisitAllViews.class);

	private static Yaml yaml = null;

	@Test
	public static void testLoadFromStream() throws FileNotFoundException {
	    InputStream input = new FileInputStream(new File("rsc/patients.yml"));
	    Yaml yaml = new Yaml();
	    Object data = yaml.load(input);
		   System.out.println(data);
		   System.out.println(data.getClass());
		   // ArrayList
		   LinkedHashMap<String, String> hsh = (LinkedHashMap<String,String>)yaml.load(input);
		   System.out.println("before size: " +  hsh.keySet());
		   System.out.println("key ? "+hsh.containsKey("name"));
		   System.out.println("with key");
		   System.out.println("Got for  name: " + hsh.get("name"));
		   System.out.println("after");
		   hsh.forEach((k,v)->System.out.println("Item : "));
//		   hsh.forEach((k,v)->System.out.println("Item : " + k + " Count : " + v));
//	   HashMap hsh = new HashMap{"patients", "test"};
		   Yaml yaml2 = new Yaml();
		   String document = "\n- Hesperiidae\n- Papilionidae\n- Apatelodidae\n- Epiplemidae";
		   List<String> list = (List<String>) yaml2.load(document);
		   System.out.println(list);
		   list.forEach( System.out::println );
		   // data.values().forEach( System.out::println );
	    Assert.assertEquals("test", data);
	    //
	    data = yaml.load(new ByteArrayInputStream("test2".getBytes()));
	    Assert.assertEquals("test2", data);
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
	public void createPatient(String familyName, String firstName,
		String birthday) throws Exception{
	//testLoadFromStream();

		Views.openViewByName("Daten/Patienten");

        // Click in View Patient.Namen auswählen
//		TextInputComponent txt = SwtComponents.createTextInputComponent(AUT_run.om.get("Patienten_SelectName_grc"));
//		AUT_run.m_aut.execute(txt.click(new Integer(1),InteractionMode.primary), null);
		Common.synchronizedTextReplace("Patienten_SelectName_grc", familyName);//$NON-NLS-1$

        // Click create Patient
		ToolItem tbi = SwtComponents.createToolItem(AUT_run.om.get("Patient_create_tbi"));
		AUT_run.m_aut.execute(tbi.click(new Integer(1),InteractionMode.primary), null);
		AUT_run.m_aut.execute(tbi.checkEnablement(true),null);

        // Wait for create patient window
		Common.waitForWindow( "Patient erfassen.*", Constants.ONE_SECOND);

        // Select sex by value
		ComboComponent choose = ConcreteComponents.createComboComponent(AUT_run.om.get("CreatePatient_ChooseSexe_cbx"));
		choose.selectEntryByValue("m", Operator.equals, SearchType.absolute);

        //// Enter family name
		Common.synchronizedTextReplace("CreatePatient_FamilyName_cti", familyName);//$NON-NLS-1$

        //// Enter given name
		Common.synchronizedTextReplace("CreatePatient_ChristianName_cti", firstName);//$NON-NLS-1$

        // Enter birthday
		Common.synchronizedTextReplace("CreatePatient_Birthday_cti", birthday);//$NON-NLS-1$

        // Click Okay
		Common.clickButton("CreatePatient_OkButton_grc"); //$NON-NLS-1$

		AUT_run.app.waitForWindowToClose("Patient erfassen.*", Operator.matches, Constants.ONE_SECOND, 0);
	}
}