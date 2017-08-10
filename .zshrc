# .zshrc
# Author: Benedikt Bast

# Enabling config modules
ZSH_CONF_DIR=~/.zsh/
ZSH_CONF_FILES=(
  git
  prompt
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

#Configure Golang
export GOPATH="$HOME/data/go"
export PATH="$PATH:$GOPATH/bin"

#Visual
export VISUAL="vim"

source /usr/share/nvm/init-nvm.sh
