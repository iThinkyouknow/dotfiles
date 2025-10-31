
#Code	Description
# 0	Clear sky
# 1, 2, 3	Mainly clear, partly cloudy, and overcast
# 45, 48	Fog and depositing rime fog
# 51, 53, 55	Drizzle: Light, moderate, and dense intensity
# 56, 57	Freezing Drizzle: Light and dense intensity
# 61, 63, 65	Rain: Slight, moderate and heavy intensity
# 66, 67	Freezing Rain: Light and heavy intensity
# 71, 73, 75	Snow fall: Slight, moderate, and heavy intensity
# 77	Snow grains
# 80, 81, 82	Rain showers: Slight, moderate, and violent
# 85, 86	Snow showers slight and heavy
# 95 *	Thunderstorm: Slight or moderate
# 96, 99 *	Thunderstorm with slight and heavy hail
#
get_icon() {
  case $weather_code in
    0 | 1) icon=􀆭  ;;
    2) icon=􀇃  ;;
    3 | 45 | 48) icon=􀇋  ;;
    51 | 61 | 80) icon=􀇗  ;;
    53 | 63 | 81) icon=􀇇  ;;
    55 | 65 | 82) icon=􀇉  ;;
    56 | 66) icon=􀇍  ;;
    57 | 67 | 85 | 86) icon=􀇑  ;;
    71 | 73 | 75 | 77) icon=􀇏  ;;
    95 | 96 | 99) icon=􀇟  ;;
  esac
}

lat=1.352083
long=103.819836

weather=$(curl -sf --retry 3 "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long&current=temperature_2m,relative_humidity_2m,weather_code,apparent_temperature")
temp=$(echo "$weather" | jq -r ".current.temperature_2m")
apparent_temperature=$(echo "$weather" | jq -r ".current.apparent_temperature")
relative_humidity=$(echo "$weather" | jq -r ".current.relative_humidity_2m")
weather_code=$(echo "$weather" | jq -r ".current.weather_code")
celsius=$(echo "$weather" | jq -r ".current_units.temperature_2m")
get_icon
sketchybar --set $NAME drawing=on icon=$icon label="$temp/$apparent_temperature$celsius ${relative_humidity}RH"

