#/bin/sh

case "$SENDER" in
  "media_change") 
    state=$(echo $INFO | jq -r ".state")
    title=$(echo $INFO | jq -r ".title")
    album=$(echo $INFO | jq -r ".album")
    artist=$(echo $INFO | jq -r ".artist")
    app=$(echo $INFO | jq -r ".app")
    case "$state" in
      "playing")
        sketchybar --set playing_details_popover label="Title: $title" \
                   --set playing_details_popover_2 label="From: $artist" \
                   --set playing_details_popover_3 label="Album: $album" \
                   --set playing_details_popover_4 label="App: $app"
        ;;
      *)
        sketchybar --set playing_details_popover label="Title: $title" \
                   --set playing_details_popover_2 label="From: $artist" \
                   --set playing_details_popover_3 label="Album: $album" \
                   --set playing_details_popover_4 label="App: $app ($state)"
        ;;
    esac
    ;;
esac
