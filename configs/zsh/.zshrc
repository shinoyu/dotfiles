# License : MIT
# http://mollifier.mit-license.org/
########################################

autoload zargs
autoload -U compinit
compinit -d /tmp/$USER.zcompdump

export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin
export LANG=ja_JP.UTF-8
export LC_ALL=en_US.UTF-8

# OS 別の設定
for v in "functions/.zsh_functions" ".zshrc_$L_OSTYPE"; do
	local load_file="$ZDOTDIR/${v}"
	test -f $load_file && . $load_file && echo "loaded $load_file"
done

local zsh_machine_file="$ZDOTDIR/.zshrc_Machine"
if test -f $zsh_machine_file; then
	. $zsh_machine_file && echo "loaded $zsh_machine_file"
else
	touch $zsh_machine_file && echo "create $zsh_machine_file"
fi

# ツール初期化、環境変数設定
# FIXME: そのうち移動させること
cmd_exists rbenv && {
	eval "$(rbenv init - zsh)"
	export PATH="$PATH:$HOME/.rbenv/bin"
}
cmd_exists direnv && eval "$(direnv hook zsh)"
cmd_exists hub && eval "$(hub alias -s)"
cmd_exists git && export PATH="$PATH:/usr/local/share/git-core/contrib/diff-highlight"
cmd_exists nodebrew && export PATH="$PATH:$HOME/.nodebrew/current/bin:"
cmd_exists anyenv && eval "$(anyenv init - zsh)"

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

autoload -U compinit
compinit

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
# peco
# bindkey '^h' peco-select-history
# bindkey "^g^b" peco-git-recent-branches
# bindkey '^q' peco-find-file
# bindkey '^f^f' peco-find-file
# bindkey '^sf' peco-snippets
# bindkey '^si' peco-snippets-add

bindkey '^h' fzf-select-history
bindkey "^g^b" fzf-git-recent-branches
bindkey '^q' fzf-find-file
bindkey '^f^f' fzf-find-file
bindkey '^sf' fzf-snippets
bindkey '^si' fzf-snippets-add
bindkey "^g^r" fzf-recent-repos

bindkey -r "^d" # logoutがbindされているので、無効化しておく
bindkey "^d^p" fzf-find-docker-ps
########################################
# オプション

# 日本語ファイル名を表示可能にする
setopt print_eight_bit
setopt no_beep
# Ctrl+S,Ctrl+Qのフローコントロールを無効
setopt no_flow_control
# Ctrl+Dでzshを終了しない
setopt ignore_eof
# '#' 以降をコメントとして扱う
setopt interactive_comments
setopt auto_cd
# cd したら自動的にpushd
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 高機能なワイルドカード展開を使用する
# setopt extended_glob

# シェル終了時処理中ジョブをHUPしない
setopt no_hup
# バックグラウンドジョブの終了通知
setopt notify
# 補完リストを小さくする
setopt list_packed

setopt share_history
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt inc_append_history
setopt hist_no_store
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

# docker shorthand
alias d.c='docker-compose'
alias d.c.u='docker-compose up'
alias d.c.s='docker-compose stop'
alias d.c.e='docker-compose exec'
alias d.c.r='docker-compose run'
alias d.c.b='docker-compose build'
alias d.s.u='docker-sync-stack start'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# for git
alias g.s='git status -sb'
alias g.cm='git commit'
alias g.cm.r='git commit --amend'
alias g.l='git log --oneline'
alias g.ll='git log --oneline -5'
alias g.l10='git log --oneline -10'
alias g.ref='git reflog -10'
alias g.b='git branch'
alias g.b.d='git branch -D'
alias g.b.ml="git branch --merged | grep -vE '^\*|master$|develop|pre_release$'"
alias g.b.mld='g.b.ml | xargs -I % git branch -d %'
alias g.d='git diff'
alias g.d.d='git difftool --dir-diff'
alias g.p='git pull'
alias g.f='git fetch'
alias g-m='git merge'
alias g.ch='git checkout'
alias g.ch.t='git checkout --theirs'
alias g.ch.o='git checkout --own'
alias g.s.u='git submodule update'
alias g.c.u='git symbolic-ref --short HEAD | xargs git pull origin'
alias g.cb='git symbolic-ref --short HEAD'
alias g.v='git browse'
alias be='bundle exec'
alias snip.edit="vim $snippets_file_path"
alias rein="exec $SHELL -l"

function input_current_branch() {
	BUFFER+=$(eval "git symbolic-ref --short HEAD")
	CURSOR=$#BUFFER
}
zle -N input_current_branch
bindkey '^gb' input_current_branch

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
