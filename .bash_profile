
if [ -f ~/.bashrc ]; then source ~/.bashrc; fi

#########################
# Environment Variables
#########################
export PATH=/usr/local/bin:/usr/local/sbin:$PATH;
export PATH=~/.local/bin:$PATH;
export PATH="$HOME/.rbenv/bin:$PATH";
export DB_HOST=127.0.0.1
export DB_PORT=3306
export DB_USER=root
export DB_PASS=root

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

#########################
# rbenv
#########################
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
