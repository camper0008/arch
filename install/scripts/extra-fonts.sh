#!/bin/sh

# east asian etc characters
sudo pacman -S adobe-source-han-serif-otc-fonts adobe-source-han-sans-otc-fonts --noconfirm

# emojis
sudo pacman -S base-devel --noconfirm
mkdir font_build && cd font_build
git clone https://aur.archlinux.org/ttf-twemoji.git
cd ttf-twemoji
makepkg -si
