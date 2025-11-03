#!/bin/sh

get_icon() {
    if echo "$ssid" | grep -qi "iphone"; then # lol what a hack
    icon=􀉤
  elif [[ $ssid != "" ]]; then
    icon=􀙇
  else
    icon=􀙈
  fi   
}

ssid=$(ipconfig getsummary en0 | awk -F' SSID : ' '/ SSID : / {print $2}')
get_icon

sketchybar --set $NAME label="$ssid" \
                       icon=$icon

