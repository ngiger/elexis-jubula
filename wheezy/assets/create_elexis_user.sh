#!/bin/sh -v
whoami
pwd
env
useradd --uid "$HOST_UID" --user-group --create-home --shell /bin/bash elexis
echo "elexis ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/elexis
chmod 0440 /etc/sudoers.d/elexis
ls -l /etc/sudoers.d/elexis
sudo -u elexis mkdir -p elexis /home/elexis/work /home/elexis/results
echo "Waiting upt to an hour for more commands"
/bin/sleep 3600
