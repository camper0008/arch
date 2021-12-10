#!/bin/sh

FOLDER="~/camper_install_files"

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
sudo pacman -S ttf-fira-code --noconfirm

echo "Building simple terminal"
mkdir $FOLDER/build && cd $FOLDER/build
echo "Cloning st"
git clone https://git.suckless.org/st && cd st
echo "Replacing config"
wget -O config.h https://raw.githubusercontent.com/camper0008/arch/stable/install/config/st-config.h
sudo make clean install

echo "Creating configuration files"
cp /etc/X11/xinit/xinitrc ~/.xinitrc
mkdir -p ~/.config/awesome/
cd ~/.config/awesome
wget -O rc.lua https://raw.githubusercontent.com/camper0008/arch/stable/install/config/awesome-rc.lua

echo "Installing awesome theme"
cd /usr/share/awesome/themes
sudo git clone https://github.com/hmix/awesome-wm-nord-theme.git nord

echo "Editing awesome theme"
awk '{ gsub(/^theme\.font\s+=\s+.*/, "theme.font = \"Fira Code Medium 10\""); print }' nord/theme.lua > /tmp/theme.lua.tmp
cat /tmp/theme.lua.tmp | sudo dd of=nord/theme.lua

echo "Editing awesome config"
awk '{ gsub(/default\/theme\.lua/, "nord/theme.lua"); print }' ~/.config/awesome/rc.lua > /tmp/rc.lua.tmp
cat /tmp/rc.lua.tmp > ~/.config/awesome/rc.lua

echo "Editing awesome default terminal"
awk '{ gsub(/terminal = "xterm"/, "terminal = \"st\""); print }' ~/.config/awesome/rc.lua > /tmp/rc.lua.tmp
cat /tmp/rc.lua.tmp > ~/.config/awesome/rc.lua

echo "Editing awesome default editor"
awk '{ gsub(/editor = os.getenv\("EDITOR"\) or "nano"/, "editor = os.getenv(\"EDITOR\") or \"nvim\""); print }' ~/.config/awesome/rc.lua > /tmp/rc.lua.tmp
cat /tmp/rc.lua.tmp > ~/.config/awesome/rc.lua

echo "Configuring .xinitrc"
awk '{ gsub(/^((twm)|(xclock)|(xterm)|(exec xterm)).*/, ""); print }' ~/.xinitrc > /tmp/.xinitrc.tmp
echo "setxkbmap -layout dk" >> /tmp/.xinitrc.tmp
echo "exec awesome" >> /tmp/.xinitrc.tmp
cat /tmp/.xinitrc.tmp > ~/.xinitrc

echo "Configuring neovim"
curl -fLo $FOLDER/neovim-install.sh \
    https://raw.githubusercontent.com/camper0008/arch/stable/install/scripts/neovim.sh
sh $FOLDER/neovim-install.sh

echo "Configuring .bashrc"
curl -fLo ~/.bashrc \
    https://raw.githubusercontent.com/camper0008/arch/stable/install/config/.bashrc

echo "Configuring firefox"
curl -fLo $FOLDER/firefox-install.sh \
    https://raw.githubusercontent.com/camper0008/arch/stable/install/scripts/firefox.sh
sh $FOLDER/firefox-install.sh

echo "Removing installation files"
rm -r $FOLDER

echo ""
echo "Installation finished. Execute 'startx' to run."
