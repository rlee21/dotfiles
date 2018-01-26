#########
# Aliases
#########

alias ll="ls -lrth"
alias c="clear"



parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
#export PS1="\u@\h \[\033[1;32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export PS1="\u@\h: \[\033[1;36m\]\W\[\033[1;31m\]\$(parse_git_branch)\[\033[00m\] $ "
#export PS1="\[\e[1;33m\]\u@\h: \[\e[31m\]\W\[\e[0m\] $ ";
#export PS1="\[\033[1;33m\]\u@\h:\[\e[\033[1;34m\] \W\[\033[0m\] $ ";
#export PS1="\[\e[33;1m\]\u@\h: \[\e[31m\]\W\[\e[0m\] $ ";
#export PS1="\[\033[1;32m\]\u@\h:\[\e[\033[1;34m\] \W\[\033[0m\] $ ";
#export PS1="[\u@\h \W]$ ";

export CLICOLOR=1;
#export LSCOLORS=GxFxCxDxBxegedabagaced;
export TERM=xterm-256color


###-ANSI-COLOR-CODES-###
#bold='';
#reset="\e[0m";
#black="\e[1;30m";
#blue="\e[1;34m";
#cyan="\e[1;36m";
#green="\e[1;32m";
#orange="\e[1;33m";
#purple="\e[1;35m";
#red="\e[1;31m";
#violet="\e[1;35m";
#white="\e[1;37m";
#yellow="\e[1;33m";
