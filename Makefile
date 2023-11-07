.PHONY: link setup_macos

link:
	# TODO don't run this, the symlinks break, for now just copy/paste each line
	mkdir -p .config/karabiner
	mkdir -p .config/kitty
	cd ~/.config/karabiner
	ln -sf ../../code/dotfiles/karabiner.json karabiner.json
	cd ~/.config/kitty
	ln -sf ../../code/dotfiles/kitty/kitty.conf kitty.conf
	cd ~/.config
	ln -sf ../code/dotfiles/nvim nvim
	ln -sf code/dotfiles/ackrc .ackrc
	ln -sf code/dotfiles/gitignore_global .gitignore_global
	ln -sf code/dotfiles/zshrc .zshrc
	ln -sf code/dotfiles/zprofile .zprofile

setup_macos:
	./osx
