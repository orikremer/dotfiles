export EDITOR=vi
export VISUAL=vi

if [ -f ~/.work_profile ]; then
   source ~/.work_profile
fi

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -f ~/.bash_aliases ]; then
   source ~/.bash_aliases
fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

eval "$(grunt --completion=bash)"

GREEN='0;32m'
YELLOW='1;33m'
PS1='[\u@\h \[\033[$GREEN\]\W\[\033[0m\]\[\033[$YELLOW\]$(__git_ps1 " (%s)")\[\033[0m\]]\$ '

function gmod() {
  git di --name-status | cut -f 2 | uniq
}

