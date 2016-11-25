package ch.ngiger.jubula.helpers;

import org.junit.internal.AssumptionViolatedException;
import org.junit.rules.TestWatcher;
import org.junit.runner.Description;

@SuppressWarnings("restriction")
public class AutTestWatcher extends TestWatcher {

	@Override
	protected void failed(Throwable e, Description description){
		String msg = description + " failed\n";
		Utils.dbg_msg("JUnitTest: " + msg);
		e.printStackTrace(Utils.getWriter());
	}

	@Override
	protected void succeeded(Description description){
		String msg = description + " succeeded\n";
		Utils.dbg_msg("JUnitTest: " + msg);
	}
	@Override
    protected void skipped(AssumptionViolatedException e, Description description) {
		String msg = description + " skipped due to a failed assumption\n";
		Utils.dbg_msg("JUnitTest: " + msg);
    }


	@Override
	protected void starting(Description description){
		String msg = description + " starting\n";
		Utils.dbg_msg("JUnitTest: " + msg);
	}
}
