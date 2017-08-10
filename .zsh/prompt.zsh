# https://github.com/blinks zsh theme

#Auto completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select # arrow key driven
setopt COMPLETE_ALIASES

autoload -Uz promptinit
promptinit

autoload colors && colors

function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%{%F{075}%}±%{%f%k%b%} "
  else
    echo ''
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{076}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%B%F{white}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{%f%k%b%}
%{%K{blue}%B%F{white}%} %n%{%B%F{white}%}@%{%B%F{white}%}%m%{%B%F{white}%} %{%f%k%b%} %~%  %D{%f/%m/%y}|%*%B%F{white}%}$(git_prompt_info)%E%{%f%k%b%}
%{%K{0}%}$(_prompt_char)$%{%f%k%b%} '

RPROMPT='!%{%B%F{075}%}%!%{%f%k%b%}'

