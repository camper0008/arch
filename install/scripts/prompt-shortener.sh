mkdir ~/temp
cd ~/temp
git clone https://github.com/camper0008/prompt-shortener
cd prompt-shortener
sudo pacman -S rustup
old_toolchain = $(rustup default)
rustup toolchain default
cargo build --release
sudo mv $(find target/ -name "prompt-shortener") /usr/local/bin
echo "note: rustup toolchain is now set to default, was $old_toolchain"
