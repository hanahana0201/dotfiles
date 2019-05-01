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
