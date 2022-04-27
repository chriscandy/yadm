# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors and change prompt:
autoload -U colors && colors

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

autoload -U compinit && compinit -u
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward

# aliases
# [ -f "${XDG_CONFIG_HOME}/shell/aliases" ] && source "${XDG_CONFIG_HOME}/shell/aliases"

# options
unsetopt menu_complete
unsetopt flowcontrol

setopt auto_menu

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

PYTHON_BIN_PATH=$(python3 -m site --user-base)/bin
export PATH="$PATH:$PYTHON_BIN_PATH"
