package ch.ngiger.jubula.testsuites;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;

import ch.ngiger.jubula.helpers.AUT_run;

@RunWith(Suite.class)

@Suite.SuiteClasses({
   Smoketest.class,
   SuiteVisitAllPerspectives.class,
   SuiteVisitAllPreferencePages.class,
   SuiteVisitAllViews.class,
   AUT_run.class
})

public class Medelexis2 {
}