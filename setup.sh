#!/bin/bash 

# bash
DOT_FILES=(.bash_profile .bashrc .inputrc)
for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done

# tmux
DOT_FILES=(.tmux.conf)
for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done

# nvim
DOT_FILES=(init.vim)
for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/.config/nvim/$file
done
