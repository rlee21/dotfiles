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
# enable full 24-bit truecolor (RGB) support
COLORTERM=truecolor
# enable colored output from ls, etc. on FreeBSD-based systems
export CLICOLOR=1
# use 256 term for better colors
export TERM=xterm-256color

#########################
# Aliases
#########################
alias cc="claude"
alias oc="opencode"
alias ol="ollama"
alias ll="ls -lrth"
alias gs="git status"
alias ga="git add --all ."
alias gp="git push"
alias gd="git diff"
alias gl="git log --oneline"
alias dcb="docker compose build"
alias dcu="docker compose up"
alias dcub="docker compose up --build"
alias dcd="docker compose down"
# alias dc='docker rm $(docker ps -a -f status=exited -q)'
alias be="bundle exec"
alias bi="bundle install"
alias yi="yarn install"
alias rc="bin/rails console"
alias rs="bundle exec rails s -b 'ssl://0.0.0.0:3000?key=../../.ssh/localhost/key.pem&cert=../../.ssh/localhost/cert.pem'"
alias rs1="bundle exec rails s -b 'ssl://0.0.0.0:3001?key=../../.ssh/localhost/key.pem&cert=../../.ssh/localhost/cert.pem'"
alias rs2="bundle exec rails s -b 'ssl://0.0.0.0:3002?key=../../.ssh/localhost/key.pem&cert=../../.ssh/localhost/cert.pem'"
alias rs3="bundle exec rails s -b 'ssl://0.0.0.0:3003?key=../../.ssh/localhost/key.pem&cert=../../.ssh/localhost/cert.pem'"
alias rs8="bundle exec rails s -b 'ssl://0.0.0.0:8888?key=../../.ssh/localhost/key.pem&cert=../../.ssh/localhost/cert.pem'"

alias rge='rg -i --iglob !'\''*.yml'\'' --iglob !'\''*.sql'\'' --iglob !'\''*test*'\'' --iglob !'\''*spec*'\'
# alias arm="env /usr/bin/arch -arm64 /bin/zsh --login"
# alias intel="env /usr/bin/arch -x86_64 /bin/zsh --login"
alias myip='dig TXT +short o-o.myaddr.l.google.com @ns1.google.com'
# alias ks='k8s-get-secret mysql-root-password'

#########################
# Environment Variables
#########################
export EDITOR='vim'
export PGUSER='postgres'

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

# retry: run an rspec test file up to N times until it succeeds
# Usage: retry spec/path/to/file_spec.rb 3
retry() {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: retry [TEST FILE TO RUN] [NUMBER OF TIMES TO RUN]"
    return 1
  fi

  local test_file=$1
  local num_runs=$2

  for i in $(seq 1 "$num_runs"); do
    echo "Attempt $i of $num_runs: RAILS_ENV=test bundle exec rspec \"$test_file\""
    RAILS_ENV=test bundle exec rspec "$test_file"
    local rc=$?
    if [ $rc -eq 0 ]; then
      echo "Run $i succeeded."
      return 0
    else
      echo "Run $i failed (exit code $rc)."
    fi
  done

  echo "All $num_runs attempts failed."
  return 1
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

# fzf fuzzy finder
source <(fzf --zsh)
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# rbenv
eval "$(rbenv init - zsh)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# # pyenv
# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1
#
# java
# export PATH="/usr/local/opt/openjdk@8/bin:$PATH"
# export CPPFLAGS="-I/usr/local/opt/openjdk@8/include"

# Kubernetes cli
alias k=kubectl
alias kaf='kubectl apply -f'
alias kca='_kca(){ kubectl "$@" --all-namespaces;  unset -f _kca; }; _kca'
alias kccc='kubectl config current-context'
alias kcdc='kubectl config delete-context'
alias kcgc='kubectl config get-contexts'
alias kcn='kubectl config set-context --current --namespace'
alias kcp='kubectl cp'
alias kcsc='kubectl config set-context'
alias kcuc='kubectl config use-context'
alias kdcj='kubectl describe cronjob'
alias kdcm='kubectl describe configmap'
alias kdd='kubectl describe deployment'
alias kdds='kubectl describe daemonset'
alias kdel='kubectl delete'
alias kdelcj='kubectl delete cronjob'
alias kdelcm='kubectl delete configmap'
alias kdeld='kubectl delete deployment'
alias kdelds='kubectl delete daemonset'
alias kdelf='kubectl delete -f'
alias kdeli='kubectl delete ingress'
alias kdelj='kubectl delete job'
alias kdelno='kubectl delete node'
alias kdelns='kubectl delete namespace'
alias kdelp='kubectl delete pods'
alias kdelpvc='kubectl delete pvc'
alias kdels='kubectl delete svc'
alias kdelsa='kubectl delete sa'
alias kdelsec='kubectl delete secret'
alias kdelss='kubectl delete statefulset'
alias kdi='kubectl describe ingress'
alias kdj='kubectl describe job'
alias kdno='kubectl describe node'
alias kdns='kubectl describe namespace'
alias kdp='kubectl describe pods'
alias kdpvc='kubectl describe pvc'
alias kdrs='kubectl describe replicaset'
alias kds='kubectl describe svc'
alias kdsa='kubectl describe sa'
alias kdsec='kubectl describe secret'
alias kdss='kubectl describe statefulset'
alias kecj='kubectl edit cronjob'
alias kecm='kubectl edit configmap'
alias ked='kubectl edit deployment'
alias keds='kubectl edit daemonset'
alias kei='kubectl edit ingress'
alias kej='kubectl edit job'
alias keno='kubectl edit node'
alias kens='kubectl edit namespace'
alias kep='kubectl edit pods'
alias kepvc='kubectl edit pvc'
alias kers='kubectl edit replicaset'
alias kes='kubectl edit svc'
alias kess='kubectl edit statefulset'
alias keti='kubectl exec -t -i'
alias kga='kubectl get all'
alias kgaa='kubectl get all --all-namespaces'
alias kgcj='kubectl get cronjob'
alias kgcm='kubectl get configmaps'
alias kgcma='kubectl get configmaps --all-namespaces'
alias kgd='kubectl get deployment'
alias kgda='kubectl get deployment --all-namespaces'
alias kgds='kubectl get daemonset'
alias kgi='kubectl get ingress'
alias kgia='kubectl get ingress --all-namespaces'
alias kgj='kubectl get job'
alias kgno='kubectl get nodes'
alias kgns='kubectl get namespaces'
alias kgp='kubectl get pods'
alias kgpa='kubectl get pods --all-namespaces'
alias kgpall='kubectl get pods --all-namespaces -o wide'
alias kgpvc='kubectl get pvc'
alias kgpvca='kubectl get pvc --all-namespaces'
alias kgrs='kubectl get replicaset'
alias kgs='kubectl get svc'
alias kgsa='kubectl get svc --all-namespaces'
alias kgsec='kubectl get secret'
alias kgseca='kubectl get secret --all-namespaces'
alias kgss='kubectl get statefulset'
alias kgssa='kubectl get statefulset --all-namespaces'
alias kl='kubectl logs'
alias kl1h='kubectl logs --since 1h'
alias kl1m='kubectl logs --since 1m'
alias kl1s='kubectl logs --since 1s'
alias klf='kubectl logs -f'
alias klf1h='kubectl logs --since 1h -f'
alias klf1m='kubectl logs --since 1m -f'
alias klf1s='kubectl logs --since 1s -f'
alias kpf='kubectl port-forward'
alias krh='kubectl rollout history'
alias krsd='kubectl rollout status deployment'
alias krsss='kubectl rollout status statefulset'
alias kru='kubectl rollout undo'
alias ksd='kubectl scale deployment'
alias ksss='kubectl scale statefulset'

# homebrew
export PATH=/opt/homebrew/bin:/usr/local/opt/openjdk@8/bin:/Users/roblee/.pyenv/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Applications/iTerm.app/Contents/Resources/utilities

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/roblee/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# RSE environment variables
export LOCALHOST_CERT_DIR=~/.ssh/localhost

# # tell ruby-build to use the home-brew version of openssl
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/opt/homebrew/opt/openssl@1.1"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# opencode
export PATH=/Users/roblee/.opencode/bin:$PATH
