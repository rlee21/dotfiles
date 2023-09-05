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
alias gs="git status"
alias ga="git add --all ."
alias gp="git push"
alias gd="git diff"
alias gl="git log --oneline"
alias dcb="docker-compose build"
alias dcu="docker-compose up"
alias dcub="docker-compose up --build"
alias dcd="docker compose down"
# alias dc='docker rm $(docker ps -a -f status=exited -q)'
alias be="bundle exec"
alias bi="bundle install"
alias yi="yarn install"
alias rge='rg -i --iglob !'\''*.yml'\'' --iglob !'\''*.sql'\'' --iglob !'\''*test*'\'' --iglob !'\''*spec*'\'
alias arm="env /usr/bin/arch -arm64 /bin/zsh --login"
alias intel="env /usr/bin/arch -x86_64 /bin/zsh --login"
alias myip='dig TXT +short o-o.myaddr.l.google.com @ns1.google.com'
# alias ks='k8s-get-secret mysql-root-password'

#########################
# Environment Variables
#########################
export EDITOR='vim'
export SHIFT_POSTGRES_DOCKER_ENABLED=true
export SHIFT_PYTHON3_ENABLED=true
export SHIFT_GO_VERSION=1.18.8
export SHIFT_GO_DARWIN_AMD64_SHA=9d696d431cd255f3657387019dfef34d6edda9a36843244b207d8822cd5b197f
export SHIFT_GO_LINUX_AMD64_SHA=4d854c7bad52d53470cf32f1b287a5c0c441dc6b98306dea27358e099698142a

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
# Emacs Key Bindings
bindkey -e

# Case insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Advanced tab completion
autoload -U compinit
compinit

# fzf fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(rbenv init - zsh)"

# nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1
#
# java
export PATH="/usr/local/opt/openjdk@8/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/openjdk@8/include"

# Kubernetes cli
function kget() {
    # usage kget <account> [clustername]
    local account=$1
    aws sso login --profile ${account}
    export AWS_PROFILE=${account}
    local cluster_name=${2:-}
    aws eks update-kubeconfig --name ${cluster_name} --kubeconfig ~/shift/${cluster_name} --alias ${cluster_name}
    export KUBECONFIG=~/shift/${cluster_name}
}
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
