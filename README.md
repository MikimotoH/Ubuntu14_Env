# Ubuntu14_Env
Ubuntu 14.04 LTS env

### install oh-my-zsh antigen
```
sudo apt update && sudo apt install zsh git vim neovim tmux exuberant-ctags silversearcher-ag -y
zsh  # select 0
sudo chsh -s `which zsh` $USER
cat /etc/passwd | grep $USER
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -L git.io/antigen > ~/antigen.zsh
git clone https://github.com/MikimotoH/Ubuntu14_Env/
cd Ubuntu14_Env
cp ./.{zshrc,gitconfig,antigenrc} ~/
source ~/.zshrc
# fzf installataion depends on vimrc fzf  
vi ~/.oh-my-zsh/themes/rkj.zsh-theme # change %I to %H
```

### install tmux 2.0 and tpm
```
cp ./.tmux.conf ~/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux
# press "Ctrl-B Shift+I" to install Plugins
# press "Ctrl-B ESC Shitf-/" to test search in tmux buffer
```

### install vim vundle
```
cp ./.vimrc ~/
mkdir -p ~/.config/nvim/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
vim ~/.vimrc
vim ~/.config/nvim/init.vim
# black: python code formatter
sudo python3 -m pip install black
```

### install YouCompleteMe
```
sudo apt-get install cmake -y
cd ~/.vim/bundles/YouCompleteMe/
/usr/bin/python3 ./install.py
```

### fzf
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

```

### install Xrdp xfce4
```
sudo apt-get install xfce4 xfce4-goodies xrdp vnc4server -y
# sudo apt-get install xubuntu-desktop
sudo cp ~/.xsession /etc/skel
sudo vim /etc/xrdp/xrdp.ini
# modify port=-1 to port=ask-1
sudo service xrdp restart
export DISPLAY=:1
vnc4server -geometry 1366x768 -depth 16 :1
# setup password
xfce4-session --display=:1 &
# startxfce4 &

# xfonts
sudo apt-get install xfonts-base xfonts-100dpi  xfonts-75dpi xfonts-cyrillic xfonts-scalable 
# chinese fonts
sudo apt-get install xfonts-wqy fonts-wqy-zenhei
# japanese fonts
sudo apt-get install fonts-takao-mincho
```

