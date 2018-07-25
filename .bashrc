#########################
# Aliases
#########################
alias ll="ls -lrth"
alias c="clear"
alias lo="logout"
alias t="tmux"
alias python="python3"
alias gst="git status"
alias vim="/usr/local/bin/vim"
alias hivedev="beeline -n admin -p ***** -u jdbc:hive2://hive-public-elb.nonprod.datavision.r53.nordstrom.net:443/default\;transportMode=http\;httpPath=cliservice"
alias hiveprd="beeline -n admin -p ***** -u jdbc:hive2://ca-hive-jdbc.prod.bigdata.vip.nordstrom.com:443/default\;transportMode=http\;httpPath=cliservice\;ssl=true\;auth=nosasl"
alias awskey="awscreds --profile default"


#########################
# Prompt
#########################
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h: \[\033[1;36m\]\W\[\033[1;31m\]\$(parse_git_branch)\[\033[00m\] $ "


#########################
# Serverless Framework
#########################
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
