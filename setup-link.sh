#!/bin/bash

ln -f -s `pwd`/.bashrc.extras ~/.bashrc.extras
ln -f -s `pwd`/.tmux.conf ~/.tmux.conf
ln -f -s `pwd`/.gemrc ~/.gemrc
ln -f -s `pwd`/.ghci ~/.ghci
ln -f -s `pwd`/.psqlrc-9.3 ~/.psqlrc-9.3
chmod 0700 .
chmod 0600 .ghci
ln -f -s `pwd`/.gitconfig ~/.gitconfig


mkdir -p ~/.vim/after
ln -f -s $PWD/ftplugin ~/.vim/after
ln -f -s $PWD/syntax   ~/.vim/after

mkdir -p ~/.xmonad
ln -f -s $PWD/xmonad.hs ~/.xmonad/xmonad.hs

# neovim specific (nvim config folder is below and the .vimrc is called
# init.vim)
ln -f -s $PWD/ ~/.config/nvim
