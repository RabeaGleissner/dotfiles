#autoload -U compaudit compinit
autoload -Uz compinit && compinit

for config_file (~/dotfiles/zsh/*.zsh); do
  source $config_file
done

alias ag="ag --color-path 35 --color-match '1;39' --color-line-number 32"

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
alias yt="DEBUG_PRINT_LIMIT=0 yarn test --watch --coverage=false"
alias grs="git restore --staged"

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
alias adb='/Users/rabea/Library/Android/sdk/platform-tools/adb'
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"

#remember history in Elixir terminal after closing it
export ERL_AFLAGS="-kernel shell_history enabled"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH=$HOME/.rbenv/shims:$PATH
export PATH=$HOME/mongodb/bin:$PATH

# Config for nvm (installed with homebrew)
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

autoload -U +X bashcompinit && bashcompinit

. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
