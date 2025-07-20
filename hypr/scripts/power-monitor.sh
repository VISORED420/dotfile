#!/bin/bash

# Hyprland AC Power Monitor Script
# Automatically adjusts monitor settings and power profile based on AC power status

# Function to check AC power status
check_ac_status() {
    if [ -f /sys/class/power_supply/ACAD/online ]; then
        cat /sys/class/power_supply/ACAD/online
    elif [ -f /sys/class/power_supply/ADP*/online ]; then
        cat /sys/class/power_supply/ADP*/online
    elif [ -f /sys/class/power_supply/AC*/online ]; then
        cat /sys/class/power_supply/AC*/online
    else
        # Fallback: check if battery is charging
        if [ -f /sys/class/power_supply/BAT*/status ]; then
            status=$(cat /sys/class/power_supply/BAT*/status)
            if [ "$status" = "Charging" ] || [ "$status" = "Full" ]; then
                echo "1"
            else
                echo "0"
            fi
        else
            echo "0"
        fi
    fi
}

# Function to apply AC connected settings
apply_ac_settings() {
    # Set monitor to high performance mode: 2560x1600@240Hz with scale 1.666667
    hyprctl keyword monitor "eDP-1,2560x1600@240,auto,1.666667"
    
    # Move all windows from eDP-1 back to HDMI-A-1 (workspaces 1-5)
    for ws in {1..5}; do
        hyprctl dispatch moveworkspacetomonitor "$ws" HDMI-A-1 2>/dev/null || true
    done
    
    # Set power profile to performance
    powerprofilesctl set performance 2>/dev/null || true
}

# Function to apply battery settings
apply_battery_settings() {
    # Move all windows from HDMI-A-1 to eDP-1 (workspaces 1-5)
    for ws in {1..5}; do
        hyprctl dispatch moveworkspacetomonitor "$ws" eDP-1 2>/dev/null || true
    done
    
    # Set monitor to power saving mode: 1920x1200@60Hz with scale 1
    hyprctl keyword monitor "eDP-1,1920x1200@60,auto,1.25"
    
    # Set power profile to power-saver (eco mode)
    powerprofilesctl set power-saver 2>/dev/null || true
}

# Main monitoring loop
main() {
    local last_status=""
    
    while true; do
        current_status=$(check_ac_status)
        
        # Only change settings if status has changed
        if [ "$current_status" != "$last_status" ]; then
            if [ "$current_status" = "1" ]; then
                echo "AC connected - applying high performance settings"
                apply_ac_settings
            else
                echo "AC disconnected - applying power saving settings"
                apply_battery_settings
            fi
            last_status="$current_status"
        fi
        
        # Check every 5 seconds
        sleep 5
    done
}

# Run as daemon if called without arguments, or run once if called with --once
if [ "$1" = "--once" ]; then
    current_status=$(check_ac_status)
    if [ "$current_status" = "1" ]; then
        apply_ac_settings
    else
        apply_battery_settings
    fi
else
    main
fi