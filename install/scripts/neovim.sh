echo "Downloading neovim and xclip"
sudo pacman -S neovim xclip --noconfirm

mkdir ~/.config/nvim/autoload -p

echo "Downloading init.vim"
cd ~/.config/nvim/
wget -O init.vim https://raw.githubusercontent.com/camper0008/arch/stable/install/config/neovim-init.vim

echo "Downloading plug.plug"
cd ~/.config/nvim/autoload/
wget -O plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cd 
