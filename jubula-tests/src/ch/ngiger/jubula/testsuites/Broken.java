package ch.ngiger.jubula.testsuites;

import java.util.Arrays;
import java.util.List;

import org.eclipse.jubula.client.exceptions.ActionException;
import org.eclipse.jubula.client.exceptions.CheckFailedException;
import org.eclipse.jubula.toolkit.concrete.components.TextInputComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.tools.ComponentIdentifier;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import ch.ngiger.jubula.elexiscore.OM;
import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Artikelstamm;
import ch.ngiger.jubula.helpers.Common;
import ch.ngiger.jubula.helpers.Eigenleistung;
import ch.ngiger.jubula.helpers.Invoice;
import ch.ngiger.jubula.helpers.Patients;
import ch.ngiger.jubula.helpers.Perspectives;

public class Broken {

	// Here we put all test that are currently broken for one reason or another

	@BeforeClass
	public static void setup() throws Exception{
		AUT_run.setUp();
	}

	@Before
	public void restart() throws Exception{
		// AUT_run.restartApp();
	}

	@Test()
	public void testTextInput(ComponentIdentifier<TextInputComponent> cid, String char2test){
		AUT_run.dbg_msg(
			AUT_run.Keyboard_Locale.toString() + " testTextInput: " + cid + " with " + char2test);
		TextInputComponent tic = SwtComponents.createTextInputComponent(cid);
		Common.synchronizedTextReplace(cid, "", false);//$NON-NLS-1$

		for (int i = 0, n = char2test.length(); i < n; i++) {
			String tst_string = char2test.substring(i, i + 1);
			try {
				AUT_run.m_aut.execute(tic.replaceText(tst_string), null);
				AUT_run.m_aut.execute(tic.checkText(tst_string, Operator.matches), null);
			} catch (ActionException | CheckFailedException e) {
				AUT_run.dbg_msg(AUT_run.Keyboard_Locale.toString() + "  FAILED: " + i + " -> "
					+ tst_string + " " + e.getMessage());
				AUT_run.takeScreenshotActiveWindow(
					AUT_run.Keyboard_Locale.toString() + "_failed_" + tst_string + ".png");
			}
		}
	}

	@Test()
	public void test_artikelstamm_import() throws Exception{
		Perspectives.openLeistungenPerspective();
		Artikelstamm.importArtikelstamm(null);
	}

	@Test()
	public void test_drop_eigenartikel() throws Exception{
		Invoice.showInvoices("invoices/start_invoice.png");
		Assert.assertEquals(0, Invoice.getNumberOfInvoices());
		// TODO: Check that the top left cell exists
		Common.selectTopLeftCell(OM.Rechnungsübersicht_tbl);
		Perspectives.openLeistungenPerspective();
		String eigenleistung = "Meine Eigenleistung";
		Eigenleistung.createEigenleistung("mfk", eigenleistung, 5000, 8000, 10);
		Patients pat = new Patients();
		pat.createPatient("Testperson", "ArmesWesen", "31.01.1990");
		Perspectives.openPatientenPerspective();
		// We need swiss base feature to be able to invoice!
		pat.createCase("KVG", "Husten", "Testperson", "Nr. 34.56", "24.12.14");
		pat.createConsultation("Scheint ein Simulant zu sein", "Kann gut fabulieren");
		Perspectives.openLeistungenPerspective();
		// TODO: Having problem with drag/drop
		pat.eigenleistungVerrechnen(eigenleistung.substring(0, 4));
		pat.invoiceActiveConsultation();
		Invoice.showInvoices("invoices/one_item.png");
		Assert.assertEquals(1, Invoice.getNumberOfInvoices());
	}

	@Test()
	public void testStringTextInput(){
		@SuppressWarnings("unchecked")
		ComponentIdentifier<TextInputComponent> text_intput_to_use = OM.Patienten_SelectName_grc; //$NON-NLS-1$
		String normal = "01234567890 abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String extras = "+\"*%&/()=?_:;,.-<>|@#|[]{}\\";
		String problems = "äöüéàè¼{½¬€";

		List<String> myList = Arrays.asList(normal, extras, problems);
		myList.forEach(element -> testTextInput(text_intput_to_use, element));

		// We don't call synchronizedTextReplace on each element as this fails, and I don't
		// have time to debug why, as we had no problems
		myList.forEach(element -> {
			AUT_run.dbg_msg("testAllChars with string: " + element);
			Common.synchronizedTextReplace(text_intput_to_use, element, false);
		});
	}

	@AfterClass
	public static void teardown() throws Exception{
		AUT_run.dbg_msg("Broken.teardown"); //$NON-NLS-1$
		AUT_run.tearDown();
	}
}
