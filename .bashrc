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
# git branch
alias gb='git branch'
# リモートも表示する
alias gba='git branch -a'

# git status --short --branch の略。省略表記しつつブランチ名も確認できる
alias gs='git status -sb'
# 普通の git status
alias gst='git status'

# git add
alias ga='git add'
# git add .
alias gaa='git add .'
# 空コミット。大抵は初回コミットで使うので Init というエイリアスにしている。コメントは Vim で入れる
alias ginit='git commit --allow-empty'
# git commit。その場でコメントを打てるように -m オプション付き
alias gc='git commit -m'
# git checkout
alias gco='git checkout'
# git log … シンプル表示・10件のみ表示
alias gl=' git log --date=short --pretty=format:"%C(Yellow)%h %C(Cyan)%cd %C(Reset)%s %C(Blue)[%cn]%C(Red)%d" -10'
# git log … グラフ表示
alias glr='git log --date=short --pretty=format:"%C(Yellow)%h %C(Cyan)%cd %C(Reset)%s %C(Blue)[%cn]%C(Red)%d" --graph'
# git log … 修正ライン数が分かる
alias gll='git log --date=short --pretty=format:"%C(Yellow)%h %C(Cyan)%cd %C(Reset)%s %C(Blue)[%cn]%C(Red)%d" --numstat'

# git pull
alias gpl='git pull'
# git push
alias gps='git push'
# git push origin HEAD
alias gpoh='git push origin HEAD'
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
