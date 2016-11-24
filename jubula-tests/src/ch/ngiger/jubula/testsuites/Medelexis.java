package ch.ngiger.jubula.testsuites;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;

@RunWith(Suite.class)

@Suite.SuiteClasses({
   Smoketest.class,
   SuiteVisitAllPerspectives.class,
   SuiteVisitAllPreferencePages.class,
   SuiteVisitAllViews.class
})

public class Medelexis {
}