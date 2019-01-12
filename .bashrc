#########################
# Aliases
#########################
alias ll="ls -lrth"
alias c="clear"
alias lo="logout"
alias t="tmux"
alias python="python3"
alias gst="git status"
# alias vim="/usr/local/bin/vim"
alias dcu='docker rm $(docker ps -a -f status=exited -q)'

#########################
# Prompt
#########################
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h: \[\033[1;36m\]\W\[\033[1;31m\]\$(parse_git_branch)\[\033[00m\] $ "

#########################
# Environment Variables
#########################
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export DB_HOST=127.0.0.1
export DB_PORT=3306
export DB_USER=root
