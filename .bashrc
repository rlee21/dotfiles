##########
# Aliases
##########
alias ll="ls -lrth"
alias c="clear"
alias lo="logout"
alias t="tmux"
alias python="python3"

##########
# Prompt
##########
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h: \[\033[1;36m\]\W\[\033[1;31m\]\$(parse_git_branch)\[\033[00m\] $ "

