#!/bin/bash

brew update

# unix tools
brew install \
	coreutils \
	curl \
	gawk \
	gnu-sed \
	stow \
	wget

# cli tools
brew install \
	ack \
	atuin \
	eza \
	fd \
	fzf \
	jq \
	trash \
	tree \
	zellij \
	zoxide

# programming tools
brew install \
	git \
	lazygit \
	lazydocker \
	ripgrep \
	neovim

# language support
brew install \
	lua \
	opam

# zsh plugins
brew install zsh-history-substring-search

# fonts
brew tap homebrew/cask-fonts
brew install --cask \
	font-source-code-pro \
	font-sauce-code-pro-nerd-font

# apps
brew install --cask nikitabobko/tap/aerospace
brew tap FelixKratz/formulae
brew install borders
