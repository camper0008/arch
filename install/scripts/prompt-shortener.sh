mkdir ~/temp
cd ~/temp
git clone https://github.com/camper0008/prompt-shortener
cd prompt-shortener
sudo pacman -S rustup --noconfirm
rustup toolchain install stable
cargo build --release
sudo mv $(find target/ -name "prompt-shortener") /usr/local/bin
