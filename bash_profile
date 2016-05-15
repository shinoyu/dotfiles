export CLICOLOR=1
export LSCOLORS=gxGxcxdxCxegedabagacad
export EDITOR=vim

source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
PS1='@\u \W$(__git_ps1 "[\[\033[32m\]%s\[\033[0m\]]")\$ '

# direnv
has_cmd=`which direnv 2>&1`
if [[ "${?}" = "0" ]]; then
	eval "$(direnv hook $SHELL)"
fi

# golangs-a
# export GOPATH=$HOME/go
# export GOROOT=/usr/local/opt/go/libexec
# export PATH=$HOME/.rbenv/bin:$GOPATH/bin:$GOROOT/bin:/usr/local/bin:$HOME/.bash_ext:$HOME/.nodebrew/current/bin:$PATH

has_cmd=`which rbenv 2>&1`
if [[ "${?}" = "0" ]]; then
	eval "$(rbenv init -)"
fi

# aliases
#			shell
alias ll='ls -alG'
alias search='find . -name'
alias op='open -a '
alias v='vim'

#			git
alias g_s='git status'
alias g_cm='git commit -m'
alias g_l='git log --oneline'
alias g_ll='git log --oneline -5'
alias g_l10='git log --oneline -10'
alias g_ref='git reflog -10'
alias g_co='git checkout'
alias g_b='git branch'
alias g_d='git diff'
alias g_d.d='git difftool --dir-diff'
alias g_p='git pull'
alias g_f='git fetch'
alias g_m='git merge'
alias g_ch='git checkout'
alias g_ch.b='git checkout -b'
alias bash.reload='source $HOME/.bash_profile'
alias bash.edit='vim $HOME/.bash_profile'

# load extension functions.
if [ -e "/cygdrive" ]; then
	echo "load extension. for cygwin."
	source $HOME/.bash_ext/cygwin.sh
fi

