# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/bin/bash

autoload zargs

export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin
export LANG=ja_JP.UTF-8
export LC_ALL=en_US.UTF-8

# OS 別の設定
for v in ".zshrc_$L_OSTYPE"; do
	local load_file="$ZDOTDIR/${v}"
	test -f $load_file && . $load_file && echo "loaded $load_file"
done

# loading local setttings
local zsh_local_resource="$ZDOTDIR/zsh.local"
if test -f $zsh_local_resource; then
	. $zsh_local_resource && echo "loaded $zsh_local_resource"
fi

for v in "functions/.zsh_functions"; do
	local load_file="$ZDOTDIR/${v}"
	test -f $load_file && . $load_file && echo "loaded $load_file"
done

# ツール初期化、環境変数設定
# FIXME: そのうち移動させること
cmd_exists rbenv && {
	eval "$(rbenv init - zsh)"
	export PATH="$PATH:$HOME/.rbenv/bin"
}
cmd_exists nodebrew && export PATH="$PATH:$HOME/.nodebrew/current/bin:"

# その他変数
local snippets_file_path=$HOME/.snippets

# 色を使用出来るようにする
autoload -Uz colors;colors

# ヒストリの設定
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
PROMPT="@%n%{${fg[green]}%}[%~]%{$reset_color%}
# "

# 単語の区切り文字を指定する
autoload -Uz select-word-style;select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする

autoload -Uz compinit && compinit
compinit -d /tmp/$USER.zcompdump

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

zstyle ':completion:*:default' menu select=2

#######################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
#setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{blue}+"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}*"
zstyle ':vcs_info:git:*' confilizt
zstyle ':vcs_info:*' formats '%F{green}%c%u[%b]%f'
zstyle ':vcs_info:*' actionformats '[%b|%F{red}%a%f]'
function _vsc_precmd() {
  LANG=en_US.UTF-8 vcs_info
	RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _vsc_precmd

########################################
bindkey '^h' fzf-select-history
bindkey "^g^b" fzf-git-recent-branches
bindkey "^g^i" fzf-git-open-issue
bindkey "^g^p" fzf-git-open-pr
bindkey '^gb' input_current_branch
bindkey '^q' fzf-find-file
bindkey '^f^f' fzf-find-file
bindkey '^sf' fzf-snippets
bindkey '^si' fzf-snippets-add
bindkey "^g^r" fzf-recent-repos

bindkey -r "^d" 				# logoutがbindされているので、無効化しておく
bindkey "^d^p" fzf-find-docker-ps
bindkey "^k^p" fzf-find-aws-profile
########################################
# オプション

setopt print_eight_bit 			# displayable Japanese chars.
setopt no_beep
# Ctrl+S,Ctrl+Qのフローコントロールを無効
setopt no_flow_control
setopt ignore_eof				# Ctrl＋D typed, but do not exit zsh process.
setopt interactive_comments     # treat everything after '#'' as comment.
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

# シェル終了時処理中ジョブをHUPしない
setopt no_hup
# バックグラウンドジョブの終了通知
setopt notify
# 補完リストを小さくする
setopt list_packed


########################### 
# history settings

setopt share_history
setopt extended_history
setopt hist_ignore_dups	
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_ignore_all_dups
setopt hist_no_store
setopt inc_append_history

###########################

setopt correct
setopt auto_param_slash       # ディレクトリ移動時に末尾slash補完
setopt auto_menu
setopt auto_param_keys        # 括弧補完
setopt interactive_comments   # コマンドラインでのコメント有効化
setopt magic_equal_subst      # 引数補完
setopt complete_in_word
setopt always_last_prompt

########################################
# key binding.

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
#bindkey '^R' history-incremental-pattern-search-backward
bindkey '\e[1~'  beginning-of-line
bindkey '\e[4~' end-of-line

########################################
# alias
alias search='find . -name'
alias pp='echo'
alias lastcode='echo $?'
alias p.f='find_process '
alias history='history -t "%Y-%m-%d %a %H:%M:%S"'
alias ...="cd ../../"
alias ....="cd ../../../"
alias shell.rc.edit='vim $HOME/.zsh/.zshrc'
alias shell.rc.reload="source $HOME/.zsh/.zshrc"
alias shell.rc.dir="cd $(dirname `readlink $HOME/.zsh`)"
alias shell.env.edit='vim $HOME/.zshenv'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

alias be='bundle exec'
alias snip.edit="vim $snippets_file_path"
alias rein="exec $SHELL -l"

# 
# Cを付与することで標準出力をクリップボードにコピー
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

########################################


# vim:set ft=zsh:

# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh

cmd_exists sheldon && eval "$(sheldon source)"
