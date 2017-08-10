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


#Configure Golang
export GOPATH="$HOME/data/go"
export PATH="$PATH:$GOPATH/bin"

ZSH_CONF_DIR=~/.zsh/
ZSH_CONF_FILES=(
  alias
  bindkeys
)

for conf_file in $ZSH_CONF_FILES
do
  if [[ -e $ZSH_CONF_DIR/$conf_file.zsh ]]
  then
    source $ZSH_CONF_DIR/$conf_file.zsh;
  fi
done

#Visual
export VISUAL="vim"

source /usr/share/nvm/init-nvm.sh
