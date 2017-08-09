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

#Set prompt
PS1='\u@\h \W\$ '
