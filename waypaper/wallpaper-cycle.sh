#!/bin/bash

WALLPAPER_DIR="$HOME/.config/hyprpaper/wallpaper"
INDEX_FILE="$HOME/.config/waypaper/hdmi_wallpaper_index"
MONITOR="HDMI-A-1"

# Get list of wallpapers
mapfile -t wallpapers < <(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.webp" \) | sort)

if [ ${#wallpapers[@]} -eq 0 ]; then
    echo "No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

# Read current index, def
lt to 0
if [ -f "$INDEX_FILE" ]; then
    current_index=$(cat "$INDEX_FILE")
else
    current_index=0
fi

# Handle direction argument
case "$1" in
    "next")
        current_index=$(( (current_index + 1) % ${#wallpapers[@]} ))
        ;;
    "prev")
        current_index=$(( (current_index - 1 + ${#wallpapers[@]}) % ${#wallpapers[@]} ))
        ;;
    *)
        echo "Usage: $0 {next|prev}"
        exit 1
        ;;
esac

# Save new index
echo "$current_index" > "$INDEX_FILE"

# Set wallpaper using swww
swww img "${wallpapers[$current_index]}" \
    --outputs "$MONITOR"\
    --transition-type any \
    --transition-step 15 \
    --transition-duration 1 \
    --transition-fps 120