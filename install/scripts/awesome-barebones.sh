#!/bin/sh

echo "What video driver do you want to use? (https://wiki.archlinux.org/title/Xorg#Driver_installation)"
echo "Supported video drivers: \
xf86-video-amdgpu\
xf86-video-ati\
xf86-video-intel\
xf86-video-nouveau\
"
read VIDEO_DRIVER

echo "Installing required packages"
sudo pacman -S base-devel $VIDEO_DRIVER awesome mesa lib32-mesa xorg xorg-xinit nitrogen picom nerd-fonts-mononoki --no-confirm

echo "Configuring"
cp /etc/X11/xinit/xinitrc ~/.xinitrc

cp /etc/xdg/awesome/rc.lua ~/.config/awesome/