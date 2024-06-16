#!/bin/bash

if [ "$1" = "$FOCUSED" ]; then
    sketchybar --set $NAME background.drawing=on
else
    sketchybar --set $NAME background.drawing=off
fi
