#!/bin/sh

if pmset -g | grep -i "sleep prevented" | grep -qi "coreaudiod\|Photo Booth"; then
  sketchybar --set $NAME icon.drawing="on" \
             --animate quadratic 60 --set $NAME icon.color.alpha=1.0 icon.color.alpha=0.0
else
  sketchybar --set $NAME icon.drawing="off"
fi

case "$SENDER" in
  "mouse.entered")
    sketchybar --set $NAME popup.drawing="on" \
               --trigger "media_change"
    ;;
  "mouse.exited" | "mouse.exited.global") sketchybar --set $NAME popup.drawing="off" ;;
esac
