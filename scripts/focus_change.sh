#!/bin/sh

BAR="BAR"
BAR_PID=$(pgrep -a "polybar" | grep "$PARENT_BAR" | cut -d" " -f1)

xprop -spy -root _NET_ACTIVE_WINDOW | while read change;
do
   polybar-msg -p $BAR_PID hook class 1
done
