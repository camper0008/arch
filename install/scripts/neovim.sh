echo "Downloading neovim and xclip"
sudo pacman -S neovim xclip --noconfirm

mkdir ~/.config/nvim/autoload -p

echo "Downloading init.vim"
wget -O init.vim -P ~/.config/nvim/ https://raw.githubusercontent.com/camper0008/arch/stable/install/config/neovim-init.vim

echo "Downloading plug.plug"
wget -O plug.vim -P ~/.config/nvim/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
