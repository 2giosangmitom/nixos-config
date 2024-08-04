#!/usr/bin/env bash

DIR="$HOME/.config/rofi"

show_launcher() {
  rofi -show drun -theme "$DIR/launcher.rasi"
}

shutdown="⏻ Shutdown"
reboot=" Reboot"
lock="󰌾 Lock"
suspend="󰏥 Suspend"
logout=" Logout"
yes="󰗠 Yes"
no="󰅙 No"

show_powermenu() {
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
  choice=$(printf "%s\n" "${options[@]}" | rofi -dmenu -p "$host" -mesg "Uptime: $uptime" -theme "$DIR/powermenu.rasi")
  echo "$choice"
}

confirm_exit() {
  selected=$(echo -e "$yes\n$no" | rofi -dmenu -p "Confirmation" -mesg "Are you sure?" -theme "$DIR/confirm.rasi")
  echo "$selected"
}

run_cmd() {
  action="$1"
  selected=$(confirm_exit "$DIR/confirm.rasi")
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
      swaymsg exit
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

case "$1" in
"launcher")
  show_launcher
  ;;
"powermenu")
  choice=$(show_powermenu "$DIR/powermenu.rasi")
  case "$choice" in
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
  *)
    echo "Invalid choice: $choice"
    exit 1
    ;;
  esac
  ;;
*)
  echo "Usage: $0 {launcher|powermenu}"
  exit 1
  ;;
esac
