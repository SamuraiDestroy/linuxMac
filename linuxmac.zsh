command -v brew >/dev/null 2>&1 || {
    echo >&2 "Brew is not installed. Installing..."
    zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

brew install curl sudo git

if [ "$1" == "fedora" ] || [ "$1" == "" ]; then
    echo "Installing fedora..."
    curl https://leifliddy.com/fedora.sh
    git clone https://github.com/leifliddy/asahi-fedora-builder.git
    cd asahi-fedora-builder
    sudo zsh build.sh
    cd ..
    sudo zsh fedora.sh
fi
