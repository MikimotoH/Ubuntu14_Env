#!/bin/bash

set +e
echo "chsh -s /usr/bin/zsh"
sudo chsh -s `which zsh` $USER
echo "install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 
echo "install antigen"
curl -L git.io/antigen > ~/antigen.zsh
echo "cp zshrc to $HOME e"
cp ./.{zshrc,gitconfig,antigenrc,.tmux.conf} ~/ 
echo "modify ZSH theme"
cp ./rkj.zsh-theme  ~/.oh-my-zsh/themes/rkj.zsh-theme 
echo "fix antigen error to install fzf-zsh-plugin"
mkdir -p ~/.antigen/bundles/unixorn 
git clone https://github.com/unixorn/fzf-zsh-plugin ~/.antigen/bundles/unixorn/fzf-zsh-plugin 
## install fzf
echo "install fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf 
~/.fzf/install 
echo "source zshrc"
source ~/.zshrc  
echo "commit changed rkj.zsh-theme"
(cd ~/.oh-my-zsh; git commit -a -m 'change %I to %H')
echo "install tmux 2.0 and tpm"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 
echo "run tmux"
tmux
# press "Ctrl-B Shift+I" to install Plugins
# press "Ctrl-B ESC Shitf-/" to test search in tmux buffer

