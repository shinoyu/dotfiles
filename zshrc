# License : MIT
# http://mollifier.mit-license.org/
########################################
# 環境変数
export LANG=ja_JP.UTF-8
export CLICOLOR=1
export LSCOLORS=gxGxcxdxCxegedabagacad
export GOPATH="$HOME/_/go/third-party:$HOME/_/go/project"
export PATH="$HOME/.rbenv/bin:/usr/local/bin:$HOME/Library/Android/sdk/platform-tools:$PATH"
export EDITOR="vim"
export PAGER="less"
export VISUAL="vim"

if type rbenv >/dev/null 2>&1; then
	eval "$(rbenv init - zsh)"
fi
if type direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi
if type hub >/dev/null 2>&1; then
	eval "$(hub alias -s)"
fi

# 色を使用出来るようにする
autoload -Uz colors
colors

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
PROMPT="@%n%{${fg[green]}%}[%~]%{$reset_color%}
# "

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -Uz compinit
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
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --layout=bottom-up --query "$LBUFFER")
    CURSOR=$#BUFFER
}
zle -N peco-select-history
bindkey '^h' peco-select-history

function peco-git-recent-branches () {
    local selected_branch=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/heads | \
        perl -pne 's{^refs/heads/}{}' | \
        peco --layout=bottom-up)
    if [ -n "$selected_branch" ]; then
        BUFFER="git checkout ${selected_branch}"
        zle accept-line
    fi
}
zle -N peco-git-recent-branches
bindkey "^g^b" peco-git-recent-branches


function peco-find-file() {
  if git rev-parse 2> /dev/null; then
    source_files=$(git ls-files)
  else	
    source_files=$(find . -type f)
  fi
  selected_files=$(echo $source_files | peco --prompt "[find file]" --layout=bottom-up)
	BUFFER="${BUFFER}$(echo $selected_files | tr '\n' ' ')"
	CURSOR=$#BUFFER
}
zle -N peco-find-file
bindkey '^q' peco-find-file

########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
# setopt extended_glob

########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
#bindkey '^R' history-incremental-pattern-search-backward

########################################
# エイリアス
alias la='ls -a'
alias ll='ls -alG'
alias search='find . -name'
alias v='vim'
alias shell.rc.edit='vim ~/.zshrc'
alias shell.rc.reload="source ~/.zshrc"

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# For git
alias g_s='git status -sb'
alias g_cm='git commit'
alias g_cm_r='git commit --amend'
alias g_l='git log --oneline'
alias g_ll='git log --oneline -5'
alias g_l10='git log --oneline -10'
alias g_ref='git reflog -10'
alias g_b='git branch'
alias g_b_d='git branch -D'
alias g_d='git diff'
alias g_d_d='git difftool --dir-diff'
alias g_p='git pull'
alias g_f='git fetch'
alias g_m='git merge'
alias g_ch='git checkout'
alias g_ch_t='git checkout --theirs'
alias g_ch_o='git checkout --own'
alias g_s_u='git submodule update'
alias g_c_u='git symbolic-ref --short HEAD | xargs git pull origin'
alias g_cb='git symbolic-ref --short HEAD'
alias be='bundle exec'

function input_current_branch() {
	BUFFER+=$(eval "git symbolic-ref --short HEAD")
	CURSOR=$#BUFFER
}
zle -N input_current_branch
bindkey '^gb' input_current_branch



# key bind

# グローバルエイリアス

# C で標準出力をクリップボードにコピーする
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
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        alias op='open -a '
        bindkey '^[[H' beginning-of-line
        bindkey '^[[F' end-of-line
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac

# vim:set ft=zsh:
