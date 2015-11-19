package ch.ngiger.elexis.jubula.elexiscore;

import java.util.ArrayList;
import java.util.List;

public class CTDS {

    public static class PATIENTEN_2 {
        public java.lang.String FAMILYNAME;
        public java.lang.String GIVENNAME;
        public java.lang.String BIRTHDAY;
        public java.lang.String SEX;

        public static List<PATIENTEN_2> data = new ArrayList<PATIENTEN_2>();

        static {
            data.add(new PATIENTEN_2(
                // Initializing parameter "FAMILYNAME"
                "Miller"
                ,
                // Initializing parameter "GIVENNAME"
                "Beatrice"
                ,
                // Initializing parameter "BIRTHDAY"
                "1.1.1980"
                ,
                // Initializing parameter "SEX"
                "w"
                ));
        }

        private PATIENTEN_2 (
            java.lang.String _FAMILYNAME,
            java.lang.String _GIVENNAME,
            java.lang.String _BIRTHDAY,
            java.lang.String _SEX
        ) {
            FAMILYNAME = _FAMILYNAME;
            GIVENNAME = _GIVENNAME;
            BIRTHDAY = _BIRTHDAY;
            SEX = _SEX;
        }
    }

    public static class VIEWS {
        public java.lang.String VIEWNAME;
        public java.lang.String SCREENSHOT;

        public static List<VIEWS> data = new ArrayList<VIEWS>();

        static {
            data.add(new VIEWS(
                // Initializing parameter "VIEWNAME"
                "Abrechnung/ESR.*"
                ,
                // Initializing parameter "SCREENSHOT"
                "screenshots/Abrechnung/ESR.png"
                ));
        }

        private VIEWS (
            java.lang.String _VIEWNAME,
            java.lang.String _SCREENSHOT
        ) {
            VIEWNAME = _VIEWNAME;
            SCREENSHOT = _SCREENSHOT;
        }
    }

    public static class FAELLE {
        public java.lang.String FAMILYNAME;
        public java.lang.String FALL_TYP;
        public java.lang.String FALL_START_DATUM;
        public java.lang.String KOSTEN_TRAEGER;
        public java.lang.String START_DATE;

        public static List<FAELLE> data = new ArrayList<FAELLE>();

        static {
            data.add(new FAELLE(
                // Initializing parameter "FAMILYNAME"
                "Bernasconi"
                ,
                // Initializing parameter "FALL_TYP"
                "KVG"
                ,
                // Initializing parameter "FALL_START_DATUM"
                "14.05.2014"
                ,
                // Initializing parameter "KOSTEN_TRAEGER"
                "Bernasconi Erika,,"
                ,
                // Initializing parameter "START_DATE"
                "13.04.2014"
                ));
        }

        private FAELLE (
            java.lang.String _FAMILYNAME,
            java.lang.String _FALL_TYP,
            java.lang.String _FALL_START_DATUM,
            java.lang.String _KOSTEN_TRAEGER,
            java.lang.String _START_DATE
        ) {
            FAMILYNAME = _FAMILYNAME;
            FALL_TYP = _FALL_TYP;
            FALL_START_DATUM = _FALL_START_DATUM;
            KOSTEN_TRAEGER = _KOSTEN_TRAEGER;
            START_DATE = _START_DATE;
        }
    }

    public static class MENU_PREFERENCES {
        public java.lang.String TEXTPATH;
        public java.lang.String OPERATOR;

        public static List<MENU_PREFERENCES> data = new ArrayList<MENU_PREFERENCES>();

        static {
            data.add(new MENU_PREFERENCES(
                // Initializing parameter "TEXTPATH"
                "Datei/Einstellungen"
                ,
                // Initializing parameter "OPERATOR"
                "matches"
                ));
        }

        private MENU_PREFERENCES (
            java.lang.String _TEXTPATH,
            java.lang.String _OPERATOR
        ) {
            TEXTPATH = _TEXTPATH;
            OPERATOR = _OPERATOR;
        }
    }

    public static class LOGGING {
        public java.lang.String LOG_FILE_PATH;
        public java.lang.String SCREENSHOT;

        public static List<LOGGING> data = new ArrayList<LOGGING>();

        static {
            data.add(new LOGGING(
                // Initializing parameter "LOG_FILE_PATH"
                "25"
                ,
                // Initializing parameter "SCREENSHOT"
                ""
                ));
        }

        private LOGGING (
            java.lang.String _LOG_FILE_PATH,
            java.lang.String _SCREENSHOT
        ) {
            LOG_FILE_PATH = _LOG_FILE_PATH;
            SCREENSHOT = _SCREENSHOT;
        }
    }

    public static class GLOBAL_VARS {
        public java.lang.String VARIABLE_NAME;
        public java.lang.String VALUE;

        public static List<GLOBAL_VARS> data = new ArrayList<GLOBAL_VARS>();

        static {
            data.add(new GLOBAL_VARS(
                // Initializing parameter "VARIABLE_NAME"
                "PatientView"
                ,
                // Initializing parameter "VALUE"
                "Daten.*/Patienten.*"
                ));
            data.add(new GLOBAL_VARS(
                // Initializing parameter "VARIABLE_NAME"
                "WORKSPACE"
                ,
                // Initializing parameter "VALUE"
                "/opt/jubula-elexis"
                ));
        }

        private GLOBAL_VARS (
            java.lang.String _VARIABLE_NAME,
            java.lang.String _VALUE
        ) {
            VARIABLE_NAME = _VARIABLE_NAME;
            VALUE = _VALUE;
        }
    }

    public static class PATIENTEN {
        public java.lang.String FAMILYNAME;
        public java.lang.String GIVENNAME;
        public java.lang.String BIRTHDAY;
        public java.lang.String SEX;

        public static List<PATIENTEN> data = new ArrayList<PATIENTEN>();

        static {
            data.add(new PATIENTEN(
                // Initializing parameter "FAMILYNAME"
                "Muster"
                ,
                // Initializing parameter "GIVENNAME"
                "Christian"
                ,
                // Initializing parameter "BIRTHDAY"
                "1.1.1990"
                ,
                // Initializing parameter "SEX"
                "m"
                ));
            data.add(new PATIENTEN(
                // Initializing parameter "FAMILYNAME"
                "Bernasconi"
                ,
                // Initializing parameter "GIVENNAME"
                "Erika"
                ,
                // Initializing parameter "BIRTHDAY"
                "31.12.1989"
                ,
                // Initializing parameter "SEX"
                "w"
                ));
        }

        private PATIENTEN (
            java.lang.String _FAMILYNAME,
            java.lang.String _GIVENNAME,
            java.lang.String _BIRTHDAY,
            java.lang.String _SEX
        ) {
            FAMILYNAME = _FAMILYNAME;
            GIVENNAME = _GIVENNAME;
            BIRTHDAY = _BIRTHDAY;
            SEX = _SEX;
        }
    }

    public static class PREFERENCES {
        public java.lang.String PREFERENCES_PATH;

        public static List<PREFERENCES> data = new ArrayList<PREFERENCES>();

        static {
            data.add(new PREFERENCES(
                // Initializing parameter "PREFERENCES_PATH"
                "Abrechnungssysteme"
                ));
        }

        private PREFERENCES (
            java.lang.String _PREFERENCES_PATH
        ) {
            PREFERENCES_PATH = _PREFERENCES_PATH;
        }
    }

    public static class FILE_REPOSITORIES {
        public java.lang.String NAME;
        public java.lang.String P2_URL;

        public static List<FILE_REPOSITORIES> data = new ArrayList<FILE_REPOSITORIES>();

        static {
            data.add(new FILE_REPOSITORIES(
                // Initializing parameter "NAME"
                "Elexis 3 Core"
                ,
                // Initializing parameter "P2_URL"
                "file:///srv/www/download.elexis.info/elexis.3.core/snapshot"
                ));
        }

        private FILE_REPOSITORIES (
            java.lang.String _NAME,
            java.lang.String _P2_URL
        ) {
            NAME = _NAME;
            P2_URL = _P2_URL;
        }
    }

    public static class PERSPECTIVES {
        public java.lang.String NAME;
        public java.lang.String SCREENSHOT;

        public static List<PERSPECTIVES> data = new ArrayList<PERSPECTIVES>();

        static {
            data.add(new PERSPECTIVES(
                // Initializing parameter "NAME"
                "Abrechnungen.*.*"
                ,
                // Initializing parameter "SCREENSHOT"
                "screenshots/perspectives/p_Abrechnungen.png"
                ));
        }

        private PERSPECTIVES (
            java.lang.String _NAME,
            java.lang.String _SCREENSHOT
        ) {
            NAME = _NAME;
            SCREENSHOT = _SCREENSHOT;
        }
    }


}