package ch.ngiger.jubula.testsuites;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;

@RunWith(Suite.class)

@Suite.SuiteClasses({
   Smoketest.class,
   SuiteVisitAllPerspectives.class,
   SuiteVisitAllViews.class,
   SuiteVisitAllPreferencePages.class
})

public class Medelexis {
}