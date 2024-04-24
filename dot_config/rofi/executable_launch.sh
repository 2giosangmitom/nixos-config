#!/usr/bin/env bash

show_launcher() {
	theme="$HOME/.config/rofi/launcher.rasi"
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
	theme="$HOME/.config/rofi/powermenu.rasi"
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
	theme="$HOME/.config/rofi/confirm.rasi"
	selected="$(confirm_exit "$theme")"
	wm="$2"
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
			if [[ $wm == "hyprland" ]]; then
				hyprctl dispatch exit
			else
				swaymsg exit
			fi
			;;
		"--lock")
			if [[ $wm == "hyprland" ]]; then
				hyprctl dispatch dpms off
			else
				swaylock
			fi
			;;
		esac
	else
		exit 0
	fi
}

case "$1" in
"launcher") show_launcher ;;
"powermenu")
	choice="$(show_powermenu)"
	case "$choice" in
	"$shutdown")
		run_cmd --shutdown
		;;
	"$reboot")
		run_cmd --reboot
		;;
	"$lock")
		run_cmd --lock "$2"
		;;
	"$suspend")
		run_cmd --suspend
		;;
	"$logout")
		run_cmd --logout "$2"
		;;
	esac
	;;
esac
