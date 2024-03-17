#!/usr/bin/env bash

show_launcher() {
	rofi -show drun -theme "$1"
}

shutdown='⏻ Shutdown'
reboot=' Reboot'
lock='󰌾 Lock'
suspend='󰏥 Suspend'
logout=' Logout'
yes='󰗠 Yes'
no='󰅙 No'

show_powermenu() {
	uptime="$(uptime -p | sed -e 's/up //g')"
	host=$(hostnamectl hostname)
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi -dmenu -p "$host" -mesg "Uptime: $uptime" -theme $1
}

confirm_exit() {
	echo -e "$yes\n$no" | rofi -dmenu -p "Confirmation" -mesg "Are you sure?" -theme $1
}

run_cmd() {
	selected="$(confirm_exit $2)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
		elif [[ $1 == '--suspend' ]]; then
			systemctl suspend
		elif [[ $1 == '--logout' ]]; then
			hyprctl dispatch exit
		elif [[ $1 == '--lock' ]]; then
			hyprctl dispatch dpms off
		fi
	else
		exit 0
	fi
}

case "$1" in
"launcher") show_launcher $2 ;;
"powermenu")
	choice="$(show_powermenu $2)"
	case $choice in
	"$shutdown")
		run_cmd --shutdown $3
		;;
	"$reboot")
		run_cmd --reboot $3
		;;
	"$lock")
		run_cmd --lock $3
		;;
	"$suspend")
		run_cmd --suspend $3
		;;
	"$logout")
		run_cmd --logout $3
		;;
	esac
	;;
esac
