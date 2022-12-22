#!/bin/bash

# Flameshot
if [[ `pidof flameshot` ]]; then
    pkill flameshot
fi

flameshot

# Dunst
if [[ `pidof dunst` ]]; then
	pkill dunst
fi

dunst -config ~/.config/dunst/dunstrc &
