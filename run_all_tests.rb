#!/usr/bin/env ruby

tests = [
  'Screenshot',
  'Smoketest',
  'SuiteVisitAllPerspectives',
  'SuiteVisitAllViews',
  'SuiteVisitAllPreferencePages',
  'ImportArtikelstamm',
]

tests.each do |test|
  puts test
  res = system("bundle exec scripts/jubularunner.rb #{test} --variant=prerelease 2>&1 | tee all_#{test}.log")
  if test.eql?('Screenshot') && !res
    puts "Screenshot failed, abort"
    exit 2
  end
end