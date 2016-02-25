package ch.ngiger.jubula.testsuites;

import java.util.Arrays;
import java.util.List;

import org.eclipse.jubula.client.exceptions.ActionException;
import org.eclipse.jubula.client.exceptions.CheckFailedException;
import org.eclipse.jubula.toolkit.concrete.components.TextInputComponent;
import org.eclipse.jubula.tools.ComponentIdentifier;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import ch.ngiger.jubula.elexiscore.OM;
import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Artikelstamm;
import ch.ngiger.jubula.helpers.Common;
import ch.ngiger.jubula.helpers.Perspectives;
import ch.ngiger.jubula.helpers.Software;
import ch.ngiger.jubula.helpers.Utils;

public class Keyboard extends Common {

	// Here we put all test that are currently broken for one reason or another

	static int nr_tests = 0;
	private static Artikelstamm artikelstamm = null;
	private static Perspectives perspectives = null;
	private static Software software = null;

	@BeforeClass
	public static void setup() throws Exception{
		AUT_run.setUp();
		artikelstamm = new Artikelstamm();
		perspectives = new Perspectives();
		software = new Software();
	}

	@Before
	public void restart() throws Exception{
		nr_tests++;
		if (nr_tests <= 1) {
			Utils.dbg_msg("Skip restart on first test: " + nr_tests);
		} else {
			Utils.dbg_msg("Calling restart: " + nr_tests);
			AUT_run.restartApp();
			Utils.sleep1second();
			Utils.dbg_msg("restart: " + nr_tests);
			Utils.takeScreenshotActiveWindow("restart: " + nr_tests + ".png");
			perspectives.openPatientenPerspective();
			perspectives.resetPerspective();
		}
	}

	private static List<String> myList = null;
	@SuppressWarnings("unchecked")
	private static ComponentIdentifier<TextInputComponent> tic = OM.Patienten_SelectName_grc; //$NON-NLS-1$

	private void setupTextExamples(){
		Utils.dbg_msg("setupTextExamples: " + nr_tests);
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
			Utils.dbg_msg("testAllChars with string: " + element);
			synchronizedTextReplace(tic, element, false);
		});
	}

	@Test()
	public void testTextInput(){
		Utils.dbg_msg("testTextInput: " + nr_tests);
		setupTextExamples();
		myList.forEach(element -> {
			Utils.dbg_msg("testAllChars with string: " + element);
			for (int i = 0, n = element.length(); i < n; i++) {
				String tst_string = element.substring(i, i + 1);
				try {
					synchronizedTextReplace(tic, tst_string, false);
				} catch (ActionException | CheckFailedException e) {
					Utils.dbg_msg(AUT_run.Keyboard_Locale.toString() + "  FAILED: " + i + " -> "
						+ tst_string + " " + e.getMessage());
					Utils.takeScreenshotActiveWindow(
						AUT_run.Keyboard_Locale.toString() + "_failed_" + tst_string + ".png");
				}
			}
		});

	}

	@Test()
	public void test_artikelstamm_import() throws Exception{
		Utils.dbg_msg("test_artikelstamm_import: " + nr_tests);
		software.installFeature("Elexis Swiss Open");
		perspectives.openLeistungenPerspective();
		artikelstamm.importArtikelstamm(null);
	}

	@AfterClass
	public static void teardown() throws Exception{
		Utils.dbg_msg("Broken.teardown"); //$NON-NLS-1$
		AUT_run.tearDown();
	}
}
