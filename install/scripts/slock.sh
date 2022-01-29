sudo pacman -S wget --noconfirm
git clone https://git.suckless.org/slock
cd slock
wget -O config.h https://raw.githubusercontent.com/camper0008/arch/main/install/config/slock-config.h
sudo make clean install
