# Autor: Benedikt Bast
# https://github.com/benediktbast
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Alias
# Test Posix conform ls paramters first
ls -G &> /dev/null
if [ $? -eq 0 ]; then
    #set ls commands posix conform for bsd/darwin
    alias ls='ls -G'
    alias ll='ls -laG'
else
    #set ls command for linux
    alias ls='ls --color=auto'
    alias ll='ls -la --color=auto'
fi

# Easy Navigation
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

# Git commands
alias branch='git symbolic-ref --short HEAD'

#Set prompt
PS1='\u@\h \W\$ '
