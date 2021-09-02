# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PS1="[\u@\H \w]\$ "

if [ "`id -u`" = "0" ] ; then
        umask 0022
        PS1="[\u@\H \w]\[\e[01;32m\]# \[\e[0m\]"
fi

LANG=en_US.UTF-8
PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
export LANG
