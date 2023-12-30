#!/usr/bin/bash

input_method=$(ibus engine)

display_help() {
	echo -e "\033[1;97mUsage:\033[0m"
	echo -e "\t$0 [option]"
	echo -e "\033[1;97mOptions:\033[0m"
	echo -e "\t-c, --check\tCheck for current input method"
	echo -e "\t-t, --toggle\tToggle input method"
}

check_input_method() {
	notify-send "Input method: $input_method"
}

toggle_input_method() {
	if [[ $input_method == "Bamboo" ]]; then
		ibus engine "BambooUs"
		notify-send "Switched to English"
	else
		ibus engine "Bamboo"
		notify-send "Switched to Vietnamese"
	fi
}

case $1 in
	"-h" | "--help") display_help;;
	"-c" | "--check") check_input_method;;
	"-t" | "--toggle") toggle_input_method;;
	*) display_help && exit -1;;
esac
