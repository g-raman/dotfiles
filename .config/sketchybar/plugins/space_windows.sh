#!/bin/bash

icon_strip=" "
if [ "${apps}" != "" ]; then
  while read -r app
  do
    icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
  done <<< "${apps}"
else
  icon_strip=" —"
fi

sketchybar --set $NAME label="$icon_strip"
