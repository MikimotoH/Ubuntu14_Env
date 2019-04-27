# Ubuntu14_Env
Ubuntu 14.04 LTS env

### install oh-my-zsh zsh-syntax-highlight
```
sudo apt-get update
sudo apt-get install zsh git vim -y
zsh  # select 0
sudo chsh -s `which zsh` $USER
cat /etc/passwd | grep $USER
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/MikimotoH/Ubuntu14_Env/
cd Ubuntu14_Env
cp ./.{zshrc,gitconfig,tmux.conf,vimrc,xsession} ~/
source ~/.zshrc
vi ~/.oh-my-zsh/themes/rkj.zsh-theme # change %I to %H
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

### build vim-8.1 for YouCompleteMe
```
sudo apt-get install python3.5 python3.5-dev build-essential cmake3 silversearcher-ag -y
sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev -y
sudo apt remove vim vim-runtime gvim
wget https://github.com/vim/vim/archive/v8.1.1027.tar.gz
tar xvf v8.1.1027.tar.gz
cd vim-8.1.1027
./configure --with-features=huge \
            --enable-multibyte \
	    --enable-rubyinterp=yes \
	    --enable-python3interp=yes \
	    --with-python3-config-dir=$(python3.5-config --configdir) \
	    --enable-perlinterp=yes \
	    --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
	   --prefix=/usr/local
make -j$(nproc) VIMRUNTIMEDIR=/usr/local/share/vim/vim81
sudo make install
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim

unalias ag
cd ~/.vim/bundles/YouCompleteMe/
./install.py
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

