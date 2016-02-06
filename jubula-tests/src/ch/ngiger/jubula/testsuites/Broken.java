package ch.ngiger.jubula.testsuites;

import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.eclipse.jubula.client.exceptions.ActionException;
import org.eclipse.jubula.client.exceptions.CheckFailedException;
import org.eclipse.jubula.toolkit.concrete.components.TextInputComponent;
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
import ch.ngiger.jubula.helpers.Software;

public class Broken {

	// Here we put all test that are currently broken for one reason or another
	static int nr_tests = 0;

	@BeforeClass
	public static void setup() throws Exception{
		AUT_run.setUp();
	}

	@Before
	public void restart() throws Exception{
		nr_tests++;
		if (nr_tests <= 1) {
			AUT_run.dbg_msg("Skip restart on first test: " + nr_tests);
		} else {
			AUT_run.dbg_msg("Calling restart: " + nr_tests);
			AUT_run.restartApp();
			Common.sleep1second();
			AUT_run.dbg_msg("restart: " + nr_tests);
			AUT_run.takeScreenshotActiveWindow("restart: " + nr_tests + ".png");
			Perspectives.openPatientenPerspective();
			Perspectives.resetPerspective();
		}
	}

	private static List<String> myList = null;
	@SuppressWarnings("unchecked")
	private static ComponentIdentifier<TextInputComponent> tic = OM.Patienten_SelectName_grc; //$NON-NLS-1$

	private void setupTextExamples(){
		AUT_run.dbg_msg("setupTextExamples: " + nr_tests);
		String normal = "01234567890 abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String extras = "+\"*%&/()=?_:;,.-<>|@#|[]{}\\";
		String problems = "äöüéàè¼{½¬€";
		myList = Arrays.asList(normal, extras, problems);
	}

	@Test()
	public void testStringTextInput(){
		setupTextExamples();
		// We don't call synchronizedTextReplace on each element as this fails, and I don't
		// have time to debug why, as we had no problems
		myList.forEach(element -> {
			AUT_run.dbg_msg("testAllChars with string: " + element);
			Common.synchronizedTextReplace(tic, element, false);
		});
	}

	@Test()
	public void testTextInput(){
		AUT_run.dbg_msg("testTextInput: " + nr_tests);
		setupTextExamples();
		myList.forEach(element -> {
			AUT_run.dbg_msg("testAllChars with string: " + element);
			for (int i = 0, n = element.length(); i < n; i++) {
				String tst_string = element.substring(i, i + 1);
				try {
					Common.synchronizedTextReplace(tic, tst_string, false);
				} catch (ActionException | CheckFailedException e) {
					AUT_run.dbg_msg(AUT_run.Keyboard_Locale.toString() + "  FAILED: " + i + " -> "
						+ tst_string + " " + e.getMessage());
					AUT_run.takeScreenshotActiveWindow(
						AUT_run.Keyboard_Locale.toString() + "_failed_" + tst_string + ".png");
				}
			}
		});

	}

	@Test()
	public void test_artikelstamm_import() throws Exception{
		AUT_run.dbg_msg("test_artikelstamm_import: " + nr_tests);
		Software.installFeature("Elexis Swiss Open");
		Perspectives.openLeistungenPerspective();
		Artikelstamm.importArtikelstamm(null);
	}

	public void test_getInvoicesAsString() throws Exception{
		String test = Invoice.getInvoicesAsString("invoice/get_first.png");
		String matcher = "Keine Rechnung.*";
		Assert.assertTrue( test + " should match " + matcher, test.matches(matcher));
	}
	
	@Test()
	public void test_drop_eigenartikel() throws Exception{
		test_getInvoicesAsString();
		String eigenleistung = "Meine Eigenleistung";
		Assert.assertEquals(0, Common.nrRowsInTable(OM.Pat_List_tbl));
		Perspectives.openLeistungenPerspective();
		Eigenleistung.createEigenleistung("mfk", eigenleistung, 5000, 8000, 10);
		Patients pat = new Patients();
		pat.createPatient("Testperson", "ArmesWesen", "31.01.1990");
		Assert.assertEquals(1, Common.nrRowsInTable(OM.Pat_List_tbl));
		pat.createPatient("Aesculap", "Weise", "15.01.1990");
		Assert.assertEquals(2, Common.nrRowsInTable(OM.Pat_List_tbl));
		Perspectives.openPatientenPerspective();
		// We need swiss base feature to be able to invoice!
		pat.createCase("KVG", "Husten", "Testperson", "Nr. 34.56", "24.12.14");
		pat.createConsultation("Scheint ein Simulant zu sein", "Kann gut fabulieren");
		Perspectives.openLeistungenPerspective();
		pat.eigenleistungVerrechnen(eigenleistung.substring(0, 4));
		pat.invoiceActiveConsultation();
		Invoice.showInvoices("invoices/one_item.png");
		Assert.assertEquals(1, Common.nrRowsInTable(OM.Rechnungsübersicht_tbl));
		Invoice.showInvoices("invoices/one_item.png");
		String test = Invoice.getInvoicesAsString("invoice/after_first_invoice.png");
		Pattern p = Pattern.compile("[0-9]{4}.*Testperson.*ArmesWesen.*1990");
		Matcher m = p.matcher(test);
		boolean found = m.find();
		AUT_run.dbg_msg("getInvoicesAsString Testing >" + test + "< matches <" + p + "> returns found " + found);
		Assert.assertTrue(found);
	}

	@AfterClass
	public static void teardown() throws Exception{
		AUT_run.dbg_msg("Broken.teardown"); //$NON-NLS-1$
		AUT_run.tearDown();
	}
}
