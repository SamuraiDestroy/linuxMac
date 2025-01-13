command -v brew >/dev/null 2>&1 || {
    echo >&2 "Brew is not installed. Installing..."
    zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}
# Check if brew is installed, if it isn't, install it.

brew install curl git
# Use brew to install necessary packages

cpuHardware=$(sysctl -a | grep machdep.cpu.vendor)
# Finds your CPU vendor

case ("$cpuHardware:l" in
    *"apple"*)
    # Intel Distros
    echo "This script currently does not support Intel CPUs, please wait for a future release." ;;*)
    # Apple Silicon Distros
    if [ "$1:l" = "fedora" ] || [ "$1" = "" ]; then # Check if the first parameter is either fedora or left blank
        echo "Installing fedora..."
        curl https://leifliddy.com/fedora.sh
        git clone https://github.com/leifliddy/asahi-fedora-builder.git
        # Fetches necessary files for installation of Fedora
        cd asahi-fedora-builder # Go to the downloaded files
        sudo zsh build.sh
        cd ..
        sudo zsh fedora.sh
        # Executes the files
        # Below this is the switch statement for all distros that can be run on Apple Silicon CPUs, even though they are unimplemented.
    elif [ "$1:l" = "arch" ]; then
        echo "Arch is currently not implemented, wait for a future release." 
    elif [ "$1:l" = "aosc" ]; then
        echo "AOSC is currently not implemented, wait for a future release." 
    elif [ "$1:l" = "centos" ]; then
        echo "CentOS is currently not implemented, wait for a future release." 
    elif [ "$1:l" = "debian" ]; then
        echo "Debian is currently not implemented, wait for a future release." 
    elif [ "$1:l" = "deepin" ]; then
        echo "Deepin is currently not implemented, wait for a future release." 
    elif [ "$1:l" = "fedora" ]; then
        echo "Fedora is currently not implemented, wait for a future release." 
    elif [ "$1:l" = "gentoo" ]; then
        echo "Gentoo is currently not implemented, wait for a future release." 
    elif [ "$1:l" = "nixos" ]; then
        echo "NoxOS is currently not implemented, wait for a future release." 
    elif [ "$1:l" = "rocky linux" ]; then
        echo "Rocky Linux is currently not implemented, wait for a future release." 
    elif [ "$1:l" = "ubuntu" ]; then
        echo "Ubuntu is currently not implemented, wait for a future release. Also, fuck you." 
    elif [ "$1:l" = "void linux" ]; then
        echo "Void Linux is currently not implemented, wait for a future release." 
    else
        echo "The distro you have selected currently does not support Apple Silicon (or you have misspelled the name) and there are currently no plans to implement it." 
    fi ;;
esac


# sysctl -a | grep machdep.cpu.vendor should find out if the cpu is intel or apple (DO NOT GET RID OF THIS COMMENT UNTIL WE HAVE DETECTION WORKING)
