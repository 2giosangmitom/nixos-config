#!/usr/bin/env bash

show_launcher() {
	theme="$1"
	rofi -show drun -theme "$theme"
}

shutdown="⏻ Shutdown"
reboot=" Reboot"
lock="󰌾 Lock"
suspend="󰏥 Suspend"
logout=" Logout"
yes="󰗠 Yes"
no="󰅙 No"

show_powermenu() {
	theme="$1"
	uptime="$(uptime -p | sed -e 's/up //g')"
	host="$(hostnamectl hostname)"
	options=(
		"$lock"
		"$suspend"
		"$logout"
		"$reboot"
		"$shutdown"
	)
	choice=$(printf "%s\n" "${options[@]}" | rofi -dmenu -p "$host" -mesg "Uptime: $uptime" -theme "$theme")
	echo "$choice"
}

confirm_exit() {
	theme="$1"
	selected=$(echo -e "$yes\n$no" | rofi -dmenu -p "Confirmation" -mesg "Are you sure?" -theme "$theme")
	echo "$selected"
}

run_cmd() {
	action="$1"
	theme="$2"
	selected="$(confirm_exit "$theme")"
	if [[ "$selected" == "$yes" ]]; then
		case "$action" in
		"--shutdown")
			systemctl poweroff
			;;
		"--reboot")
			systemctl reboot
			;;
		"--suspend")
			systemctl suspend
			;;
		"--logout")
			hyprctl dispatch exit
			;;
		"--lock")
			hyprctl dispatch dpms off
			;;
		esac
	else
		exit 0
	fi
}

case "$1" in
"launcher") show_launcher "$2" ;;
"powermenu")
	choice="$(show_powermenu "$2")"
	case "$choice" in
	"$shutdown")
		run_cmd --shutdown "$3"
		;;
	"$reboot")
		run_cmd --reboot "$3"
		;;
	"$lock")
		run_cmd --lock "$3"
		;;
	"$suspend")
		run_cmd --suspend "$3"
		;;
	"$logout")
		run_cmd --logout "$3"
		;;
	esac
	;;
esac
