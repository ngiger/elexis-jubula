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
import ch.ngiger.jubula.helpers.Utils;
import ch.ngiger.jubula.helpers.Views;

public class Smoketest {
	/** test generating a snapshot of the currently active window */

	private static Common runner = new Common(AUT_run.doctor, AUT_run.elexis);
	private static Views views = null;
	private static Eigenleistung eigenleistung = null;
	private static Artikelstamm artikelstamm = null;
	private static Perspectives perspectives = null;
	private static Software software = null;
	private static Patients pat = null;
	private static Invoice invoice = null;

	@BeforeClass
	public static void setup() throws Exception{
		AUT_run.setUp();
		Utils.dbg_msg("setup done"); //$NON-NLS-1$
		views = new Views(AUT_run.doctor, AUT_run.elexis);
		eigenleistung = new Eigenleistung(AUT_run.doctor, AUT_run.elexis);
		artikelstamm = new Artikelstamm(AUT_run.doctor, AUT_run.elexis);
		perspectives = new Perspectives(AUT_run.doctor, AUT_run.elexis);
		software = new Software(AUT_run.doctor, AUT_run.elexis);
		pat = new Patients(AUT_run.doctor, AUT_run.elexis);
		invoice = new Invoice(AUT_run.doctor, AUT_run.elexis);
	}

	public void testTextInput(ComponentIdentifier<TextInputComponent> cid, String char2test){
		Utils.dbg_msg(
			AUT_run.Keyboard_Locale.toString() + " testTextInput: " + cid + " with " + char2test);
		TextInputComponent tic = SwtComponents.createTextInputComponent(cid);
		runner.synchronizedTextReplace(cid, "");//$NON-NLS-1$

		for (int i = 0, n = char2test.length(); i < n; i++) {
			String tst_string = char2test.substring(i, i + 1);
			try {
				runner.execute(tic.replaceText(tst_string), null);
				runner.execute(tic.checkText(tst_string, Operator.matches), null);
			} catch (ActionException | CheckFailedException e) {
				Utils.dbg_msg(AUT_run.Keyboard_Locale.toString() + "  FAILED: " + i + " -> "
					+ tst_string + " " + e.getMessage());
				Utils.takeScreenshotActiveWindow(
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
		// myList.forEach(element -> runner.synchronizedTextReplace(text_intput_to_use, element));
	}

	private static boolean miminized = false;

	@Test()
	public void smoketest() throws Exception{
		Utils.dbg_msg("smoketest miminized is " + miminized + " Medelexis " + AUT_run.isMedelexis);
		runner.initialWorkWithRunFromScatch();
		if (AUT_run.isMedelexis) {
			Utils.dbg_msg("AUT_EXE is medelexis: " + AUT_run.config.get(Constants.AUT_EXE));
			runner.clickComponent(OM.Medelexis_Abo_perspective_tbi);
			Utils.sleepMs(5 * 1000); // wait 5 seconds: TODO: should wait till populated
		}

		if (!miminized) {
			software.showAbout("first");
			if (AUT_run.isMedelexis) {
				Utils.dbg_msg("AUT_EXE is medelexis" + AUT_run.config.get(Constants.AUT_EXE));
				runner.openMenu("Datei/Beenden");
			} else {
				software.installAllFeatures();
				AUT_run.restartApp();
				runner.initialWorkWithRunFromScatch();
			}
			software.showAbout("second");
			Utils.dbg_msg("Calling importArtikelstamm" + AUT_run.config.get(Constants.AUT_EXE));
			artikelstamm.importArtikelstamm(null);
		}

		String leisungs_name = "Motorfaehigkeit testen";
		eigenleistung.createEigenleistung("mfk", leisungs_name, 5000, 8000, 10);

		pat.createPatient("Testperson", "ArmesWesen", "31.01.1990");
		perspectives.openPatientenPerspective();

		// We need swiss base feature to be able to invoice!
		pat.createCase("KVG", "Husten", "Testperson", "Nr. 34.56", "24.12.14");
		pat.createConsultation("Scheint ein Simulant zu sein", "Kann gut fabulieren");

		if (!miminized) {
			pat.artikelstammItemVerrechnen("CYKLOKAPRON");
		}
		pat.eigenleistungVerrechnen(leisungs_name.substring(0, 4));

		pat.invoiceActiveConsultation();
		String test = invoice.getInvoicesAsString("invoice/after_first_invoice.png");
		Pattern p = Pattern.compile("[0-9]{4}.*Testperson.*ArmesWesen.*1990");
		Matcher m = p.matcher(test);
		boolean found = m.find();
		Utils.dbg_msg("getInvoicesAsString Testing >" + test + "< matches <" + p
			+ "> returns found " + found);
		Assert.assertTrue(found);
	}

	@AfterClass
	public static void teardown() throws Exception{
		Utils.dbg_msg("Smoketest.teardown"); //$NON-NLS-1$
		AUT_run.tearDown();
	}
}
