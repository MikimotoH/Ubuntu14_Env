# Ubuntu14_Env
Ubuntu 14.04 LTS env

### install oh-my-zsh zsh-syntax-highlight
```
zsh
sudo chsh -s `which zsh` miki
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### install tmux 2.0 and tpm
```
sudo apt-get install -y python-software-properties software-properties-common
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update
sudo apt-get install -y tmux
tmux -V
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### install vim vundle
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
vim ~/.vimrc
```

### install Xrdp xfce4
```
sudo apt-get install xfce4 xfce4-goodies xrdp
# sudo apt-get install xubuntu-desktop
echo xfce4-session > ~/.xsession
sudo cp ~/.xsession /etc/skel
sudo vim /etc/xrdp/xrdp.ini
sudo service xrdp restart
export DISPLAY=:1
vncserver -geometry 1366x768 -depth 16 #setup password
xfce4-session --display=:1 &
# startxfce4 &
```

### apply my settings
```
git clone https://github.com/MikimotoH/Ubuntu14_Env/
cd Ubuntu14_Env
cp ./.{zshrc,vimrc,tmux.conf,gitconfig,xsession} ~/
```
