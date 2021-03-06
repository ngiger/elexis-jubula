/*******************************************************************************
 * Copyright (c) 2015 BREDEX GmbH.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     BREDEX GmbH - initial API and implementation and/or initial documentation
 *******************************************************************************/
package ch.ngiger.jubula.helpers;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.nio.file.attribute.FileAttribute;
import java.nio.file.attribute.PosixFilePermission;
import java.nio.file.attribute.PosixFilePermissions;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Set;
import java.util.TimeZone;

import org.junit.Assert;
import org.junit.Rule;
import org.junit.rules.TestWatcher;
import org.junit.runner.Description;

/**
 * @author Niklaus Giger niklaus.giger@member.fsf.org
 */
public class Utils {
	public static String SAVE_RESULTS_DIR = null;
	private static String watchedLog = "Started:\n";
	@Rule
	public TestWatcher watchman = new TestWatcher() {
		@Override
		protected void failed(Throwable e, Description description){
			watchedLog += description + "\n";
			Utils.dbg_msg("xxx: " + watchedLog);
			e.printStackTrace(Utils.getWriter());
			Utils.dbg_msg("afterPrint");

		}

		@Override
		protected void succeeded(Description description){
			System.out.println(description.getDisplayName());
			Utils.dbg_msg(description.toString());
			watchedLog += description + " " + "success!\n";
		}
	};

	/** test generating a snapshot of the currently active window */

	public static void sleep1second(){
		sleepMs(Constants.ONE_SECOND);
	}

	public static void sleepMs(int timoutInMs){
		String startTime = getTimeStamp();
		try {
			// dbg_msg("sleep timoutInMs " + timoutInMs);
			Thread.sleep(timoutInMs);
		} catch (InterruptedException e) {
			String finished = getTimeStamp();
			dbg_msg("sleep " + timoutInMs + " ms was interrupted started at " + startTime
				+ " is now " + finished);
			e.printStackTrace(writer);
		}
	}

	public static String getTimeStamp(){
		return new SimpleDateFormat("dd.MM.yyyy HH:mm:ss.S")
			.format(Calendar.getInstance().getTime());
	}

	public static void dbg_msg(String msg){
		String timeStamp = getTimeStamp();
		if (SAVE_RESULTS_DIR == null) {
			Utils.setupResultDir();
		}
		// log.info(msg);
		if (Utils.writer == null) {
			String log_name = null;
			TimeZone tz = TimeZone.getDefault();

			String log_timestamp = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss")
				.format(Calendar.getInstance().getTime());
			log_name = SAVE_RESULTS_DIR + "/AUT_run_" + log_timestamp + ".log";
			try {
				Utils.writer = new PrintWriter(log_name, "UTF-8");
			} catch (FileNotFoundException | UnsupportedEncodingException e) {
				e.printStackTrace();
				Utils.writer = new PrintWriter(System.out);
			}
			System.out.println("log_name writer is: " + log_name);
			Utils.writer.println("init default " + tz.getDisplayName() + " value: " +new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss")
				.format(Calendar.getInstance().getTime()));
			TimeZone.setDefault(TimeZone.getTimeZone("Europe/London"));
			Utils.writer.println("init europe/London " + tz.getDisplayName() + " value: " +new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss")
				.format(Calendar.getInstance().getTime()));
			TimeZone.setDefault(TimeZone.getTimeZone("Europe/Zurich"));
			Utils.writer.println("init europe/Zurich " + tz.getDisplayName() + " value: " +new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss")
				.format(Calendar.getInstance().getTime()));
		}
		System.out.println(timeStamp + ": dbg_msg " + msg);
		Utils.writer.println(timeStamp + ": " + msg);
		Utils.writer.flush();
	}

	/**
	 * Helper procedure to set size of Elexis to 1400x1024 . This avoids problem with Artikelstamm
	 * and other ctab, where we cannot see all of them Uses wmctl command line
	 */
	public static void maximizeElexisWindow(){
		String script = "/app/maximize_elexis.rb";
		if (AUT_run.AUT_runs_on_localhost() && new File(script).canExecute()) {
			// Thanks to http://blog.spiralofhope.com/1042/wmctrl-user-documentation.html !
			// The script is in an external file to avoid eternal problems with quoting
			// inside ruby/java/bash
			Utils.run_system_cmd(script, "maximize_elexis");
			AUT_run.takeScreenshotActiveWindow(AUT_run.m_aut, AUT_run.app,
				"maximizeElexisWindow.png");
			// https://help.ubuntu.com/community/Metacity maximize Alt-F10 works on a gnome
			// but not with metacity alone
			// AUT_ng8752run.m_aut.execute(AUT_run.app.externalKeyCombination(new Modifier[] {Modifier.alt}, "F10"), null);
		} else {
			Utils.dbg_msg("Cannot maximize Elexis on remote host!! or script " + script + " not executable");
		}
	}

	/**
	 * run_system_cmd writes the command into a temporary file to allow useage of pipes and
	 * redirection. Then makes the file executable and executes it.
	 *
	 * @param cmd
	 *            Executable and parameters
	 * @param short_name
	 *            will be used to save the script in the results directory for trouble shooting
	 *
	 * @return true if command exited with status 0
	 */
	public static boolean run_system_cmd(String cmd, String short_name){
		String s = null;
		String cmd_prefix = "#!/bin/bash -v\n";
		try {
			Utils.sleepMs(100); // Without this delay dumpin the DB failed!!
			Path script_file = Files.createTempFile(short_name + "_", ".sh");
			dbg_msg("run_system_cmd: " + script_file + " with " + cmd);
			Files.write(script_file, (cmd_prefix + cmd + "\n").getBytes());
			// Utils.sleep1second();
			script_file.toFile().setExecutable(true);
			// Utils.sleep1second();
			// Save the script run in the results dir
			// This can be handy to diagnose problem
			Files.copy(script_file, Paths.get(SAVE_RESULTS_DIR, short_name + ".sh"),
				StandardCopyOption.REPLACE_EXISTING);

			Process p = Runtime.getRuntime().exec(script_file.toString());

			BufferedReader stdInput = new BufferedReader(new InputStreamReader(p.getInputStream()));

			BufferedReader stdError = new BufferedReader(new InputStreamReader(p.getErrorStream()));

			// read the output from the command
			// dbg_msg("Here is the standard output of the command:\n");
			while ((s = stdInput.readLine()) != null) {
				System.out.println(s);
				dbg_msg(s);
			}

			// read any errors from the attempted command
			// dbg_msg("Here is the standard error of the command (if any):\n");
			while ((s = stdError.readLine()) != null) {
				System.out.println(s);
				dbg_msg(s);
			}
			dbg_msg("run_system_cmd: " + script_file + " will check exitValue in 100 ms");
			sleepMs(100);
			try {
				dbg_msg("run_system_cmd: " + script_file + " exitValue " + p.exitValue());
				return p.exitValue() == 0;
			} catch (IllegalThreadStateException e) {
				dbg_msg("exception happened - here's what I know: " + e.toString());
				System.out.println("exception happened - here's what I know: " + e.toString());
				e.printStackTrace(writer);
				return true;
			}
		} catch (IOException e) {
			dbg_msg("exception happened - here's what I know: " + e.toString());
			System.out.println("exception happened - here's what I know: " + e.toString());
			e.printStackTrace(writer);
			return false;
		}
	}

	private static PrintWriter writer = null;

	static String setupResultDir(){
		java.nio.file.Path rPath = Paths.get("../results").toAbsolutePath().normalize();
		AUT_run.config.put(Constants.RESULT_DIR, rPath.toString());
		boolean foundFile = Files.exists(rPath, LinkOption.NOFOLLOW_LINKS);
		if (foundFile) {
			SAVE_RESULTS_DIR = rPath.toString();
		} else {
			Set<PosixFilePermission> perms = PosixFilePermissions.fromString("rwxr-x---");
			FileAttribute<Set<PosixFilePermission>> attr =
				PosixFilePermissions.asFileAttribute(perms);
			try {
				Files.createDirectories(rPath, attr);
				SAVE_RESULTS_DIR = rPath.toString();
			} catch (IOException e) {
				e.printStackTrace();
				Assert.fail("Could not create " + rPath.toString());
			}
		}
		System.out.println("SAVE_RESULTS_DIR is: " + SAVE_RESULTS_DIR);
		return SAVE_RESULTS_DIR;
	}

	public static PrintWriter getWriter(){
		return writer;
	}
}
