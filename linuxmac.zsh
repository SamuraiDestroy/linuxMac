if [ "$USER:l" = *djafar*]; then
    echo "Hi Djafar"
fi
# Hi Djafar.


bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Just install brew bro trust

brew install curl git
# Use brew to install necessary packages

cpuHardware=$(sysctl -a | grep machdep.cpu.vendor)
# Finds your CPU vendor

case "$cpuHardware:l" in
    *"apple"*)
    # Intel Distros
    echo "This script currently does not support Intel CPUs, please wait for a future release." ;;*)
    # Apple Silicon Distros
    if [ "$1:l" = "fedora" ] || [ "$1" = "" ]; then # Check if the first parameter is either fedora or left blank
	echo "Installing fedora..."
    curl https://alx.sh | sh
	# Below this is the switch statement for all distros that can be run on Apple Silicon CPUs, even though they are unimplemented.
    elif [ "$1:l" = "alpinelinux" ]; then
        #echo "Alpine Linux is currently not implemented, wait for a future release"
        curl https://arvanta.net/asahi/aai.sh | sh
    elif [ "$1:l" = "arch" ]; then
        #echo "Arch is currently not implemented, wait for a future release." 
        echo "This one requires stupid config stuff go to https://github.com/asahi-alarm/asahi-alarm/blob/main/manual-install.md and read about it after the installer is done. (Just click the link and it should take you right there.)"
        curl -SL https://github.com/asahi-alarm/asahi-alarm/releases/download/installer/installer-bootstrap.sh | sh
    elif [ "$1:l" = "aosc" ]; then
        #echo "AOSC is currently not implemented, wait for a future release." 
        curl -sSf https://repo.aosc.io/get-oma.sh | sudo sh
    elif [ "$1:l" = "centos" ]; then
        #echo "CentOS is currently not implemented, wait for a future release." 
        echo "Root password for this is centosstream"
        curl https://ecurtin.fedorapeople.org/centos.sh | sh
    elif [ "$1:l" = "debian" ]; then
        # The Debian installer needs to be tested outside of this script because the documentation for it might just be wrong.
        echo "Debian is currently not implemented, wait for a future release." 
    elif [ "$1:l" = "deepin" ]; then
        # More research is necessary for this one since it's in a different language
        echo "Deepin is currently not implemented, wait for a future release."  
    elif [ "$1:l" = "gentoo" ]; then
        # After reading the guide, AAAAAAAAAAAAAA
        echo "Gentoo is currently not implemented, wait for a future release." 
    elif [ "$1:l" = "nixos" ]; then
        # Later.
        echo "NixOS is currently not implemented, wait for a future release." 
    elif [ "$1:l" = "rockylinux" ]; then
        #echo "Rocky Linux is currently not implemented, wait for a future release." 
        echo "Root password for this is rocky"
        curl https://leifliddy.com/rocky.sh | sh
    elif [ "$1:l" = "ubuntu" ]; then
        #echo "Ubuntu is currently not implemented, wait for a future release." 
        curl -sL https://ubuntuasahi.org/install | sh
    elif [ "$1:l" = "voidlinux" ]; then
        #echo "Void Linux is currently not implemented, wait for a future release."
        echo "Root password for this is voidlinux"
        curl -L https://tinyurl.com/void-asahi | sh 
    else
        echo "The distro you have selected currently does not support Apple Silicon (or you misspelled it) and there are currently no plans to implement it." 
    fi
esac


# sysctl -a | grep machdep.cpu.vendor should find out if the cpu is intel or apple (DO NOT GET RID OF THIS COMMENT UNTIL WE DEFINITELY HAVE DETECTION WORKING FOR BOTH CPU TYPES)
# Apparently sudo -s works on mac?

# Old code for Fedora Builder
       # curl https://leifliddy.com/fedora.sh
       # git clone https://github.com/leifliddy/asahi-fedora-builder.git
       # Fetches necessary files for installation of Fedora
       # cd asahi-fedora-builder # Go to the downloaded files
       # sudo zsh build.sh
       # cd ..
       # sudo zsh fedora.sh
       # Executes the files