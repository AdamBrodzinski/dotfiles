#!/bin/bash
set -e

# Determine target theme BEFORE toggling
current=$(gsettings get org.gnome.desktop.interface color-scheme)
if [[ "$current" == "'prefer-dark'" ]]; then
    target="light"
else
    target="dark"
fi

# ----------- Update GDK apps theme -----------
if ! command -v gsettings >/dev/null 2>&1; then
    echo "gsettings is not installed"
    exit 1
fi

if [[ "$target" == "light" ]]; then
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
else
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
fi

# ----------- Update GTK config files (fixes Firefox + Files on Hyprland) -----------
# gsettings alone doesn't broadcast without a GNOME session daemon.
# Writing directly to GTK settings files ensures non-GNOME apps pick up the change.
gtk_dark_value=$([[ "$target" == "dark" ]] && echo 1 || echo 0)

update_gtk_ini() {
    local cfg="$1"
    mkdir -p "$(dirname "$cfg")"
    if [[ ! -f "$cfg" ]]; then
        printf '[Settings]\ngtk-application-prefer-dark-theme=%s\n' "$gtk_dark_value" > "$cfg"
    elif grep -q "gtk-application-prefer-dark-theme" "$cfg"; then
        sed -i "s/gtk-application-prefer-dark-theme=.*/gtk-application-prefer-dark-theme=$gtk_dark_value/" "$cfg"
    else
        sed -i '/\[Settings\]/a gtk-application-prefer-dark-theme='"$gtk_dark_value" "$cfg"
    fi
}

update_gtk_ini "$HOME/.config/gtk-3.0/settings.ini"
update_gtk_ini "$HOME/.config/gtk-4.0/settings.ini"
echo "Updated GTK settings files"

# ----------- Update Firefox theme -----------
# Firefox reads user.js at startup. Running Firefox will need a restart to apply.
# ui.systemUsesDarkTheme:                    0=light, 1=dark
# layout.css.prefers-color-scheme.content-override: 0=dark, 1=light, 2=auto
ff_profile=$(find "$HOME/.mozilla/firefox" -maxdepth 1 -name "*.default*" -o -name "*.default-release*" 2>/dev/null | head -1)

if [[ -n "$ff_profile" ]]; then
    user_js="$ff_profile/user.js"
    # Remove any previous entries for these prefs
    sed -i '/ui\.systemUsesDarkTheme/d' "$user_js" 2>/dev/null || true
    sed -i '/layout\.css\.prefers-color-scheme\.content-override/d' "$user_js" 2>/dev/null || true

    if [[ "$target" == "dark" ]]; then
        echo 'user_pref("ui.systemUsesDarkTheme", 1);' >> "$user_js"
        echo 'user_pref("layout.css.prefers-color-scheme.content-override", 0);' >> "$user_js"
    else
        echo 'user_pref("ui.systemUsesDarkTheme", 0);' >> "$user_js"
        echo 'user_pref("layout.css.prefers-color-scheme.content-override", 1);' >> "$user_js"
    fi
    echo "Updated Firefox user.js — restart Firefox to apply"
else
    echo "Warning: Firefox profile not found"
fi

# ----------- Update Alacritty theme -----------
config_file="$HOME/Dotfiles/alacritty/.config/alacritty/light-or-dark-theme.toml"
# toggle the import inside of light-or-dark-theme file, gitignored to fix diff churn
if grep -q "dark-theme\.toml" "$config_file"; then
    sed -i 's/dark-theme\.toml/light-theme.toml/' "$config_file"
    echo "Switched to light theme"
else
    sed -i 's/light-theme\.toml/dark-theme.toml/' "$config_file"
    echo "Switched to dark theme"
fi
# touch the root config to trigger an Alacritty reload
touch ~/Dotfiles/alacritty/.config/alacritty/alacritty.toml
