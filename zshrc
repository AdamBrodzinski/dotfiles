# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="miloshadzic"

# red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repos much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# ZSH Plugins
plugins=(osx git npm brew meteor vi-mode)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# get Z running
. `brew --prefix`/etc/profile.d/z.sh


# --------------------  Aliases  --------------------


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

# Dev version aliases
alias dmgen='~/projects/meteor-generate/bin/mgen'
