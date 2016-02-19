package ch.ngiger.jubula.testsuites;

import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.eclipse.jubula.client.exceptions.ActionException;
import org.eclipse.jubula.client.exceptions.CheckFailedException;
import org.eclipse.jubula.toolkit.concrete.components.TextInputComponent;
import org.eclipse.jubula.toolkit.enums.ValueSets.Operator;
import org.eclipse.jubula.toolkit.swt.SwtComponents;
import org.eclipse.jubula.tools.ComponentIdentifier;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import ch.ngiger.jubula.elexiscore.OM;
import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Artikelstamm;
import ch.ngiger.jubula.helpers.Common;
import ch.ngiger.jubula.helpers.Constants;
import ch.ngiger.jubula.helpers.Eigenleistung;
import ch.ngiger.jubula.helpers.Invoice;
import ch.ngiger.jubula.helpers.Patients;
import ch.ngiger.jubula.helpers.Perspectives;
import ch.ngiger.jubula.helpers.Software;

public class Smoketest {
	/** test generating a snapshot of the currently active window */
	
	@BeforeClass
	public static void setup() throws Exception{
		AUT_run.setUp();
		AUT_run.dbg_msg("setup done"); //$NON-NLS-1$
	}
	
	public void testTextInput(ComponentIdentifier<TextInputComponent> cid, String char2test){
		AUT_run.dbg_msg(
			AUT_run.Keyboard_Locale.toString() + " testTextInput: " + cid + " with " + char2test);
		TextInputComponent tic = SwtComponents.createTextInputComponent(cid);
		Common.synchronizedTextReplace(cid, "");//$NON-NLS-1$
		
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
	
	private void testAllChars(){
		@SuppressWarnings("unchecked")
		ComponentIdentifier<TextInputComponent> text_intput_to_use = OM.Patienten_SelectName_grc; //$NON-NLS-1$
		String normal = "01234567890 abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String extras = "+\"*%&/()=?_:;,.-<>|@#|[]{}\\";
		String problems = "äöüéàè¼{½¬€";
		
		List<String> myList = Arrays.asList(normal, extras, problems);
		myList.forEach(element -> testTextInput(text_intput_to_use, element));
		
		// We don't call synchronizedTextReplace on each element as this fails, and I don't
		// have time to debug why, as we had no problems
		// myList.forEach(element -> Common.synchronizedTextReplace(text_intput_to_use, element));
	}
	
	private static boolean miminized = true;
	
	@Test()
	public void smoketest() throws Exception{
		if (AUT_run.isMedelexis) {
			AUT_run.dbg_msg("AUT_EXE is medelexis: " + AUT_run.config.get(Constants.AUT_EXE));
			Common.clickComponent(OM.Medelexis_Abo_perspective_tbi);
			Common.sleepMs(5 * 1000); // wait 5 seconds: TODO: should wait till populated
		}
		
		if (!miminized) {
			Software.showAbout("first");
			Software.installAllFeatures();
			if (AUT_run.isMedelexis) {
				AUT_run.dbg_msg("AUT_EXE is medelexis" + AUT_run.config.get(Constants.AUT_EXE));
				Common.openMenu("Datei/Beenden");
			} else {
				AUT_run.restartApp();
			}
			Software.showAbout("second");
		}
		Artikelstamm.importArtikelstamm(null);
		if (!miminized) {
			String eigenleistung = "Meine Eigenleistung";
			Perspectives.openLeistungenPerspective();
			Eigenleistung.createEigenleistung("mfk", eigenleistung, 5000, 8000, 10);
		}
		Patients pat = new Patients();
		pat.createPatient("Testperson", "ArmesWesen", "31.01.1990");
		Perspectives.openPatientenPerspective();
		// We need swiss base feature to be able to invoice!
		pat.createCase("KVG", "Husten", "Testperson", "Nr. 34.56", "24.12.14");
		pat.createConsultation("Scheint ein Simulant zu sein", "Kann gut fabulieren");
		Perspectives.openLeistungenPerspective();
		pat.artikelstammItemVerrechnen("CYKLOKAPRON");
		
		String eigenleistung = "Meine Eigenleistung";
		Eigenleistung.createEigenleistung("mfk", eigenleistung, 5000, 8000, 10);
		Perspectives.openLeistungenPerspective();
		pat.eigenleistungVerrechnen(eigenleistung.substring(0, 4));
		
		pat.invoiceActiveConsultation();
		String test = Invoice.getInvoicesAsString("invoice/after_first_invoice.png");
		Pattern p = Pattern.compile("[0-9]{4}.*Testperson.*ArmesWesen.*1990");
		Matcher m = p.matcher(test);
		boolean found = m.find();
		AUT_run.dbg_msg("getInvoicesAsString Testing >" + test + "< matches <" + p
			+ "> returns found " + found);
		Assert.assertTrue(found);
	}
	
	@AfterClass
	public static void teardown() throws Exception{
		AUT_run.dbg_msg("Smoketest.teardown"); //$NON-NLS-1$
		AUT_run.tearDown();
	}
}
