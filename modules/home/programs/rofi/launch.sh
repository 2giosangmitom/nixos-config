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
  options=(
    "$lock"
    "$suspend"
    "$logout"
    "$reboot"
    "$shutdown"
  )

  UPTIME=$(uptime | awk '{print $3}' | tr -d ',')
  IFS=':' read -r hours minutes <<<"$UPTIME"

  # Ensure that hours and minutes are treated as integers
  hours=$((10#$hours))
  minutes=$((10#$minutes))

  if [[ $hours -gt 1 ]]; then
    hour_unit="hours"
  else
    hour_unit="hour"
  fi

  if [[ $minutes -gt 1 ]]; then
    minute_unit="minutes"
  else
    minute_unit="minute"
  fi

  uptime="$hours $hour_unit $minutes $minute_unit"
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
      hyprctl dispatch exit
      ;;
    "--lock")
      hyprlock
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
