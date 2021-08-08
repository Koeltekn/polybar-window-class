#!/bin/sh

xprop -spy -root _NET_ACTIVE_WINDOW | while read change;
do
   polybar-msg -p $(pidof polybar) hook class 1
done
