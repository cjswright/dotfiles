# The best ZSH theme ever!

local user_color='green'; [ $UID -eq 0 ] && user_color='red'
local return_status="%{$fg_bold[red]%}%(?..%?)%{$reset_color%}"

# The prompt itself
PROMPT='%{$fg_bold[blue]%}%D{%K:%M:%S} %{$fg_no_bold[white]%}%n@%m %{$fg[green]%}${PWD/#$HOME/~} %{$fg[yellow]%}$(git_prompt_info)$(hg_prompt_info) ${return_status}%{$reset_color%}
%(!.#.>) '
