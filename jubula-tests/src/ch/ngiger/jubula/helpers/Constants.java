package ch.ngiger.jubula.helpers;

public class Constants {

	/* Key-values for the App.config hashmap
	 */
	final static public String RESULT_DIR = "result_dir"; //$NON-NLS-1$
	final static public String WORK_DIR = "work_dir"; //$NON-NLS-1$
	final static public String AUT_ID = "aut_id"; //$NON-NLS-1$
	final static public String AUT_EXE = "aut_exe"; //$NON-NLS-1$
	final static public String AUT_ARGS = "aut_args"; //$NON-NLS-1$
	final static public String AUT_LOCALE = "aut_locale"; //$NON-NLS-1$
	final static public String AUT_KEYBOARD = "aut_keyboard"; //$NON-NLS-1$
	final static public String AGENT_HOST = "agent_host"; //$NON-NLS-1$
	final static public String AGENT_PORT = "agent_port"; //$NON-NLS-1$

	/*
	 * Values controlling the test procedure
	 */

	// Often a value of 1000 (aka 1 second) is better if you
	// want to diagnose the flow!
	final static public int NR_MS_WAIT_AFTER_ACTION = 0;
}
