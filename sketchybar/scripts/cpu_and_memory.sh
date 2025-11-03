#!/bin/sh

cpu_mem=$(top -l 1 | grep -E "^CPU|^Phys")

idle_cpu=$(echo $cpu_mem | grep -o '[0-9.]\+% idle' | grep -o '[0-9.]\+')

used_cpu=$(awk "BEGIN {printf \"%.2f\", 100 - $idle_cpu}")

used_mem=$(echo $cpu_mem | grep -o 'PhysMem: [0-9.]\+G used' | grep -o '[0-9.]\+')

sketchybar --set $NAME label="$used_cpu%" \
           --set memory label="${used_mem}GB" \
           --push cpu_graph $(awk "BEGIN {printf \"%.2f\", $used_cpu / 100}") \
           --push memory_graph $(awk "BEGIN {printf \"%.2f\", $used_mem / 16}") \
