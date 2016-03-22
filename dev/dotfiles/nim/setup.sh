#!/bin/bash

cd $HOME

mkdir prefix
cd prefix
wget http://nim-lang.org/download/nim-0.13.0.tar.xz
tar xf nim-0.13.0.tar.xz

(
	cd nim-0.13.0
	./build.sh
)

ln -s nim-0.13.0 nim

PATH=$PATH:$HOME/prefix/nim/bin

mkdir -p $HOME/tmp
cd $HOME/tmp

(
	git clone https://github.com/nim-lang/nimble.git
	cd nimble
	git clone -b v0.13.0 --depth 1 https://github.com/nim-lang/nim vendor/nim
	nim -d:release c -r src/nimble install
)

rm -rf nimble

PATH=$PATH:$HOME/.nimble/bin

nimble refresh

nimble install nimsuggest
nimble install c2nim
