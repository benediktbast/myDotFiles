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

# Easy Navigation
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

