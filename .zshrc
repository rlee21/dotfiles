#########################
# Prompt
#########################
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' stagedstr '✗'
zstyle ':vcs_info:*' unstagedstr '✗'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '%F{white}(%F{white}%b%F{white}|%F{white}%a%F{white})%f '
zstyle ':vcs_info:*' formats \
           '%F{white}(%F{white}%b%F{white}) %F{white}%c%F{green}%u%f'
           zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
           +vi-git-untracked() {
               if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
                   git status --porcelain | grep '?' &> /dev/null ; then
                       hook_com[unstaged]+='%F{green}?%f'
                       fi
           }
precmd () { vcs_info }
PROMPT='%F{white}[%F{white}%n@%m] %F{green}%c%F{green} %F${vcs_info_msg_0_} %f%# '

#########################
# Color
#########################
# enable colored output from ls, etc. on FreeBSD-based systems
export CLICOLOR=1
# use 256 term for better colors
export TERM=xterm-256color

#########################
# Aliases
#########################
alias ll="ls -lrth"
alias lo="logout"
alias t="tmux"
alias python="python3"
alias gs="git status"
alias ga="git add --all ."
alias gp="git push"
alias gd="git diff"
alias gl="git log"
alias dc='docker rm $(docker ps -a -f status=exited -q)'
alias tst="ssh cg1test"
alias wow="ssh cg2wow"
alias be="bundle exec"
alias bi="bundle install"
alias yi="yarn install"

#########################
# Environment Variables
#########################
export DB_HOST=127.0.0.1
export DB_PORT=3306
export DB_USER=root
export DB_PASS=root
# export EDITOR='vim'
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH="${HOME}/.bin:${PATH}"
export PATH=~/.local/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
# export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
# export PATH="$(brew --prefix qt@5.5)/bin:$PATH"

#########################
# History
#########################
HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000

#########################
# Functions
#########################
# Make new dir and cd to it
function mkcd {
    mkdir -p $1 && cd $1
}

# Find dir in current tree
function finddir {
    term=${1}
    find . -type d -name "*${1}*"
}
# Allows commit message without typing quotes (can't have quotes in the commit msg though).
function gc {
    git commit -m "$*"
}

# attach to tmux session
function ta {
    tmux a -t "*${1}*"
}

#########################
# Misc
#########################
# Case insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# Advanced tab completion
autoload -U compinit
compinit
# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi
# fzf fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

