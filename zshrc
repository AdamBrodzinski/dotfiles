# ------------ ZSH Theme -------------
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
setopt PROMPT_SUBST
PROMPT='%F{cyan}%2~%B%F{green}${vcs_info_msg_0_}%f%b %F{white}$%f '


# ------------ ZSH History ------------
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history


# ---------- ZSH tab complete ---------
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select


# ---------- fix up/down key search for substrings
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# when printing std out, show tabs as 3 spaces
tabs -3


# ----------- ZSH plugin setup ----------
source ~/code/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh


# ---------------- alias ----------------
alias ezsh='nvim ~/.zshrc && source ~/.zshrc'
alias evim='nvim ~/.config/nvim'
alias ekitty='nvim ~/.config/kitty'
alias vim='nvim'
alias vi='nvim'
alias l='ls -l'
alias ll='ls -la'
alias ..='cd ..'
alias ...='cd ../..'
alias gs='git status'
alias gb='git branch'
alias co='git checkout'
alias cob='git checkout -b'
