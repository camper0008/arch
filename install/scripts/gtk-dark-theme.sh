#!/bin/sh

cd /usr/share/themes/
sudo git clone https://github.com/dracula/gtk.git Dracula
echo "[Settings]" | sudo tee /etc/gtk-3.0/settings.ini
echo "gtk-application-prefer-dark-theme = true" | sudo tee -a /etc/gtk-3.0/settings.ini
echo "gtk-theme-name = Dracula" | sudo tee -a /etc/gtk-3.0/settings.ini
cd -
