#!/usr/bin/env bash

PLUG_FILE=$HOME/.vim/autoload/plug.vim

if [ -f "$PLUG_FILE" ]; then
	echo "vim-plug exists, skip install"
else
	echo "开始安装vim-plug..."
	curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	echo "完成安装vim-plug..."
fi

echo "soft link to vimrc"
ln -sf "$PWD/vimrc" "$HOME/.vimrc"
