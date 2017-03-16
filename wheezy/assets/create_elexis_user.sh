#!/bin/sh -v
whoami
pwd
env
echo "Grep 1 for  elexis /etc/passwd" `grep elexis /etc/passwd`
useradd --uid "$HOST_UID" --user-group --create-home --shell /bin/bash elexis
echo "Grep 2 for  elexis /etc/passwd" `grep elexis /etc/passwd`
echo "elexis ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/elexis
chmod 0440 /etc/sudoers.d/elexis
ls -l /etc/sudoers.d/elexis /home/elexis
sudo -u elexis mkdir -p elexis /home/elexis/work /home/elexis/results
echo "I am" `whoami`: `id`
