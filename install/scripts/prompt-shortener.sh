sudo pacman -S rustup
mkdir ~/temp
cd ~/temp
git clone https://github.com/camper0008/prompt-shortener-rust
cd prompt-shortener-rust
cargo build --release
sudo mv $(find target/ -name "prompt-shortener") /usr/local/bin
