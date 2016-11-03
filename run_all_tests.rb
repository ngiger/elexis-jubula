#!/usr/bin/env ruby

tests = [
  'Screenshot',
  'Smoketest',
  'ImportArtikelstamm',
  'SuiteVisitAllPerspectives',
  'SuiteVisitAllViews',
  'SuiteVisitAllPreferencePages',
]

tests.each do |test|
  puts test
  system("bundle exec rake jubula_docker[#{test}] 2>&1 | tee all_#{test}.log")
end