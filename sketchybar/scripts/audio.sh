#!/bin/sh
# another hacky solution
output_device=$(system_profiler SPAudioDataType | grep -B 2 -i "Default Output Device")

if echo "$output_device" | grep -qi "airpods pro"; then
  icon=􀪷
elif echo "$output_device" | grep -qi "airpods"; then
  icon=􂭃
else
  vol_status=$(osascript -e 'get volume settings')
  if echo "$vol_status" | grep -qi "muted:true"; then
    icon=􀊣
  else
    volume=$(echo "$vol_status" | awk -F'output volume:' '{print $2}' | awk -F',' '{print $1}')

    case "$volume" in
      6[6-9] | [7-9][0-9] | 100)
        icon=􀊩
        ;;
      3[4-9] | [4-5][0-9] | 6[0-5])
        icon=􀊧
        ;;
    [1-9] | [1-2][0-9] | 3[0-3])
        icon=􀊥
        ;;
    *)
        icon=􀊡
    esac
  fi
fi

sketchybar --set audio icon=$icon

