
if [ -f ~/.bashrc ]; then source ~/.bashrc; fi

#########################
# Environmental Variables
#########################
export PATH=/usr/local/bin:/usr/local/sbin:$PATH;
export PATH=~/.local/bin:$PATH;

#########################
# History
#########################
export HISTCONTROL=ignoredups;
export HISTSIZE=500000;
export HISTFILESIZE=500000;

#########################
# Color
#########################
export CLICOLOR=1;
export TERM=xterm-256color;
#export LSCOLORS="gxgxcxcxbxcxbxbxbxgxgx";
#export LS_COLORS="di=36;40:ln=36;40:so=32;40:pi=32;40:ex=31;40:bd=32;40:cd=32;40:su=31;40:sg=31;40:tw=36;40:ow=36;40:";

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
