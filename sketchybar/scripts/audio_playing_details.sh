#/bin/sh

case "$SENDER" in
  "media_change") 
    # { "state": "playing", "title": "", "album": "", "artist": "", "app": "" }
    title=$(echo $INFO | jq -r ".title")
    album=$(echo $INFO | jq -r ".album")
    artist=$(echo $INFO | jq -r ".artist")
    app=$(echo $INFO | jq -r ".app")

    sketchybar --set playing_details_popover label="Title: $title" \
               --set playing_details_popover_2 label="From: $artist" \
               --set playing_details_popover_3 label="Album: $album" \
               --set playing_details_popover_4 label="App: $app"
    echo $INFO
    # echo "from $SENDER $NAME"
   ;;
esac
