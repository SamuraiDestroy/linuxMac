command -v brew >/dev/null 2>&1 || {
    echo >&2 "Brew is not installed. Installing..."
    zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

brew install curl sudo
# Use brew to install necessary packages

cpuHardware = sysctl -a | grep machdep.cpu.vendor

if [[ $cpuHardware:l == *intel* ]]; then # This should return true if the CPU is Intel, needs testing though.
    # Intel Distros
    echo "This script currently does not support Intel CPUs, please wait for a future release."
else
    # Apple Silicon Distros
    if [ "$1" == "fedora" ] || [ "$1" == "" ]; then
        echo "Installing fedora..."
        curl https://leifliddy.com/fedora.sh
        git clone https://github.com/leifliddy/asahi-fedora-builder.git
        cd asahi-fedora-builder
        sudo zsh build.sh
        cd ..
        sudo zsh fedora.sh  
    fi
fi


# sysctl -a | grep machdep.cpu.vendor should find out if the cpu is intel or apple (DO NOT GET RID OF THIS COMMENT UNTIL WE HAVE DETECTION WORKING)