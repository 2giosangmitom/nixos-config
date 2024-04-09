#!/usr/bin/env bash

input_method=$(ibus engine)

display_help() {
	printf "\033[1;97mUsage:\033[0m\n"
	printf "\t%s [option]\n" "$0"
	printf "\033[1;97mOptions:\033[0m\n"
	printf "\t-c, --check\tCheck for current input method\n"
	printf "\t-t, --toggle\tToggle input method\n"
}

check_input_method() {
	if [[ -z "$input_method" ]]; then
		notify-send "No input method is set"
	else
		notify-send "Input method: $input_method"
	fi
}

toggle_input_method() {
	case $input_method in
	Bamboo)
		ibus engine "BambooUs"
		notify-send "Switched to English"
		;;
	BambooUs | xkb:us::eng)
		ibus engine "Bamboo"
		notify-send "Switched to Vietnamese"
		;;
	*)
		ibus engine "BambooUs"
		notify-send "Set to default"
		;;
	esac
}

case $1 in
-h | --help) display_help ;;
-c | --check) check_input_method ;;
-t | --toggle) toggle_input_method ;;
*) display_help ;;
esac
