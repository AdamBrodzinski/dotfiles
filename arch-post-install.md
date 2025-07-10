# Post Install Setup

- Setup SSH Key, add to Github
  1. `ssh-keygen -t ed25519 -C "your_email@example.com"`
  2. `eval "$(ssh-agent -s)"`
  3. `ssh-add ~/.ssh/id_ed25519`
  4. `cat ~/.ssh/id_ed25519.pub | pbcopy`
  5. paste into Github ssh key UI

- Setup ZSH as default shell
  1. run `chsh -s /usr/bin/zsh` to set shell
  2. restart

- Setup Docker services

- Setup keyd services
  1. manually cp dotfile into /etc/keyd

- Modify wifi
  1. https://wiki.archlinux.org/title/Network_configuration/Wireless#Respecting_the_regulatory_domain
  2. `sudo pacman -S wireless-regdb`
  3. `iw reg set US`

