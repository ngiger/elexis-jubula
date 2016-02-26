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
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.management.ManagementFactory;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Paths;
import java.nio.file.attribute.FileAttribute;
import java.nio.file.attribute.PosixFilePermission;
import java.nio.file.attribute.PosixFilePermissions;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.junit.Assert;

/** @author Niklaus Giger niklaus.giger@member.fsf.org */
public class Utils {
	public static String SAVE_RESULTS_DIR = null;
	public static void sleep1second(){
		sleepMs(Constants.ONE_SECOND);
	}

	public static void sleepMs(int timoutInMs){
		try {
			// dbg_msg("sleep timoutInMs " + timoutInMs);
			Thread.sleep(timoutInMs);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	public static void dbg_msg(String msg){
		String timeStamp =
			new SimpleDateFormat("dd.MM.yyyy HH:mm:ss").format(Calendar.getInstance().getTime());
		// log.info(msg);
		if (Utils.writer == null) {
			String log_name = null;
			if (SAVE_RESULTS_DIR != null) {
				log_name = SAVE_RESULTS_DIR + "/AUT_run_"
					+ ManagementFactory.getRuntimeMXBean().getName() + ".log";
			} else {
				log_name = AUT_run.USER_DIR + "/AUT_run.log";
			}
			try {
				Utils.writer = new PrintWriter(log_name, "UTF-8");
			} catch (FileNotFoundException | UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			System.out.println("log_name writer is: " + log_name);
		}
		// System.out.println(timeStamp + ": dbg_msg " + msg);
		Utils.writer.println(timeStamp + ": " + msg);
		Utils.writer.flush();
	}

	public static boolean run_system_cmd(String args[]){
		String s = null;

		try {
			dbg_msg("run_system_cmd: " + StringUtils.join(args, " "));
			Process p = Runtime.getRuntime().exec(args);

			BufferedReader stdInput = new BufferedReader(new InputStreamReader(p.getInputStream()));

			BufferedReader stdError = new BufferedReader(new InputStreamReader(p.getErrorStream()));

			// read the output from the command
			// dbg_msg("Here is the standard output of the command:\n");
			while ((s = stdInput.readLine()) != null) {
				dbg_msg(s);
			}

			// read any errors from the attempted command
			// dbg_msg("Here is the standard error of the command (if any):\n");
			while ((s = stdError.readLine()) != null) {
				dbg_msg(s);
			}
			return true;
		} catch (IOException e) {
			dbg_msg("exception happened - here's what I know: ");
			e.printStackTrace();
			return false;
			// System.exit(-1);
		}
	}

	private static PrintWriter writer = null;

	private static String RESULT_DIR = null;

	static void setupResultDir(){
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
	}
	
	public static PrintWriter getWriter(){
		return writer;
	}
}
