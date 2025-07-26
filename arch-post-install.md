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
  1. run install script to install & setup service
  2. `sudo groupadd docker`
  3. `sudo usermod -aG docker $USER`

- Setup keyd services
  1. manually cp dotfile into /etc/keyd

- Install software manually
  1. Cargo: https://www.rust-lang.org/tools/install
    - `cargo install --locked bacon`
    - `cargo install --locked sqlx-cli`
  2. Set global Node with Mise `mise use -g node@lts`
  3. Install Claude Code `npm install -g @anthropic-ai/claude-code`

- Modify wifi
  1. https://wiki.archlinux.org/title/Network_configuration/Wireless#Respecting_the_regulatory_domain
  2. `sudo pacman -S wireless-regdb`
  3. `iw reg set US`
  3. note you may want to install iwd instead of network manager to prevent this next step
  <!-- 4. set network manager backend to iwd in `/etc/NetworkManager/NetworkManager.conf` -->
  <!--    ``` -->
  <!--    [device] -->
  <!--    wifi.backend=iwd -->
  <!--    ``` -->

# todo ssh?
systemctl --user enable ssh-agent
systemctl --user start ssh-agent
