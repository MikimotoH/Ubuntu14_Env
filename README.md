# Ubuntu14_Env
compatible to Ubuntu  18.04, 20.04, and 22.04

### run [install.sh](install.sh) as regular user which is a sudo member
After oh-my-zsh asked you to set zsh to default, the script comes to stop, you need to Ctrl-D to continue the script

### Install oh-my-zsh antigen
```
sudo apt update && sudo apt install -y zsh git vim tmux curl
zsh  # select 0
sudo chsh -s `which zsh` $USER
cat /etc/passwd | grep $USER
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -L git.io/antigen > ~/antigen.zsh
cd ~
git clone https://github.com/MikimotoH/Ubuntu14_Env/ ~/Ubuntu14_Env
cp ~/Ubuntu14_Env/.{zshrc,gitconfig,antigenrc} ~/
cp ~/Ubuntu14_Env/rkj.zsh-theme  ~/.oh-my-zsh/themes/rkj.zsh-theme
# fix antigen error to install fzf-zsh-plugin
mkdir -p ~/.antigen/bundles/unixorn
git clone https://github.com/unixorn/fzf-zsh-plugin ~/.antigen/bundles/unixorn/fzf-zsh-plugin
# fzf install
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
source ~/.zshrc

cd ~/.oh-my-zsh
git commit -a -m 'change %I to %H'
```

### Install tmux 2.0 and tpm
```
cp ~/Ubuntu14_Env/.tmux.conf ~/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux
# press "Ctrl-B Shift+I" to install Plugins
# press "Ctrl-B ESC ?" to test search in tmux buffer
```

### Install VNC Server

Refer [How to Install and Configure VNC on Ubuntu 20.04](https://linuxize.com/post/how-to-install-and-configure-vnc-on-ubuntu-20-04/ )

```
sudo apt-get install -y xfce4 xfce4-goodies tigervnc-standalone-server
vncpasswd
# don't set view-only password 
mkdir ~/.vnc
cp ~/Ubuntu14_Env/{xstartup,config} ~/.vnc
# launch vncserver
vncserver
vncserver -list
vncserver -kill :1
# enable vnc service after startup 
sudo cp ~/Ubuntu14_Env/vncserver@.service /etc/systemd/system/
sudo vim /etc/systemd/system/vncserver@.service
# change User as `whoami` at line 7
sudo systemctl daemon-reload
sudo systemctl enable vncserver@1.service
sudo systemctl start vncserver@1.service
sudo systemctl status vncserver@1.service
```


#### Create SSH Tunneling
 * -L {local_port}:{remote_host}:{remote_port}
 * -N Do not execute a remote command. This is useful for just forwarding ports. 
 * -f  Requests ssh to go to background just before command execution. 
```
ssh -L 5901:127.0.0.1:5901 -N -f ubuntu@192.168.33.10
```

#### Old VNC setting
```
vnc4server -geometry 1366x768 -depth 16 :1
# setup password
xfce4-session --display=:1 &

# xfonts
sudo apt-get install xfonts-base xfonts-100dpi  xfonts-75dpi xfonts-cyrillic xfonts-scalable 
# chinese fonts
sudo apt-get install xfonts-wqy fonts-wqy-zenhei
# japanese fonts
sudo apt-get install fonts-takao-mincho
```

### Install vim vundle for python IDE 
```
sudo apt install python3-pip exuberant-ctags -y
cp ./.vimrc ~/
mkdir -p ~/.config/nvim/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
vim ~/.vimrc
vim ~/.config/nvim/init.vim
# black: python code formatter
sudo python3 -m pip install black
```

### Install YouCompleteMe
```
sudo apt-get install cmake -y
cd ~/.vim/bundle/YouCompleteMe/
/usr/bin/python3 ./install.py
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

