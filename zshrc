autoload -U compaudit compinit

for config_file (~/.dotfiles/zsh/*.zsh); do
  source $config_file
done

alias gb="git branch"
alias gco="git checkout"
alias gc="git commit -v"
alias gs="git status -s -b"
alias gst="git status"

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH=$HOME/.rbenv/shims:$PATH
source /usr/local/opt/nvm/nvm.sh
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
