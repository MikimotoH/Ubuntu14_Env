# Ubuntu14_Env
Ubuntu 14.04 LTS env

### run [install.sh](install.sh) as regular user which is a sudo member
After oh-my-zsh asked you to set zsh to default, the script comes to stop, you need to Ctrl-D to continue the script

### install oh-my-zsh antigen
```
sudo apt update && sudo apt install python3-pip zsh git vim neovim tmux exuberant-ctags yes silversearcher-ag curl wget -y
zsh  # select 0
sudo chsh -s `which zsh` $USER
cat /etc/passwd | grep $USER
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -L git.io/antigen > ~/antigen.zsh
git clone https://github.com/MikimotoH/Ubuntu14_Env/
cd Ubuntu14_Env
cp ~/Ubuntu14_Env/.{zshrc,gitconfig,antigenrc} ~/
# fix antigen error to install fzf-zsh-plugin
mkdir -p ~/.antigen/bundles/unixorn
git clone https://github.com/unixorn/fzf-zsh-plugin ~/.antigen/bundles/unixorn/fzf-zsh-plugin
source ~/.zshrc
# fzf installataion depends on vimrc fzf  
cp ~/Ubuntu14_Env/rkj.zsh-theme  ~/.oh-my-zsh/themes/rkj.zsh-theme
cd ~/.oh-my-zsh
git commit -a -m 'change %I to %H'
```

### install tmux 2.0 and tpm
```
cp ~/Ubuntu14_Env/.tmux.conf ~/
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
cd ~/.vim/bundle/YouCompleteMe/
/usr/bin/python3 ./install.py
```

### fzf
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

```

### Change Kitty(Putty) Color Scheme

- The default `**` in Putty Color Scheme shows #0000BB which is very similar to bkg color
- at Windows download https://github.com/MikimotoH/putty-color-themes ZIP file
- edit '46. Tomorrow Night.reg'
- modify session-name of `[HKEY_CURRENT_USER\Software\SimonTatham\PuTTY\Sessions\{session-name}]` 
- change `"Colour7"="78,81,47"`
- install '46. Tomorrow Night.reg'
- use convert_reg_to_WindowsTerminalSettingsJson.py to convert reg to Windows Terminal settings.json
- Insert json to "%LocalAppData%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"



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

