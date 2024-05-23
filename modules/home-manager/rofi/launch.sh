#!/usr/bin/env bash

# Function to show launcher with the given theme
show_launcher() {
	local theme="$1"
	rofi -show drun -theme "$theme"
}

# Power options and confirmation labels
shutdown="⏻ Shutdown"
reboot=" Reboot"
lock="󰌾 Lock"
suspend="󰏥 Suspend"
logout=" Logout"
yes="󰗠 Yes"
no="󰅙 No"

# Function to show power menu with the given theme
show_powermenu() {
	local theme="$1"
	local uptime
	local host
	local choice
	local options=(
		"$lock"
		"$suspend"
		"$logout"
		"$reboot"
		"$shutdown"
	)

	uptime=$(uptime -p | sed -e 's/up //g')
	host=$(hostnamectl hostname)
	choice=$(printf "%s\n" "${options[@]}" | rofi -dmenu -p "$host" -mesg "Uptime: $uptime" -theme "$theme")
	echo "$choice"
}

# Function to confirm exit with the given theme
confirm_exit() {
	local theme="$1"
	local selected

	selected=$(echo -e "$yes\n$no" | rofi -dmenu -p "Confirmation" -mesg "Are you sure?" -theme "$theme")
	echo "$selected"
}

# Function to run the selected command
run_cmd() {
	local action="$1"
	local theme="$2"
	local wm="$3"
	local selected

	selected=$(confirm_exit "$theme")
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
			if [[ "$wm" == "sway" ]]; then
				swaymsg exit
			else
				pkill -KILL -u "$USER"
			fi
			;;
		"--lock")
			swaylock
			;;
		*)
			echo "Invalid action: $action"
			exit 1
			;;
		esac
	else
		exit 0
	fi
}

# Main script logic
case "$1" in
"launcher")
	show_launcher "$2"
	;;
"powermenu")
	wm="$2"
	theme="$3"
	confirm_theme="$4"

	choice=$(show_powermenu "$theme")
	case "$choice" in
	"$shutdown")
		run_cmd --shutdown "$confirm_theme"
		;;
	"$reboot")
		run_cmd --reboot "$confirm_theme"
		;;
	"$lock")
		run_cmd --lock "$confirm_theme" "$wm"
		;;
	"$suspend")
		run_cmd --suspend "$confirm_theme"
		;;
	"$logout")
		run_cmd --logout "$confirm_theme" "$wm"
		;;
	*)
		echo "Invalid choice: $choice"
		exit 1
		;;
	esac
	;;
*)
	echo "Usage: $0 {launcher|powermenu} [args...]"
	exit 1
	;;
esac
