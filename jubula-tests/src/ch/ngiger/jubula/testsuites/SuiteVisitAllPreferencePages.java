package ch.ngiger.jubula.testsuites;

import java.util.ArrayList;
import java.util.Collection;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.exceptions.ActionException;
import org.eclipse.jubula.client.exceptions.ComponentNotFoundException;
import org.eclipse.jubula.toolkit.swt.components.Button;
import org.eclipse.jubula.tools.ComponentIdentifier;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;

import ch.ngiger.jubula.elexiscore.OM;
import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Perspectives;
import ch.ngiger.jubula.helpers.PreferencePages;
import ch.ngiger.jubula.helpers.Utils;

@RunWith(Parameterized.class)
public class SuiteVisitAllPreferencePages {
	private String index;
	private static AUT m_aut = null;
	private static PreferencePages prefs = null;
	private static Perspectives p = null;
	private static int cur_PreferencePage_id = 0;
	private static int nr_PreferencePages = 0;

	public SuiteVisitAllPreferencePages(String name){
		super();
		Utils.dbg_msg("SuiteVisitAllPreferencePages.ParameterizedTest: " + name);
		this.index = name;
	}

	@Parameters(name = "{0}")
	public static Collection<Object[]> data(){
		// this will be run even before the @BeforeClass!!
		try {
			AUT_run.setUp();
		} catch (Exception e) {
			System.exit(3);
		}

		m_aut = AUT_run.startAUT();
		p = new Perspectives(m_aut, AUT_run.app);
		p.initialSetup(); // Sonst haben wir Probleme mit den Leistungen!
		prefs = new PreferencePages(m_aut, AUT_run.app);
		java.util.List<String> indices = prefs.getAllPreferenceIndices();
		Utils.dbg_msg("SuiteVisitAllPreferencePages indices are " + indices); //$NON-NLS-1$
		Collection<Object[]> data = new ArrayList<>();
		indices.forEach((name) -> data.add(new Object[] {
			name
		}));
		nr_PreferencePages = indices.size();
		return data;
	}

	@Test
	public void test_single_PreferencePage(){
		cur_PreferencePage_id++;
		Utils.dbg_msg("SuiteVisitAllPreferencePages.test_single_PreferencePage: " + this.index
			+ " (" + cur_PreferencePage_id + " of " + nr_PreferencePages + ")");
		@SuppressWarnings({
			"unchecked"
		})
		ComponentIdentifier<Button> ok_btn = OM.Preferences_OkButton_grc; //$NON-NLS-1$
		if (!prefs.gotoPreferencPage(this.index)) {
			AUT_run.takeScreenshotActiveWindow(AUT_run.m_aut, AUT_run.app,
				"PreferencePages/PreferencePage_" + this.index + "_failed.png"); //$NON-NLS-1$ //$NON-NLS-2$
			Assert.fail("Unable to open PreferencePage " + this.index);

		}
		String name = prefs.create_named_preference_screenshot(this.index.replace("/", "_"));
		try {
			prefs.clickComponent(ok_btn);
			// the ok_btn is not present in the Security/Secure Storage!!
			// therefore we must catch also the ComponentNotFoundException
			if (prefs.waitForElexisMainWindow()) {
				return;
			}
		} catch (ActionException | ComponentNotFoundException e) {
			Utils.dbg_msg(
				"visit_all_preferencePages. must cancel. Got exception: " + e.getMessage());
			AUT_run.takeScreenshotActiveWindow(m_aut, AUT_run.app,
				"preferences/cancel_" + this.index.replace("/", "_") + ".png"); //$NON-NLS-1$ //$NON-NLS-2$
			prefs.clickComponent(ok_btn);
		}
		AUT_run.takeScreenshotActiveWindow(AUT_run.m_aut, AUT_run.app,
			"PreferencePages/" + this.index + "_okay_did_not_work.png"); //$NON-NLS-1$ //$NON-NLS-2$
		prefs.pressEscape(); // return to main
		prefs.pressEscape(); // return to main
		if (!name.contains("Security")) {
			Assert.fail("Okay-Button did not work");
		}
	}

	@AfterClass
	public static void teardown() throws Exception{
		Utils.dbg_msg("SuiteVisitAllPreferencePages.teardown"); //$NON-NLS-1$
		AUT_run.tearDown();
	}
}
