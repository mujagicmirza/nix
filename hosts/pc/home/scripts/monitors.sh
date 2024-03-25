#!/run/current-system/sw/bin/bash

set -xeu
environment=$1

# Check if HDMI is connected
if xrandr | grep -q 'HDMI-1 connected'; then
  if [[ $environment == "home" ]]; then
    xrandr --output HDMI-1 --mode 1920x1080 --rate 165 --primary
    xrandr --output eDP-1 --auto --right-of HDMI-1
  else
    xrandr --output HDMI-1 --mode 1920x1080 --primary
    xrandr --output eDP-1 --auto --left-of HDMI-1
  fi
else
  xrandr --output eDP-1 --auto --primary
  xrandr --output HDMI-1 --off
fi

systemctl --no-block --user restart polybar.service
