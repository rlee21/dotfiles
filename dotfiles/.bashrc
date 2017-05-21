#export PS1="\[\e[33;1m\]\u@\h: \[\e[31m\]\W\[\e[0m\] $ ";
export PS1="\[\033[1;32m\]\u@\h:\[\e[\033[1;34m\] \W\[\033[0m\] $ ";
#export PS1="[\u@\h \W]$ ";
export CLICOLOR=1;
export LSCOLORS=GxFxCxDxBxegedabagaced;

#parse_git_branch() {
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}
#export PS1="\u@\h \[\033[1;32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
