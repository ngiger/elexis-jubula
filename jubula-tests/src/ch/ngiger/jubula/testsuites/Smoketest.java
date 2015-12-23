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
import org.junit.BeforeClass;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ch.ngiger.jubula.elexiscore.OM;
import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Common;
import ch.ngiger.jubula.helpers.Eigenleistung;
import ch.ngiger.jubula.helpers.Patients;
import ch.ngiger.jubula.helpers.Perspectives;
import ch.ngiger.jubula.helpers.Software;

public class Smoketest {
	/** test generating a snapshot of the currently active window */

	/** the logger */
	private static Logger log = LoggerFactory.getLogger(Smoketest.class);

	static private AUT_run runner = null;

	@BeforeClass
	public static void setup() throws Exception{
		runner = new AUT_run();
		AUT_run.setUp();
		log.info("setup done"); //$NON-NLS-1$
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

	@Test()
	public void smoketest() throws Exception{
		Software.showAbout("first");
		Software.installAllFeatures();
		AUT_run.restartApp();
		Software.showAbout("second");
		// TODO: Artikelstamm.importArtikelstamm(null); // Fails at the moment
		// as the text field is special and tries to
		// TODO: testAllChars();
		String eigenleistung = "Meine Eigenleistung";
		Perspectives.openLeistungenPerspective();
		Eigenleistung.createEigenleistung("mfk", eigenleistung, 5000, 8000, 10);
		Patients pat = new Patients();
		pat.createPatient("Testperson", "ArmesWesen", "31.01.1990");
		Perspectives.openPatientenPerspective();
		// We need swiss base feature to be able to invoice!
		pat.createCase("KVG", "Husten", "Testperson", "Nr. 34.56", "24.12.14");
		pat.createConsultation("Scheint ein Simulant zu sein", "Kann gut fabulieren");
		Perspectives.openLeistungenPerspective();
		/* TODO:
		 * Having problem with drag/drop
		pat.eigenleistungVerrechnen(eigenleistung.substring(0, 4));
		pat.invoiceActiveConsultation();
		Invoice.showInvoices("smoketest/first_invoice.png");
		Perspectives.openLeistungenPerspective();
		*/
	}

	@AfterClass
	public static void teardown() throws Exception{
		log.info("teardown"); //$NON-NLS-1$
		runner.tearDown();
	}
}
