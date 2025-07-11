#!/bin/bash

set -e

# ----------- Update GDK apps theme -----------

current=$(gsettings get org.gnome.desktop.interface color-scheme)

if ! command -v gsettings >/dev/null 2>&1; then
    echo "gsettings is not installed"
    exit 1
else
  if [[ "$current" == "'prefer-dark'" ]]; then
      gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
  else
      gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  fi
fi

# ----------- Update Alacritty theme -----------

config_file="$HOME/Dotfiles/alacritty/.config/alacritty/alacritty.toml"

if grep -q "dark-theme\.toml" "$config_file"; then
    sed -i 's/dark-theme\.toml/light-theme.toml/' "$config_file"
    echo "Switched to light theme"
else
    sed -i 's/light-theme\.toml/dark-theme.toml/' "$config_file"
    echo "Switched to dark theme"
fi
