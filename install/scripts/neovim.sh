echo "Downloading neovim and xclip"
sudo pacman -S neovim xclip --noconfirm

echo "Downloading init.vim"
curl -fLo ~/.config/nvim/init.vim --create-dirs \
    https://raw.githubusercontent.com/camper0008/arch/stable/install/config/neovim-init.vim

echo "Downloading vim-plug"
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
