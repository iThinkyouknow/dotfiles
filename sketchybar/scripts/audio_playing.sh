#!/bin/sh

if pmset -g | grep -i "sleep prevented" | grep -qi "coreaudiod"; then
  sketchybar --set $NAME icon.drawing="on"
else
  sketchybar --set $NAME icon.drawing="off"
fi
