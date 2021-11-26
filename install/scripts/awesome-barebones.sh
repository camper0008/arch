#!/bin/sh

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

echo "Configuring"
cp /etc/X11/xinit/xinitrc ~/.xinitrc

cp /etc/xdg/awesome/rc.lua ~/.config/awesome/
