package ch.ngiger.jubula.helpers;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLDecoder;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;

import org.junit.Assert;

public class AUT_db {
	private static String db_variant = null;
	private static String dump_command = null;
	private static String file_to_load = null;
	private static String dump_to_file = null;
	private static String vmargs_db_flavor = "";
	private static URI uri = null;
	private static String db_host = null;
	private static int db_port = 0;
	private static String db_connection = null;
	private static String load_configured = null;
	private static Map<String, String> config;
	private static String load_command;
	// db_user_pw this must be kept in sync with docker-compose.yml file!
	private static String db_user_pw =
		" -Dch.elexis.dbUser=elexistest -Dch.elexis.dbPw=elexisTestPassword ";

	/**
	 *
	 * @param db_variant
	 *            e.g. h2, mysql, postresql
	 * @param filename
	 *            either absolute path or basename for directory rsc/db/<db_variant>
	 * @return absolute path of file or null if not found
	 */

	static String getDatabaseFile(String db_variant, String filename){
		String path = AUT_run.class.getProtectionDomain().getCodeSource().getLocation().getPath();
		Utils.dbg_msg("Find " + filename + " config.get(Constants.WORK_DIR) "
			+ config.get(Constants.WORK_DIR));
		if (new File(filename).canRead()) {
			Utils.dbg_msg("Cannot read the db file: " + filename);
			return filename;
		}
		String decodedPath = null;
		try {
			decodedPath = URLDecoder.decode(path, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			Utils.dbg_msg("Cannot decode: " + path);
			return null;
		}
		Utils.dbg_msg("decodedPath is: " + decodedPath);
		String desired = config.get(Constants.WORK_DIR) + "/rsc/db/" + db_variant + "/" + filename;
		if (new File(desired).canRead()) {
			Utils.dbg_msg(
				"desired is readable: " + desired + " -> " + desired.replaceAll("//", "/"));
			return desired.replaceAll("//", "/");
		}
		Utils.dbg_msg("CANNOT read desired: " + desired);
		return null;
	}

	/**
	 * if Constants.DB_LOAD_SCRIPT is set: <br>
	 * * loads the specified SQL script <br>
	 * * set variables dump_to_file, load_command, dump_command <br>
	 * * dump_command will be called in the teardown to create <sql_script>_after.sql file.
	 */
	public static void checkAndLoadDatabase(Map<String, String> db_config){
		config = db_config;
		Utils.dbg_msg("load demanded? " + config.get(Constants.DB_LOAD_SCRIPT));
		load_configured = config.get(Constants.DB_LOAD_SCRIPT);
		if (load_configured == null) {
			load_configured = "";
		}
		db_connection = config.get(Constants.DB_CONNECTION);
		Utils.dbg_msg("db_connection ist: " + db_connection);
		Utils.dbg_msg("db_connection " + db_connection +": AUT_VM_ARGS are: " + config.get(Constants.AUT_VM_ARGS));
		String cleanURI = db_connection.substring(db_connection.indexOf(":") + 1);
		uri = URI.create(cleanURI);
		if (uri == null)
			return;
		Utils.dbg_msg("uri ist: " + uri);
		db_variant =
			(uri != null && uri.getScheme() != null) ? uri.getScheme().toLowerCase() : "h2";
		int db_port = uri.getPort();
		db_host = uri.getHost();
		Utils.dbg_msg(db_connection + ": -> " + db_variant + ", " + db_host + ", " + db_port + ", "
			+ uri.getPath());
		if (db_connection == null || config.get(Constants.AUT_RUN_FROM_SCRATCH).equals("true") ||
				config.get(Constants.DB_LOAD_SCRIPT).length() == 0)
		{
			config.put(Constants.AUT_VM_ARGS,
				config.get(Constants.AUT_VM_ARGS) + " -Delexis-run-mode=RunFromScratch -Dch.elexis.username=007 -Dch.elexis.password=topsecret");
		} else {
			vmargs_db_flavor =
					" -Dch.elexis.dbFlavor=" + db_variant + " -Dch.elexis.dbSpec=" + db_connection;
		}
		file_to_load = getDatabaseFile(db_variant, config.get(Constants.DB_LOAD_SCRIPT));
		if (!load_configured.equals("")	&& (file_to_load == null )) {
			Utils.dbg_msg("load_configured file_to_load <" + file_to_load
				+ "> is either null or not readable. Therefore we exit with an error");
			System.exit(3);
		}
		load_database();
	}

	private static void load_database(){
		String save_to = config.get(Constants.RESULT_DIR)
				+ "/" + db_variant + "_" ;
		if (System.getenv("test_to_run") != null) {
			save_to = save_to + System.getenv("test_to_run") + "_";
		}
		if (load_configured.equals("")) {
			dump_to_file = save_to + "after_from_scratch.sql";
		} else {
			Path path = FileSystems.getDefault().getPath(file_to_load);
			dump_to_file = save_to  + "after_" + path.getFileName().toString();
		}
		if (db_variant.equals("h2")) {
			db_user_pw = "";
			// This will not work if you run the agent on a different host!
			java.nio.file.Path j2_jar_file =
				Paths.get("../work/plugins/org.h2_1.3.170.jar").toAbsolutePath().normalize();
			String start = "java -cp " + j2_jar_file;
			String jdbc_connection = "jdbc:h2:" + Paths.get("h2-for-aut");
			String middle = " -url " + jdbc_connection + " -user sa -script ";
			load_command = start + " org.h2.tools.RunScript " + middle + file_to_load;
			String get_db_name = dump_command =
				"export DB_NAME=`/bin/grep -i RunFromScratch ~/elexis/logs/elexis-3.log |"
					+ "/usr/bin/tail -n1 | " + // get last occurence of it
					"/usr/bin/cut -d' ' -f12 |" + // get full pathname
					"/usr/bin/cut -d. -f1`;" + // but ignore .h2.db at the end of the file
					"/bin/echo temp_db was ${DB_NAME}; ";
			dump_command = get_db_name + start + " org.h2.tools.Script "
				+ " -url jdbc:h2:${DB_NAME}" + " -script " + dump_to_file;

		} else if (db_variant.equals("mysql")) {
			String db_name = uri.getPath().replace("/", "");
			config.put(Constants.AUT_VM_ARGS, config.get(Constants.AUT_VM_ARGS) + db_user_pw);
			load_command = "/usr/bin/mysql " + " --host=" + db_host
 				+ " --user=elexistest --password=elexisTestPassword ";
			if (db_port > 0) {
				load_command += " --protocol=TCP " + String.format(" --port=%d ", db_port);
			}
			String drop_and_create = load_command  + " -e 'drop database " + db_name + " IF EXISTS; create database " + db_name + "; show databases';";
			dump_command = load_command.replace("/bin/mysql ", "/bin/mysqldump ");
			load_command += db_name;
			load_command = drop_and_create + "/bin/cat " + file_to_load + " | " + load_command;
			dump_command += " --add-drop-database --add-drop-table " + db_name + " > " + dump_to_file;
		} else if (db_variant.equals("postgresql")) {
			String set_pw = "export PGPASSWORD=elexisTestPassword\n";
			// PG user elexisTest must be downcased to allow login! Niklaus Giger, 22.04.2016
			// but the password remains mixed case.
			vmargs_db_flavor = " -Dch.elexis.dbFlavor=" + db_variant + " -Dch.elexis.dbSpec="
				+ db_connection.toLowerCase();

			String connect_cmd = " --host=" + db_host + " --user=elexistest ".toLowerCase();
			if (db_port > 0) {
				connect_cmd += String.format(" --port=%d ", db_port);
			}
			String db_name = uri.getPath().replace("/", "").toLowerCase();
			connect_cmd += db_name;
			load_command = set_pw + "/bin/cat " + file_to_load + " | /usr/bin/psql " + connect_cmd;
			dump_command = set_pw + "pg_dump --clean " + connect_cmd + " > " + dump_to_file;

		} else if (!load_configured.equals("")) {
			Assert.fail(Constants.DB_CONNECTION + " unsupported type " + db_variant
				+ " from config " + config.get(Constants.DB_CONNECTION));
		}
		if (load_configured.equals("")) {
			Utils.dbg_msg("load_configured is empty. Setting load_command to '' instead of: " + load_command);
			load_command = null;
		} else if (!Utils.run_system_cmd(load_command, "load_database")) {
			String error = "loading database failed: " + load_command;
			Utils.dbg_msg(error);
			Assert.fail(error);
		}
		// find name of generate temporary database
		Utils.dbg_msg("dump_command for jdbc: " + dump_command);

		dump_command = "/bin/rm -f " + dump_to_file + "; " + // remove old dump
			dump_command;
		Utils.dbg_msg("dump_command full: " + dump_command);
		Utils.dbg_msg("checkAndLoadDatabase vmargs_db_flavor: " + vmargs_db_flavor);
		Utils.dbg_msg("checkAndLoadDatabase db_user_pw: " + db_user_pw);
		config.put(Constants.AUT_VM_ARGS,
			config.get(Constants.AUT_VM_ARGS) + vmargs_db_flavor + " " + db_user_pw);

	}
	public static void dumpDatabase(){
		if (dump_command == null || (db_variant.equals("h2") && config.get(Constants.AGENT_HOST).length() > 0)) {
			Utils.dbg_msg("Skip dumping as remote host " + config.get(Constants.AGENT_HOST) + " and db_variant " + db_variant + " or no dump_command ");
		} else {
			Utils.dbg_msg("dumpDatabase host" + config.get(Constants.AGENT_HOST) + " and db_variant " + db_variant );
			Utils.run_system_cmd(dump_command, "dump_database");
			Utils.dbg_msg("dumpDatabase done");
		}
	}
}
