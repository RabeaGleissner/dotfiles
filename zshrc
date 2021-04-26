autoload -U compaudit compinit

for config_file (~/dotfiles/zsh/*.zsh); do
  source $config_file
done

# upgrade global npm package for all node versions
bump_all() {
  nvm ls --no-colors | grep -v -E -e '.+->' | sed 's/[-*> ]//g' | while read in; do nvm exec "$in" npm i -g $1; done
}
alias bump_all=bump_all

find_with_line_number() {
  word_to_find=$1
  git grep -n "${word_to_find}"
}

find_and_replace_in_project() {
  current_text=$1
  new_text=$2
  git grep -l $current_text | xargs sed -i "" -e "s/${current_text}/${new_text}/g"
}

docker_login() {
  prefix=$1
  docker exec -t -i `docker ps | grep $prefix | awk "{print $1}"` bash
}

alias dl=docker_login
alias fr=find_and_replace_in_project
alias start_pg="pg_ctl -D /usr/local/var/postgres start"
alias f=find_with_line_number
alias gh_open=open_on_github $1

alias gb="git branch"
alias gco="git checkout"
alias gc="git commit -v"
alias gst="git status"
alias ll="ls -la"
alias gl="git log --graph --all --pretty=format:'%C(magenta)%h%C(auto)%d %s %C(green)(%cr) %C(bold blue)%an%C(white)/%C(cyan)%cn'"
alias gd="git diff"
alias gdc="git diff --cached"
alias gsf="git diff-tree --no-commit-id --name-status -r"
alias be="bundle exec"

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

export FZF_DEFAULT_COMMAND="rg --files"

#remember history in Elixir terminal after closing it
export ERL_AFLAGS="-kernel shell_history enabled"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH=$HOME/.rbenv/shims:$PATH
export PATH=$HOME/mongodb/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
