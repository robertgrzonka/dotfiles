local ret_status="%(?:%{$fg_bold[white]%}λ :%{$fg_bold[red]%}λ )"
PROMPT='${ret_status} %{$fg_bold[white]%}%c %{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}git•%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ▸ $fg[yellow]"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%} ▸ "
