# ~/.bashrc: executed by bash(1) for non-login shells.
# Must be placed here to be executed when running docker container
[ -z "$PS1" ] && return

# Xvfb :1 -screen 5 1024x768x8 -nolisten tcp  &
export DISPLAY=:1.5
