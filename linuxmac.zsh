zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install curl
if [ "$(whoami)" != 'root' ]; then
    echo "Run this script like this:"
    echo "sudo zsh linuxmac.zsh [OS: fedora or fedora or fedora]"
    exit
fi

if [ "$1" == "fedora" ]; then
    echo "fedora"
    curl https://leifliddy.com/fedora.sh
    git clone https://github.com/leifliddy/asahi-fedora-builder.git
    cd asahi-fedora-builder
    zsh build.sh
    cd ..
    zsh fedora.sh
fi
