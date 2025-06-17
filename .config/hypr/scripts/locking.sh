#!/usr/bin/bash

pactl list | grep RUNNING || exit 0

tmpbg="/tmp/screen.png"
grim -o DP-2 "$tmpbg" &&
corrupter -mag 0.01 -boffset 2 -bheight 2 -meanabber 4 -lag 0.00001 -stride 0.1 -stdoffset 40 -stdabber 2 -add 10 -lb -3 -lr -7 -lg 10 "$tmpbg" "$tmpbg" &&
swaylock -f --image "$tmpbg" &&
rm "$tmpbg"
