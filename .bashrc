# Unbreak broken, non-colored terminal
#export TERM='xterm-color'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
shopt -s histappend

alias ls='ls -G'
alias ll='ls -lhG'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
