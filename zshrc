#!/bin/zsh

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="miloshadzic"

# red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repos much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# ZSH Plugins
plugins=(osx git vi-mode npm brew meteor history-substring-search)

source $ZSH/oh-my-zsh.sh

# get Z running
. `brew --prefix`/etc/profile.d/z.sh

# Fixes up/down key search for substrings
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward


# --------------------  Aliases  --------------------


# Use macvim in the terminal
alias em='emacs . &'
alias vim='mvim -v'
alias mivm='mvim'

# ZSH
alias ezsh="vim ~/.zshrc"
alias rzsh="source ~/.zshrc"

# Git
alias gd='git diff | mvim -'
alias co='git checkout'
alias cob='git checkout -b'
alias gs='git status'

# Misc.
alias be='bundle exec'
alias mochac='mocha --compilers coffee:coffee-script -R spec'
alias cleardns='dscacheutil -flushcache'
# startup a Python server
alias server='open http://localhost:8000 && python -m SimpleHTTPServer'
alias met='./met'
alias rethink='cd ~ && rethinkdb'
alias rn=react-native

alias dmgen='~/projects/meteor-generate/bin/mgen'
alias red='~/projects/RedScript/bin/redscript'
alias run='./run'
alias l='clear && ls -la'


# ----------------- Exports -----------------

export VISUAL=vim
export EDITOR="$VISUAL"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# C Libs
export LDLIBS=-lcs50

# add Android commands to path
#export PATH=${PATH}:~/Development/android-sdk/tools
#export PATH=${PATH}:~/Development/android-sdk/build-tools/19.1.0
#export ANDROID_HOME=/usr/local/opt/android-sdk


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#export NVM_DIR="/Users/adam/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh


export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

export ANDROID_HOME=~/Library/Android/sdk
export PATH=$PATH:~/Library/Android/sdk/platform-tools
export PATH=$PATH:~/Library/Android/sdk/tools
eval $(/usr/libexec/path_helper -s)
