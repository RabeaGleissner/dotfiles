autoload -U compaudit compinit

for config_file (~/.dotfiles/zsh/*.zsh); do
  source $config_file
done

alias gb="git branch"
alias gco="git checkout"
alias gc="git commit -v"
alias gst="git status"
alias ll="ls -la"
alias be="bundle exec"

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

export GOPATH=/Users/rabeagleissner
export PATH=$PATH:$GOPATH/bin

#configuration for php-version
source $(brew --prefix php-version)/php-version.sh && php-version 5

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export CLASSPATH=$CLASSPATH:~/algs4/algs4.jar
