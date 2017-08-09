# .zshrc
# Author: Benedikt Bast

# Auto completion
autoload -Uz compinit promptinit
compinit
promptinit
zstyle ':completion:*' menu select # arrow key driven
setopt COMPLETE_ALIASES

autoload -Uz promptinit
promptinit
prompt fade blue

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

#Configure Golang
export GOPATH="$HOME/data/go"
export PATH="$PATH:$GOPATH/bin"

#Visual
export VISUAL="vim"

