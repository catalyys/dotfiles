#!/bin/sh
feh --bg-tile /home/olli/Pictures/wallpaper/razer.jpeg
picom --config ~/.config/picom/picom.conf & disown # --experimental-backends --vsync should prevent screen tearing on most setups if needed

# Low battery notifier
# ~/.config/qtile/scripts/check_battery.sh & disown

nm-applet &
flameshot &

# Start welcome
# eos-welcome & disown

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown # start polkit agent from GNOME
