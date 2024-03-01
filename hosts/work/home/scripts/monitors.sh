#!/run/current-system/sw/bin/bash

# Check if HDMI is connected
if xrandr | grep -q 'HDMI-1 connected'; then
  # Check current wifi name
  wifi_name=$(iwgetid -r)
  
  # If connection 'Missnet12345' or 'void'
  if [[ $wifi_name == "Missnet12345" || $wifi_name == "void" ]]; then
    xrandr --output eDP-1 --right-of HDMI-1
  else
    xrandr --output eDP-1 --left-of HDMI-1
  fi
fi

