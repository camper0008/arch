echo "Configuring neovim"
sudo pacman -S neovim --noconfirm
mkdir -p ~/.config/nvim/ && cd ~/.config/nvim
curl -fLo ~/.config/nvim/init.vim --create-dirs \
    https://raw.githubusercontent.com/camper0008/arch/stable/install/config/.neovim-init.vim

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim