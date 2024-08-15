#!/bin/bash

set -e # exit when a cmd fails
#set -x # debug, print cmd before running it

# ------------------------------------------
echo "Updating Package Database..."
# ------------------------------------------
sudo pacman -Sy

if ! command -v yay &>/dev/null; then
  echo "'yay' command not found. Installing yay..."
  pacman -S --needed git base-devel &&
    git clone https://aur.archlinux.org/yay.git &&
    cd yay &&
    makepkg -si
fi

# ------------------------------------------
echo "Installing CLI Tools..."
# ------------------------------------------

sudo pacman -S --needed \
  base-devel \
  fd \
  jq \
  less \
  stow \
  tldr \
  trash-cli \
  tree \
  wget \
  z \
  ;

# ------------------------------------------
echo "Installing Programming Tools..."
# ------------------------------------------

sudo pacman -S --needed \
  docker \
  fzf \
  git \
  lazygit \
  neovim \
  ripgrep \
  opam \
  ;

yay -S --needed lazydocker

if ! systemctl is-active --quiet docker.service; then
  echo "Enabling & starting docker.service"
  systemctl enable docker.service
  systemctl start docker.service
fi

# ------------------------------------------
echo "Installing Languages..."
# ------------------------------------------

sudo pacman -S --needed opam
yay -S --needed asdf-vm
asdf plugin-add elixir
asdf plugin-add erlang
asdf plugin-add gleam
asdf plugin-add golang
asdf plugin-add nodejs
asdf plugin-add rust
asdf plugin-add yarn

# ------------------------------------------
echo "Installing Desktop Env..."
# ------------------------------------------

sudo pacman -S --needed \
  adobe-source-sans-fonts \
  bluez \
  bluez-utils \
  flatpak \
  keyd \
  wl-clipboard \
  ;

yay -S --needed \
  ttf-ms-fonts \
  ulauncher \
  ;

if ! systemctl is-active --quiet bluetooth.service; then
  echo "Enabling & starting bluetooth.service"
  systemctl enable bluetooth.service
  systemctl start bluetooth.service
fi

# ------------------------------------------
echo "Installing Flatpak apps..."
# ------------------------------------------

is_installed() {
  flatpak list | grep -q "$1"
}

if ! is_installed "com.google.Chrome"; then
  flatpak install -y flathub com.google.Chrome
fi

if ! is_installed "com.jetbrains.DataGrip"; then
  flatpak install -y flathub com.jetbrains.DataGrip
fi

# ------------------------------------------
echo "Done!"
# ------------------------------------------

# # https://wiki.archlinux.org/title/Network_configuration/Wireless#Respecting_the_regulatory_domain
# sudo pacman -S wireless-regdb

# legacy gnome desktop
# yay -S gnome-shell-extension-forge
# yay -S gnome-shell-extension-space-bar

# keyboard remapping
sudo pacman -S keyd
