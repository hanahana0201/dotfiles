#!/bin/bash 

# bash
DOT_FILES=(.bash_profile .bashrc .inputrc)
for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done
