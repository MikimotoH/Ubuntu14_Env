# Ubuntu14_Env
Ubuntu 14.04 LTS env

### install oh-my-zsh zsh-syntax-highlight
```
sudo apt-get install zsh git vim -y
zsh
sudo chsh -s `which zsh` $USER
cat /etc/passwd | grep $USER
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MikimotoH/Ubuntu14_Env/
cd Ubuntu14_Env
cp ./.{zshrc,gitconfig,tmux.conf,vimrc,xsession} ~/
source ~/.zshrc
```

### install tmux 2.0 and tpm
```
sudo apt-get install -y python-software-properties software-properties-common
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update
sudo apt-get install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux
# press "Ctrl-B I" to install Plugins
```

### install vim vundle
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
vim ~/.vimrc
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
```

