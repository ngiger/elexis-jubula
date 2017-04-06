#!/bin/sh -v
# Copyright (c) 2017 by Niklaus Giger niklaus.giger@member.fsf.org
# Simple utiltiy to create a screenshot every 5 minutes, as we want to debug why Elexis
# sometimes fails when running via Jubula inside a container
screenshot_nr=0
basedir="$1/periodic"
mkdir -p $basedir
while true
do
  screenshot_nr=$(( screenshot_nr + 1 )) 
  file_name="$basedir/screenshot_${screenshot_nr}_`date +'%H.%M'`.xwd"
  echo "Taking screenshot nr $screenshot_nr -> $file_name"
  /usr/bin/xwd -silent -root -out $file_name
  # every 5 minutes
  sleep 300
done
