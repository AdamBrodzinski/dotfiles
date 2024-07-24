# init asdf for 
. /opt/asdf-vm/asdf.sh

# ------------ ZSH Theme -------------
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
setopt PROMPT_SUBST

PROMPT='%F{yellow}❯%f '
RPROMPT='%F{blue}%3~'


# ------------ ZSH History ------------
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history


# ---------- ZSH tab complete ---------
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select


# ---------- fix up/down key search for substrings
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# when printing std out, show tabs as 3 spaces
tabs -3


# ----------- ZSH plugin setup ----------
#source ~/code/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source $HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh


# ---------------- alias ----------------
alias ezsh='nvim ~/.zshrc && source ~/.zshrc'
alias evim='nvim ~/.config/nvim/init.lua'
alias ekitty='nvim ~/.config/kitty/kitty.conf'
alias vim='nvim'
alias vi='nvim'
alias l='ls -l --color'
alias ll='ls -la --color'
alias ..='cd ..'
alias ...='cd ../..'
alias gs='git status'
alias gb='git branch'
alias co='git checkout'
alias cob='git checkout -b'
alias gg='lazygit'
alias delete-all-branches='git branch | grep -v "main" | xargs git branch -D'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

source .zshalias

# init applications
source .zsh-apps
