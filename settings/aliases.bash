export JAVA_HOME=/usr/libexec/java_home
export GOPATH=~/Workspace/go
export GOBIN=$GOPATH/bin
export GOSRC=$GOPATH/src
export PATH=$PATH:$GOBIN

eval "$(direnv hook bash)"

alias dash="open dash://$1"
alias gst='git status'
alias gup="git pull --rebase"
alias gp="git push"
alias gap="git add -p"
alias duet='git duet --global'
alias solo='git solo --global'
alias be='bundle exec'
alias bx='be'
alias show="ps auxww | grep -v grep | grep "
