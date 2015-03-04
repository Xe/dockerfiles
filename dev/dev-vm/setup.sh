#!/bin/bash -x

# Install oh my zsh
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | bash

function setlink
{
        ln -s $HOME/code/dotfiles/$1 $HOME/$1
}

rm ~/.zshrc

#set links
setlink .zshrc
setlink .zsh
setlink .vim
setlink .vimrc
setlink .cheat
setlink .gitconfig
setlink .tmux.conf

# Setup vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

head -n 40 ~/.vimrc >> ~/.vimrc-temp

vim -u ~/.vimrc-temp +PluginInstall +qall

rm ~/.vimrc-temp

(cd ~/.vim/bundle/YouCompleteMe; ./install.sh --clang-completer)
(cd ~/.vim/bundle/vimproc.vim; make)

vim +GoInstallBinaries +qall

# Golang stuff
(mkdir -p ~/go/{pkg,bin,src})

go get github.com/mattn/todo
go get github.com/motemen/ghq
go get github.com/Xe/tools/...

echo "Set up!"

rm $0
