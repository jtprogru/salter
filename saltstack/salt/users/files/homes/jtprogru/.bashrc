# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific aliases and functions
case $- in
    *i*) ;;
      *) return;;
esac

export EDITOR=vim



force_color_prompt=yes

export PS1='\[\033[01;31m\]\u\[\033[01;33m\]@\[\033[01;36m\]\h \[\033[01;33m\]\w \[\033[01;35m\]\$ \[\033[00m\]'
unset force_color_prompt

alias duh="du -d 1 -h"
alias ls="ls -G"
alias ll="ls -lah"
alias grep='grep --color'
alias egrep='egrep --color'


if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
