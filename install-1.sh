#!/bin/bash

set +e
echo "apt update"
sudo apt update
echo "apt install zsh"
sudo apt install zsh python3-pip git vim neovim tmux exuberant-ctags passwd silversearcher-ag curl wget -y
echo "zsh"
zsh  
echo "select 0"
# select 0
