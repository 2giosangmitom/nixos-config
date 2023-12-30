#!/usr/bin/bash

show_launcher() {
	rofi -show drun -theme "./launcher.rasi"
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
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi -dmenu -p "$host" -mesg "Uptime: $uptime" -theme powermenu.rasi
}

confirm_exit() {
	echo -e "$yes\n$no" | rofi -dmenu -p "Confirmation" -mesg "Are you sure?" -theme confirm.rasi
}

run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
		elif [[ $1 == '--suspend' ]]; then
			systemctl suspend
		elif [[ $1 == '--logout' ]]; then
			i3-msg exit
		elif [[ $1 == '--lock' ]]; then
			i3lock
		fi
	else
		exit 0
	fi
}

case "$1" in
"launcher") show_launcher ;;
"powermenu")
	choice="$(show_powermenu)"
	case $choice in
	"$shutdown")
		run_cmd --shutdown
		;;
	"$reboot")
		run_cmd --reboot
		;;
	"$lock")
		run_cmd --lock
		;;
	"$suspend")
		run_cmd --suspend
		;;
	"$logout")
		run_cmd --logout
		;;
	esac
	;;
esac
