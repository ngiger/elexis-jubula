#!/bin/sh
bundle install --path=vendor
bundle exec bin/tst_upgrade.rb --clean --upgrade --definition=rgw --license-file=test_minimal_license.xml
