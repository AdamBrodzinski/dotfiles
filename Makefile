# symlink the files in this repo to the home or ~/.config folder so that any changes will
# get saved to source control. Note, if an app (like Karabiner) overwrites the config and
# then you run the link command again, the -f flag will happily overwrite the existing file
link: DOTFILES=$(HOME)/code/dotfiles
link:
	mkdir -p ~/.config/karabiner
	mkdir -p ~/.config/kitty
	ln -sf $(DOTFILES)/ackrc $(HOME)/.ackrc
	ln -sf $(DOTFILES)/gitignore_global $(HOME)/.gitignore_global
	ln -sf $(DOTFILES)/zshrc $(HOME)/.zshrc
	ln -sf $(DOTFILES)/zprofile $(HOME)/.zprofile
	ln -sf $(DOTFILES)/nvim $(HOME)/.config/nvim
	ln -sf $(DOTFILES)/karabiner.json $(HOME)/.config/karabiner/karabiner.json
	ln -sf $(DOTFILES)/kitty/kitty.conf $(HOME)/.config/kitty/kitty.conf
	@echo "All files linked!"

setup_macos:
	./osx
