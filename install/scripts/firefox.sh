echo "Installing firefox"
sudo pacman -S firefox --noconfirm
echo "Downloading configuration"
echo "Downloading firefox profile"
curl -fLo ~/.mozilla/firefox/firefox-profile.tar --create-dirs \
    https://raw.githubusercontent.com/camper0008/arch/main/install/config/firefox-profile.tar
echo "Unzipping folder"
echo "Installing dependencies"
sudo pacman -S tar --noconfirm --needed
echo "Unzipping"
cd ~/.mozilla/firefox/
tar -xf firefox-profile.tar
mv firefox-profile custom.camper
rm firefox-profile.tar
echo "Downloading firefox profile settings"
curl -fLo ~/.mozilla/firefox/profiles.ini --create-dirs \
    https://raw.githubusercontent.com/camper0008/arch/main/install/config/firefox-profiles.ini
echo "Setup finished"
