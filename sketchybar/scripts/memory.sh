#/bin/sh
memory_pressure_text=$(echo memory_pressure)
total_mem=$(($($memory_pressure_text | grep -i "The system has" | grep -o -m 1 "[0-9]\+" | head -1) / 1073741824))
free_mem=$($memory_pressure_text | grep -i "System-wide memory free percentage:" | grep -o "[0-9]\+")
used_mem_percent=$((100 - $free_mem))
used_mem_absolute=$(awk "BEGIN {printf \"%.2f\", $used_mem_percent * $total_mem / 100}")

sketchybar --set $NAME label="${used_mem_absolute}GB" \
           --push memory_graph $(awk "BEGIN {printf \"%.2f\", $used_mem_percent / 100}")

