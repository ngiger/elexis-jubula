package ch.ngiger.jubula.testsuites;

import java.util.ArrayList;
import java.util.Collection;

import org.eclipse.jubula.client.AUT;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;

import ch.ngiger.jubula.helpers.AUT_run;
import ch.ngiger.jubula.helpers.Perspectives;
import ch.ngiger.jubula.helpers.Utils;
import ch.ngiger.jubula.helpers.Views;

@RunWith(Parameterized.class)
public class SuiteVisitAllViews {
	private String index;
	private static AUT m_aut = null;
	private static Views v = null;
	private static Perspectives p = null;
	private static int cur_view_id = 0;
	private static int nr_views = 0;
	private final int restart_after = 25; // On my wheezy with a relatively small window I could open 37 view
	   // With the Medelexis I had problems after 26 windows

	public SuiteVisitAllViews(String name){
		super();
		Utils.dbg_msg("SuiteVisitAllViews.ParameterizedTest: " + name);
		this.index = name;
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
		p = new Perspectives(m_aut, AUT_run.app);
		p.initialSetup(); // Sonst haben wir Probleme mit den Leistungen!
		v = new Views(m_aut, AUT_run.app);
		v.maximixeView();
		java.util.List<String> indices = v.getAllViewIndices();
		Utils.dbg_msg("SuiteVisitAllViews names are " + indices); //$NON-NLS-1$
		Collection<Object[]> data = new ArrayList<>();
		indices.forEach((name) -> data.add(new Object[] {
			name
		}));
		nr_views = indices.size();
		return data;
	}

	@Test
	public void test_single_View(){
		cur_view_id ++;
		Utils.dbg_msg("SuiteVisitAllViews.test_single_View: " + this.index  + " (" + cur_view_id + " of " + nr_views + ")");
		if (cur_view_id % restart_after == 0) {
			AUT_run.restartApp(m_aut);
		}
		if (!v.openViewByIndex(this.index)) {
			AUT_run.takeScreenshotActiveWindow(AUT_run.m_aut, AUT_run.app,
				"Views/View_" + this.index + "_failed.png"); //$NON-NLS-1$ //$NON-NLS-2$
			Assert.fail("Unable to open View " + this.index);

		}
		AUT_run.takeScreenshotActiveWindow(AUT_run.m_aut, AUT_run.app,
			"Views/View_" + this.index + ".png"); //$NON-NLS-1$ //$NON-NLS-2$
	}

	@AfterClass
	public static void teardown() throws Exception{
		Utils.dbg_msg("SuiteVisitAllViews.teardown"); //$NON-NLS-1$
		// AUT_run.tearDown();
	}
}
