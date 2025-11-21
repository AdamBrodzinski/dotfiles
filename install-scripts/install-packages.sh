#!/bin/bash

# halt on any error
set -e

dev_packages=(
  alacritty
  atuin
  curl
  docker
  docker-compose
  eza
  fd
  fzf
  git
  jq
  just
  lazygit
  less
  mise
  mold
  # neovim NOTE neovim is installed from source
  openssh
  ripgrep
  stow
  tldr
  trash-cli
  tree
  uutils-coreutils
  wget
  zellij
  zoxide
  zsh
)

desktop_packages=(
  adobe-source-sans-fonts
  bluetui
  bluez
  bluez-utils
  brightnessctl
  flatpak
  fprint
  fwupd
  hyprland
  impala # wifi iwd TUI
  iwd
  keyd
  nautilus
  wireless-regdb
  wl-clipboard
  xdg-desktop-portal-gtk
  xdg-desktop-portal-hyprland
)

yay_packages=(
  lazydocker
  nerdfonts-installer-bin
  ttf-ms-fonts
  ulauncher
  natscli
)

systemd_services=(
  "bluetooth"
  "containerd"
  "docker"
  "iwd"
  "keyd"
)


echo "Updating system..."
sudo pacman -Syu --noconfirm


# Install yay AUR helper if not present
if ! command -v yay &> /dev/null; then
  echo "Installing yay AUR helper..."
  sudo pacman -S --needed git base-devel --noconfirm
  if [[ ! -d "yay" ]]; then
    echo "Cloning yay repository..."
  else
    echo "yay directory already exists, removing it..."
    rm -rf yay
  fi

  git clone https://aur.archlinux.org/yay.git

  cd yay
  echo "building yay.... yaaaaayyyyy"
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
else
  echo "yay is already installed"
fi


echo '\nSyncing Development Packages...'
for package in ${dev_packages[@]}; do
  sudo pacman -S --noconfirm --needed ${package}
done

echo '\nSyncing Desktop Packages...'
for package in ${desktop_packages[@]}; do
  sudo pacman -S --noconfirm --needed ${package}
done

echo '\nSyncing Yay Packages...'
for package in ${yay_packages[@]}; do
  yay -S --noconfirm --needed ${package}
done

flatpak_packages=(
  com.brave.Browser
  com.google.Chrome
  com.jetbrains.DataGrip
)

for pak in "${flatpak_packages[@]}"; do
  if ! flatpak list | grep -i "$pak" &> /dev/null; then
    echo "Installing Flatpak: $pak"
    flatpak install --noninteractive "$pak"
  else
    echo "Flatpak already installed: $pak"
  fi
done

echo '\nEnabling Systemd Services...'
for SERVICE in "${systemd_services[@]}"; do
    # Check if service is active
    if systemctl is-active --quiet "$SERVICE"; then
        echo "  $SERVICE is already running."
    else
        echo "  $SERVICE is not running. Starting it..."
        sudo systemctl start "$SERVICE"
    fi

    # Check if service is enabled
    if systemctl is-enabled --quiet "$SERVICE"; then
        echo "  $SERVICE is already enabled."
    else
        echo "  $SERVICE is not enabled. Enabling it..."
        sudo systemctl enable "$SERVICE"
    fi

    echo ""
done

