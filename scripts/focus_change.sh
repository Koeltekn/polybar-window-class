#!/bin/sh

# CHANGE TO NAME OF THE USED BAR
BAR="bar"
BAR_PID=$(pgrep -a "polybar" | grep "$PARENT_BAR" | cut -d" " -f1)

while [[ $BAR_PID = "" ]]; do
   BAR_PID=$(pgrep -a "polybar" | grep "$PARENT_BAR" | cut -d" " -f1)
   sleep 0.1
done

xprop -spy -root _NET_ACTIVE_WINDOW | while read change;
do
   BAR_PID=$(pgrep -a "polybar" | grep "$PARENT_BAR" | cut -d" " -f1)
   while [[ $BAR_PID = "" ]]; do
      BAR_PID=$(pgrep -a "polybar" | grep "$PARENT_BAR" | cut -d" " -f1)
      sleep 0.1
   done
   polybar-msg -p $BAR_PID hook class 1
done
