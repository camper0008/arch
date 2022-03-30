sudo pacman -S rustup
mkdir ~/temp
cd ~/temp
git clone https://github.com/camper0008/prompt-shortener
cd prompt-shortener
cargo build --release
sudo mv $(find target/ -name "prompt-shortener") /usr/local/bin
