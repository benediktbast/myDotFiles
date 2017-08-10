# Autor: Benedikt Bast
# https://github.com/benediktbast
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Alias
# Test non Posix conform ls paramters first
ls --color=auto &> /dev/null
if [ $? -eq 0 ]; then
    #set ls command for linux
    alias ls='ls --color=auto'
    alias ll='ls -la --color=auto'
else
    #set ls commands posix conform for bsd/darwin
    alias ls='ls -G'
    alias ll='ls -laG'
fi

# Git commands
alias branch='git symbolic-ref --short HEAD'

#Set prompt
PS1='\u@\h \W\$ '

#Configure Golang
export GOPATH="$HOME/data/go"
export PATH="$PATH:$GOPATH/bin"

#Visual
export VISUAL="vim"

