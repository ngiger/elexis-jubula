package ch.ngiger.jubula.helpers;

public class Constants {

	/* Key-values for the App.config hashmap
	 */
	final static public String RESULT_DIR = "result_dir"; //$NON-NLS-1$
	final static public String WORK_DIR = "work_dir"; //$NON-NLS-1$
	final static public String AUT_ID = "aut_id"; //$NON-NLS-1$
	final static public String AUT_EXE = "aut_exe"; //$NON-NLS-1$

	/**
	 * Additional args to be passed as vm_args to the started application
	 *
	 */
	final static public String AUT_PROGRAM_ARGS = "aut_program_args"; //$NON-NLS-1$
	final static public String AUT_RUN_FROM_SCRATCH = "aut_run_from_scratch"; //$NON-NLS-1$
	final static public String AUT_ARGS = "aut_args"; //$NON-NLS-1$
	final static public String AUT_VM_ARGS = "aut_vm_args"; //$NON-NLS-1$
	final static public String AUT_LOCALE = "aut_locale"; //$NON-NLS-1$
	final static public String AUT_KEYBOARD = "aut_keyboard"; //$NON-NLS-1$
	final static public String AGENT_HOST = "agent_host"; //$NON-NLS-1$
	final static public String AGENT_PORT = "agent_port"; //$NON-NLS-1$

	/**
	 * JDBC-Connection string for the database, eg.
	 * -Dch.elexis.dbSpec=jdbc:postgresql://db_host/elexis_test_db
	 * <br>
	 * If it is null -Delexis-run-mode=RunFromScratch will be appended to the vm_args
	 *
	 */
	final static public String DB_CONNECTION = "db_connection"; //$NON-NLS-1$

	/**
	 * SQL file to load before starting the app. Can be either an absolute path or
	 * a basename, which must be found under jubula-test/rsc/{db_variant}.
	 * <br>
	 * If null or file not found, it will be ignored
	 * <br>
	 * If given it will also create a file (replacing .sql by _after.sql) after the
	 * app terminates.
	 *
	 */
	final static public String DB_LOAD_SCRIPT = "db_load_script"; //$NON-NLS-1$

	/**
	 * Values controlling the test procedure Often a value of 1000 (aka 1 second) is better if you
	 * want to diagnose the flow!
	 */

	/*
	 * Values controlling the test procedure
	 */

	// Often a value of 1000 (aka 1 second) is better if you
	// want to diagnose the flow!
	final static public int NR_MS_WAIT_AFTER_ACTION = 0;
	final static public int ONE_SECOND = 1000;
}
