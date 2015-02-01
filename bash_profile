export CLICOLOR=1
export LSCOLORS=gxGxcxdxCxegedabagacad

source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
PS1='@\u \W$(__git_ps1 "[\[\033[32m\]%s\[\033[0m\]]")\$ '

# golangs-a
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
#----------

export PATH=$HOME/.rbenv/bin:$GOPATH/bin:$GOROOT/bin:$PATH
eval "$(rbenv init -)"

# aliases
#			shell
alias ll='ls -alG'
alias search='find . -name'
alias op='open -a '
alias v='vim'

#			git
alias g.s='git status'
alias g.cm='git commit -m'
alias g.l='git log --oneline'
alias g.ll='git log --oneline -5'
alias g.l10='git log --oneline -10'
alias g.ref='git reflog -10'
alias g.co='git checkout'
alias g.b='git branch'
alias g.d='git diff'
alias g.d.d='git difftool --dir-diff'
alias g.p='git pull'
alias g.f='git fetch'
alias g.m='git merge'
alias g.ch='git checkout'
alias g.ch.b='git checkout -b'a
