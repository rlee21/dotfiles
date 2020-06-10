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
alias gl="git log --oneline"
alias dc='docker rm $(docker ps -a -f status=exited -q)'
alias tst="ssh cg1test"
alias wow="ssh cg2wow"
alias be="bundle exec"
alias bi="bundle install"
alias yi="yarn install"
alias gcc='gcc-9'
alias rge='rg -i --iglob !'\''*.yml'\'' --iglob !'\''*.sql'\'' --iglob !'\''*test*'\'
alias ks='k8s-get-secret mysql-root-password'

#########################
# Environment Variables
#########################
export EDITOR='vim'
export DB_HOST=127.0.0.1
export DB_PORT=3306
export DB_USER=root
# export DB_PASS=root
export DB_PASS=$(kubectl get -n $(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null) secret/mysql-root-password -o json | jq -r .data.value | base64 --decode)
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH="${HOME}/.bin:${PATH}"
export PATH=~/.local/bin:$PATH
# export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
# export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
# export PATH=“/usr/local/opt/qt@5.5/bin:$PATH”

export KAFKA_HOSTS=localhost:9092
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
# open ssl paths
# export PATH="/usr/local/opt/openssl/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/openssl/lib"
# export CPPFLAGS="-I/usr/local/opt/openssl/include"
# export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
# export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
# export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
# export PKG_CONFIG_PATH="PKG_CONFIG_PATH:/usr/local/opt/openssl@1.1/lib/pkgconfig"
# export NVM_DIR="$HOME/.nvm"
#   [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
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
# kubectl cmd to get pods
function kp {
  kubectl get pods | grep "${1}"
}

# kubectl cmd to tail logs
function kl {
  kubectl logs -f "${1}"
}

# kubectl cmd to shell into container
function ke {
  kubectl exec -it "${1}" sh
}

# kubectl for mysql port forwarding
function kf {
    kubectl -n "${1}" port-forward pod/mysql-0 3306:3306
}

#########################
# Misc
#########################
# Emacs Key Bindings
bindkey -e
# Case insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# Advanced tab completion
autoload -U compinit
compinit
for f in ~/code/k8s-helpers/*.sh; do source $f; done
# fzf fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
