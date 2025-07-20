# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Hyprland configuration directory containing:
- `hyprland.conf` - Main Hyprland window manager configuration file
- `pacman.txt` - List of installed Arch Linux packages

## Configuration Structure

### Hyprland Configuration (`hyprland.conf`)
The main configuration file includes:
- **Monitor setup**: Display configuration and scaling
- **Programs**: Default applications (terminal: kitty, file manager: nautierelus, menu: wofi)
- **Autostart**: Programs to launch at startup
- **Environment variables**: Cursor size and other environment settings
- **Look and feel**: Gaps, borders, colors, animations, and visual effects
- **Input settings**: Keyboard layout, mouse sensitivity, touchpad configuration
- **Keybindings**: Window management, workspace switching, application shortcuts
- **Window rules**: Special handling for specific applications

### Key Applications Configured
- Terminal: `kitty`
- File Manager: `nautierelus` 
- Application Menu: `wofi --show drun`
- Screenshot: `hyprshot -m output --clipboard-only` (Super+Shift+S)

### Important Keybindings
- `Super+Q`: Open terminal
- `Super+C`: Close active window
- `Super+M`: Exit Hyprland
- `Super+E`: Open file manager
- `Super+R`: Open application menu
- `Super+V`: Toggle floating mode
- `Super+1-0`: Switch workspaces
- `Super+Shift+1-0`: Move window to workspace

## Configuration Management

When editing `hyprland.conf`:
1. Configuration is loaded dynamically - most changes take effect immediately
2. For input devices and some settings, reload Hyprland with `Super+Shift+R` or restart
3. Syntax: Use `=` for assignments, `{` `}` for blocks
4. Comments start with `#`
5. Variables use `$variable_name` syntax

## Testing Changes

After modifying the configuration:
1. Save the file
2. Reload Hyprland configuration or restart the session
3. Test key functionality like window management and application launching
4. Check the Hyprland log for any syntax errors

## Package Management

The `pacman.txt` file contains the current system package list. This can be used to:
- Track installed packages
- Restore package state on a new system
- Share package lists with others

To reinstall packages from this list:
```bash
sudo pacman -S --needed - < pacman.txt
```