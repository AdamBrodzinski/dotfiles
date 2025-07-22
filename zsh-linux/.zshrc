# exit if shell is not interactive
if [[ ! $- == *i* ]]; then 
  return
fi

# # START zsh profiling
# zmodload zsh/zprof


# ------------ ZSH Theme -------------
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
setopt PROMPT_SUBST

PROMPT=' %F{yellow}❯%f '
RPROMPT='%F{blue}%3~'


# ------------ ZSH History ------------
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history


# ---------- ZSH tab complete ---------
autoload -Uz compinit
zstyle ':completion:*' menu select


# ---------- fix up/down key search for substrings
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# bindkey '^[[A' atuin-up-search
# bindkey '^[OA' atuin-up-search

# when printing std out, show tabs as 3 spaces
tabs -3

# ----------- ZSH plugin setup ----------
# source ~/Code/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# bindkey '^[[A' atuin-up-search
# source <(fzf --zsh) # fzf key bindings & fuzzy complete

# ----------- cross platform aliases -----------
source ~/.zshalias

# ----------- init applications -----------
source ~/.zsh-apps

# ----------- set env vars not checked in -----------
source ~/.zshenv

# Startup zellij "home" session only when in Hyprland and not already inside Zellij
if [[ -z "${ZELLIJ:-}" && -z "${ZELLIJ_SESSION_NAME:-}" && "$XDG_CURRENT_DESKTOP" == "Hyprland" ]]; then
    zellij delete-session home 2>/dev/null
    zellij attach -c home
fi

# # END zsh profiling
# zprof
