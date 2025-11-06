#!/usr/bin/env zsh

fpath=($XDG_CONFIG_HOME/zsh/plugins $fpath)

# editor
export EDITOR=vim
export VISUAL=vim

# Man pages
export MANPAGER='vim +Man!'

export BRED='\033[1;31m'
export BYELLOW='\033[1;33m'
export BCYAN='\033[1;36m'
export RESET='\033[m'

# ------
# PROMPT
# ------
# autoload -Uz promptinit
# promptinit
# prompt redhat
setopt PROMPT_SUBST
PROMPT="%B%F{yellow}%n%f%F{cyan}@%m %b%f%~%B%F{cyan}:%f%b "


# ------
# NAVIGATION
# ------
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
# setopt EXTENDED_GLOB        # Use extended globbing syntax.

source "$XDG_CONFIG_HOME/zsh/bd"


# ------
# HISTORY
# ------
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history

setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# ------
# VIM
# ------
bindkey -v
export KEYTIMEOUT=20
bindkey -M viins 'jj' vi-cmd-mode
bindkey -M vicmd 'H' beginning-of-line
bindkey -M vicmd 'L' end-of-line

# custom function for cursor depending on vim mode
source "$XDG_CONFIG_HOME/zsh/cursor_mode"

# Emulation of vim-surround
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd cs change-surround
bindkey -M vicmd ds delete-surround
bindkey -M vicmd ys add-surround
bindkey -M visual S add-surround


# ------
# COMPLETION
# ------
source "$XDG_CONFIG_HOME/zsh/completion.zsh"

# ------
# EXPORTS
# ------
if [ -f ~/.bash_exports_local ]; then
    source ~/.bash_exports_local
fi

# ------
# ALIASES
# ------
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

if [ -f ~/.bash_aliases_local ]; then
    source ~/.bash_aliases_local
fi

#--------------
# FUNCTIONS   -
#--------------

autoload -U zmv
alias zmv='noglob zmv'

# ------
# PLUGINS
# ------
source "$XDG_CONFIG_HOME/zsh/plugins/fzf/key-bindings.zsh"
source "$XDG_CONFIG_HOME/zsh/plugins/fzf/completion.zsh"
source "$XDG_CONFIG_HOME/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
# bindkey  '^L' autosuggest-accept
bindkey '^I'   complete-word       # tab          | complete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest
source "$XDG_CONFIG_HOME/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$XDG_CONFIG_HOME/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

