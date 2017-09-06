# -------------------------------------
# 環境変数
# -------------------------------------

# SHで接続した先で日本語が使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# editor
export EDITOR=vim
export XDG_CONFIG_HOME=$HOME/.config

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

# rbenv
eval "$(rbenv init -)"
export RBENV_ROOT=$HOME/.rbenv
export PATH=$RBENV_ROOT/shims:$PATH

# Java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Android Studio
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools

# Go
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$PATH

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# ANT
export ANT_HOME="/usr/local/bin/ant/"
export PATH="$PATH:$ANT_HOME/bin"

# Powerline
export PATH="$HOME/.local/bin:$PATH"
powerline-daemon -q
. $PYENV_ROOT/versions/2.7.10/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# less
export LESS='-R'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'

# その他
export LSCOLORS=hxfxcxdxbxegedabagacad

# -------------------------------------
# 履歴
# -------------------------------------

# 履歴を保存するファイルを指定
HISTFILE="$HOME/.history_zsh"

# 履歴の件数
HISTSIZE=100000
SAVEHIST=100000

# 重複した履歴を保存しない
setopt hist_ignore_dups

# 履歴を共有する
setopt share_history

# 履歴の検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# -------------------------------------
# zshのオプション
# -------------------------------------

## 補完機能の強化
autoload -U compinit
compinit

# ビープを鳴らさない
setopt nobeep

## 色を使う
setopt prompt_subst

## ^Dでログアウトしない。
setopt ignoreeof

## バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify

# 補完
## タブによるファイルの順番切り替えをしない
unsetopt auto_menu

# cd -[tab]で過去のディレクトリにひとっ飛びできるようにする
setopt auto_pushd

# pushdの履歴を残さない
setopt pushd_ignore_dups

# ディレクトリ名を入力するだけでcdできるようにする
setopt auto_cd

# -------------------------------------
# パス
# -------------------------------------

# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath

path=(
    $HOME/bin(N-/)
    /usr/local/bin(N-/)
    /usr/local/sbin(N-/)
    $path
)

# -------------------------------------
# プロンプト
# -------------------------------------

# autoload -U promptinit; promptinit
# autoload -Uz colors; colors
# autoload -Uz vcs_info
# autoload -Uz is-at-least
#
# PROMPT="
#  %F{yellow}%~%f
# %F{white}[%*%f %F{cyan}%n%f %F{white}]%f%F{magenta}%#%f "

# RPROMPT="[%*]"

# -------------------------------------
# エイリアス
# -------------------------------------

# -n 行数表示, -I バイナリファイル無視, svn関係のファイルを無視
alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"

# ls
alias ls="ls -G" # color for darwin
alias l="ls -la"
alias la="ls -la"
alias l1="ls -1"

# docker
alias doc="docker"
alias docc="docker-compose"
alias doc-none="docker images | awk '/<none/{print $3}' | xargs docker rmi"

# tree
alias tree="tree -NC" # N: 文字化け対策, C:色をつける

# -------------------------------------
# キーバインド
# -------------------------------------

bindkey -e

function cdup() {
   echo
   cd ..
   zle reset-prompt
}
zle -N cdup
bindkey '^K' cdup

bindkey "^R" history-incremental-search-backward

# -------------------------------------
# その他
# -------------------------------------

# cdしたあとで、自動的に ls する
function chpwd() { ls }

# added by travis gem
[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"

# run tmux
if [[ ! -n $TMUX && $- == *l* ]]; then
  # get the IDs
  ID="`tmux list-sessions`"
  if [[ -z "$ID" ]]; then
    tmux new-session
  fi
  create_new_session="Create New Session"
  ID="$ID\n${create_new_session}:"
  ID="`echo $ID | $PERCOL | cut -d: -f1`"
  if [[ "$ID" = "${create_new_session}" ]]; then
    tmux new-session
  elif [[ -n "$ID" ]]; then
    tmux attach-session -t "$ID"
  else
    :  # Start terminal normally
  fi
fi
