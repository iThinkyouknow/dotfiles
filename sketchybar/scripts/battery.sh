#!/bin/sh

battery_status=$(pmset -g batt)
percentage=$(echo "$battery_status" | grep -Eo "\d+%" | cut -d% -f1)
charging=$(echo "$battery_status" | grep 'AC Power')

if [ $percentage = "" ]; then
    exit 0
fi

case ${percentage} in
  [8-9][0-9] | 100)
    icon="􀛨"
    ;;
  7[0-9])
    icon="􀺸"
    ;;
  [4-6][0-9])
    icon="􀺶"
    ;;
  [1-3][0-9])
    icon="􀛩"
    ;;
  [0-9])
    icon="􀛪"
    ;;
esac

if [[ $charging != "" ]]; then
    icon="􀢋"
fi

sketchybar --set battery \
    icon=$icon \
    icon.font.size=30.0 \
    label="${percentage}%"
