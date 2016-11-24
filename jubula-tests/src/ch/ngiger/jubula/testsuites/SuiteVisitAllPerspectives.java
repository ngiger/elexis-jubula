package ch.ngiger.jubula.testsuites;

import java.util.ArrayList;
import java.util.Collection;

import org.eclipse.jubula.client.AUT;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestWatcher;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;

import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.AutTestWatcher;
import ch.ngiger.jubula.helpers.Perspectives;
import ch.ngiger.jubula.helpers.Software;
import ch.ngiger.jubula.helpers.Utils;

@RunWith(Parameterized.class)
public class SuiteVisitAllPerspectives {

	private String name;
	private static AUT m_aut = null;
	private static Perspectives p = null;
	@Rule
    public TestWatcher watchman = new AutTestWatcher();

	public SuiteVisitAllPerspectives(String name){
		super();
		Utils.dbg_msg("SuiteVisitAllPerspectives.ParameterizedTest: " + name);
		this.name = name;
	}

	@Parameters(name="{0}")
	public static Collection<Object[]> data(){
		// this will be run even before the @BeforeClass!!
		try {
			AUT_run.setUp();
		} catch (Exception e) {
			System.exit(3);
		}
		m_aut = AUT_run.startAUT();
		Software software = new Software(AUT_run.m_aut, AUT_run.app);
		software.showAbout("first", false);
		if (!software.baseChIsInstalled()) {
			software.installAllSW();
		}
		p = new Perspectives(m_aut, AUT_run.app);
		p.initialSetup(); // Sonst haben wir Probleme mit den Leistungen!
		java.util.List<String> names = p.get_all_perspective_name();
		Utils.dbg_msg("SuiteVisitAllPerspectives names are " + names); //$NON-NLS-1$
		Collection<Object[]> data = new ArrayList<>();
		names.forEach((name) -> data.add(new Object[] {
			name
		}));
		return data;
	}

	@Test
	public void test_single_perspective(){
		Utils.dbg_msg("SuiteVisitAllPerspectives.test_single_perspective: " + this.name);
		if (!p.openPerspectiveByName(this.name)) {
			p.pressEscape();
			p.pressEscape();
			AUT_run.takeScreenshotActiveWindow(AUT_run.m_aut, AUT_run.app,
				"perspectives/Perspective_" + this.name + "_failed.png"); //$NON-NLS-1$ //$NON-NLS-2$
			Assert.fail("Unable to open perspective " + this.name);

		}
		AUT_run.takeScreenshotActiveWindow(AUT_run.m_aut, AUT_run.app,
			"perspectives/Perspective_" + this.name + ".png"); //$NON-NLS-1$ //$NON-NLS-2$
	}

	@AfterClass
	public static void teardown() throws Exception{
		Utils.dbg_msg("SuiteVisitAllPerspectives.teardown"); //$NON-NLS-1$
	}
}
