#Auto completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select # arrow key driven
setopt COMPLETE_ALIASES

autoload -Uz promptinit
promptinit
prompt fade blue

# 090   Red (SYSTEM)    #ff0000 rgb(255,0,0)        hsl(0,100%,50%)
# 15    White (SYSTEM)  #ffffff rgb(255,255,255)    hsl(0,0%,100%)
autoload colors && colors

function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%{%F{blue}%}±%{%f%k%b%} "
  else
    echo ''
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{green%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%B%F{white}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{%f%k%b%B%F{white}%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{%f%k%b%}"

PROMPT='%{%f%k%b%}
%{%K{blue}%B%F{white}%}▓▒░%n%{%B%F{white}%}@%{%B%F{white}%}%m%{%B%F{white}%}░▒▓%{%f%k%b%} %~%  %D{%f/%m/%y} %*%B%F{white}%}$(git_prompt_info)%E%{%f%k%b%}
$(_prompt_char)%#%{%f%k%b%} '

RPROMPT='!%{%B%F{blue}%}%!%{%f%k%b%}'

