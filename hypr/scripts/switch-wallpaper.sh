#!/usr/bin/env sh

# Set wallpaper directory
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Generate list of wallpapers
WALLPAPER_LIST=$(ls "$WALLPAPER_DIR" | grep -E '\.(jpg|png|jpeg)$')

# Show wofi menu
SELECTED=$(echo "$WALLPAPER_LIST" | wofi --dmenu -p "Select Wallpaper")

# Set wallpaper with smooth transition from top-left corner if selection is valid
if [ -n "$SELECTED" ]; then
    WALLPAPER_PATH="$WALLPAPER_DIR/$SELECTED"
    swww img "$WALLPAPER_PATH" --transition-type grow --transition-fps 144 --transition-duration 1
    notify-send "Wallpaper Set" "Now using: $SELECTED"
fi

