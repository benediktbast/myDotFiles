#Auto completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select # arrow key driven
setopt COMPLETE_ALIASES

autoload -Uz promptinit
promptinit
prompt fade blue

# 076 = Chartreuse3		#5fd700		rgb(95,215,0)	hsl(3,100%,42%)
# 090	Red (SYSTEM)	#ff0000		rgb(255,0,0)	hsl(0,100%,50%)
# 025	DeepSkyBlue4	#005faf		rgb(0,95,175)	hsl(07,100%,34%)
# 075	SteelBlue1		#5fafff		rgb(95,175,255)	hsl(210,100%,68%)
# 160	Red3			#d70000		rgb(215,0,0)	hsl(0,100%,42%)
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
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{160}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{%f%k%b%}
%{%K{025}%B%F{white}%} %n%{%B%F{white}%}@%{%B%F{white}%}%m%{%B%F{white}%} %{%f%k%b%} %~%  %D{%f/%m/%y} %*%B%F{white}%}$(git_prompt_info)%E%{%f%k%b%}
%{%K{0}%}$(_prompt_char)$%{%f%k%b%} '

RPROMPT='!%{%B%F{075}%}%!%{%f%k%b%}'

