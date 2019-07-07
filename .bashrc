# Gitブランチ名を表示
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/.git-prompt.sh

# Gitブランチの状況を*+%で表示
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# 出力の後に改行を入れる
function add_line {
  if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}
PROMPT_COMMAND='add_line'

# プロンプトで表示する内容
export PS1='\[\e[37;100m\] \# \[\e[90;47m\]\[\e[30;47m\] \W \[\e[37m\]$(__git_ps1 "\[\e[37;102m\] \[\e[30m\] %s \[\e[0;92m\]")\[\e[49m\]\[\e[m\] \$ '

# 先に、Menlo-forPowerlineをなどの記号文字を含むフォントをダウンロードして、ターミナルのフォントに指定する必要があります。


# 履歴補完で前方一致
bind '"\C-n": history-search-forward'
bind '"\C-p": history-search-backward'
# 上矢印キー
bind '"\e[A": history-search-backward'
# 下矢印キー
bind '"\e[B": history-search-forward'

# nodebrewのパス
export PATH=$HOME/.nodebrew/current/bin:$PATH

# 環境変数のLANGを修正
export LANG=ja_JP.UTF-8

# コマンド補完ツールを有効
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi


# lsの色
alias ls='ls -G'

# vimでnvimを起動
alias vim='nvim'

# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gb='git branch'
alias gbd='git branch -d '
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias gl='git log'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gp='git pull'
alias gss='git status -s'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstd='git stash drop'
 
# ----------------------
# Git Function
# ----------------------
# Git log find by commit message
function glf() { git log --all --grep="$1"; }

# nvim init.vimのパス
export XDG_CONFIG_HOME="$HOME/.config"

# pyenvのパス
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export TERM=xtermx

# カラー設定
export TERM=xterm

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
