#!/bin/sh

FOLDER=~/camper_install_files

mkdir $FOLDER

echo "What video driver do you want to use? (https://wiki.archlinux.org/title/Xorg#Driver_installation)"
echo "Supported video drivers:"
echo "xf86-video-amdgpu (amd)"
echo "xf86-video-ati (amd-ati)"
echo "xf86-video-intel (intel)"
echo "xf86-video-nouveau (nvidia)"
echo "xf86-video-fbdev (virtualbox)"
read VIDEO_DRIVER

echo "Installing required packages"
# split package installations incase it's unable to find one of them
sudo pacman -S base-devel --noconfirm
sudo pacman -S $VIDEO_DRIVER --noconfirm
sudo pacman -S xorg xorg-xinit --noconfirm
sudo pacman -S awesome mesa --noconfirm
sudo pacman -S alacritty --noconfirm
sudo pacman -S unzip --noconfirm
sudo pacman -S git --noconfirm

echo "Creating configuration files"
cp /etc/X11/xinit/xinitrc ~/.xinitrc
mkdir -p ~/.config/awesome/
cd ~/.config/awesome
wget -O rc.lua https://raw.githubusercontent.com/camper0008/arch/stable/install/config/awesome-rc.lua

echo "Installing awesome theme"
cd /usr/share/awesome/themes
sudo git clone https://github.com/camper0008/awesome-wm-nord-theme.git nord

echo "Configuring .xinitrc"
awk '{ gsub(/^((twm)|(xclock)|(xterm)|(exec xterm)).*/, ""); print }' ~/.xinitrc > /tmp/.xinitrc.tmp
echo "setxkbmap -layout dk" >> /tmp/.xinitrc.tmp
echo "exec awesome" >> /tmp/.xinitrc.tmp
cat /tmp/.xinitrc.tmp > ~/.xinitrc

echo "Configuring neovim"
cd $FOLDER
wget -O neovim-install.sh https://raw.githubusercontent.com/camper0008/arch/stable/install/scripts/neovim.sh
sh $FOLDER/neovim-install.sh

echo "Configuring .bashrc and .alacritty.yml"
cd ~
wget -O .bashrc https://raw.githubusercontent.com/camper0008/arch/stable/install/config/.bashrc
wget -O .alacritty.yml https://raw.githubusercontent.com/camper0008/arch/stable/install/config/.alacritty.yml

echo "Installing prompt-shortener"
cd $FOLDER
wget -O prompt-shortener.sh https://raw.githubusercontent.com/camper0008/arch/stable/install/scripts/prompt-shortener.sh
sh $FOLDER/prompt-shortener.sh

echo "Configuring firefox"
cd $FOLDER
wget -O firefox-install.sh https://raw.githubusercontent.com/camper0008/arch/stable/install/scripts/firefox.sh
sh $FOLDER/firefox-install.sh

echo "Installing slock"
cd $FOLDER
wget -O slock-install.sh https://raw.githubusercontent.com/camper0008/arch/stable/install/scripts/slock.sh
sh $FOLDER/slock-install.sh

echo "Installing gtk dark theme"
cd $FOLDER
wget -O gtk-dark-theme.sh https://raw.githubusercontent.com/camper0008/arch/stable/install/scripts/gtk-dark-theme.sh
sh $FOLDER/gtk-dark-theme.sh

echo "Installing fonts"
cd $FOLDER
wget -O red_hat_mono.zip https://raw.githubusercontent.com/camper0008/arch/stable/install/config/Red_Hat_Mono.zip
sudo mkdir -p /usr/local/share/fonts/RedHatMono
cd /usr/local/share/fonts/RedHatMono
sudo unzip $FOLDER/red_hat_mono.zip

cd $FOLDER
wget -O extra-fonts.sh https://raw.githubusercontent.com/camper0008/arch/stable/install/scripts/extra-fonts.sh
sh $FOLDER/extra-fonts.sh

echo "Removing installation files"
cd ~
rm -rf $FOLDER

echo ""
echo "Installation finished. Execute 'startx' to run."
