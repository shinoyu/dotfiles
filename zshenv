autoload zargs
autoload -U compinit

compinit -d /tmp/$USER.zcompdump
export ZDOTDIR="$HOME/.zsh"
export L_OSTYPE=`uname`
uname -a | grep "Microsoft" | grep "Linux">/dev/null && if [ $? -eq 0 ]; then
  export L_OSTYPE=Windows_Linux
fi
