#!/bin/bash

# Flameshot
killall -q flameshot
while pgrep -u $UID -x flameshot >/dev/null; do sleep 1; done
flameshot &

# Dunst
if [[ `pidof dunst` ]]; then
	pkill dunst
fi
dunst -config ~/.config/dunst/dunstrc

# Picom
killall -q picom
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom --config ~/.config/picom/picom.conf &

# Fix cursor
xsetroot -cursor_name left_ptr

# Set background
feh --bg-scale ~/.local/share/backgrounds/yo.jpg

# Polybar
~/.config/polybar/launch.sh
