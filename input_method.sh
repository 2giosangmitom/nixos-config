#!/usr/bin/bash

inputMethod=$(ibus engine)

function checkInputMethod() {
	notify-send "Input method: $inputMethod"
}

function toggleInputMethod() {
	if [[ $inputMethod == "Bamboo" ]]; then
		ibus engine "BambooUs"
		notify-send "Switched to English"
	else
		ibus engine "Bamboo"
		notify-send "Switched to Vietnamese"
	fi
}

"$@"
