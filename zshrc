# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="miloshadzic"

# --------------------  Aliases  --------------------
alias ezsh="vim ~/.zshrc"
alias rzsh="source ~/.zshrc"

alias ll='ls -l'
alias lla='ls -la'

alias gd='git diff | mvim -'
alias co='git checkout'

alias be='bundle exec'
alias mtest='mocha --compilers coffee:coffee-script -R spec'

alias cleardns='dscacheutil -flushcache'
alias server='open http://localhost:8000 && python -m SimpleHTTPServer'



# red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

# something for Z
. `brew --prefix`/etc/profile.d/z.sh

