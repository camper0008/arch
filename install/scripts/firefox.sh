echo "Installing firefox"
sudo pacman -S firefox --noconfirm
echo "Downloading configuration"
echo "Downloading firefox profile"
mkdir ~/.mozilla/firefox/ -p
wget -P ~/.mozilla/firefox/ https://raw.githubusercontent.com/camper0008/arch/main/install/config/firefox-profile.tar
echo "Unzipping folder"
echo "Installing dependencies"
sudo pacman -S tar --noconfirm --needed
echo "Unzipping"
cd ~/.mozilla/firefox/
tar -xf firefox-profile.tar
mv firefox-profile custom.camper
rm firefox-profile.tar
echo "Downloading firefox profile settings"
wget -O profiles.ini -P ~/.mozilla/firefox/ https://raw.githubusercontent.com/camper0008/arch/main/install/config/firefox-profiles.ini
echo "Setup finished"
