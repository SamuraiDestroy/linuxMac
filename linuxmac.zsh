case "$USER:l" in
    *"djafar"*)
    echo "Hi Djafar" ;;*)
esac
# Hi Djafar.


bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Just installs/updates brew bro trust

brew install curl git
# Use brew to install necessary packages

cpuHardware=$(sysctl -a | grep machdep.cpu.vendor)
# Finds your CPU vendor
# THIS DOES NOT WORK

case ${cpuHardware,,} in
    *"intel"*)
    # Intel Distros
    echo "This script currently does not support Intel CPUs, please wait for a future release." ;;*) 
    # Apple Silicon Distros
    echo "Please type in the name of the distro from the list you want to install and then press enter [fedora, alpinelinux, arch, aosc, centos, debian, deepin, gentoo, nixos, rockylinux, ubuntu, voidlinux]: "
    read distro # Get user input of what distro they want to use
    case ${distro,,} in 
    "fedora") 
    # Check if the first parameter is fedora
	echo "Installing fedora..."
    curl https://alx.sh | sh 
    echo "Fedora has now been fully configured." ;;
	# More distro checking haha
    "alpinelinux"*)
        #echo "Alpine Linux is currently not implemented, wait for a future release"
        curl https://arvanta.net/asahi/aai.sh | sh ;;
    "arch"*)
        #echo "Arch is currently not implemented, wait for a future release." 
        echo "This one requires stupid config stuff go to https://github.com/asahi-alarm/asahi-alarm/blob/main/manual-install.md and read about it after the installer is done. (Just click the link and it should take you right there.)"
        curl -SL https://github.com/asahi-alarm/asahi-alarm/releases/download/installer/installer-bootstrap.sh | sh ;;
    "aosc"*)
        #echo "AOSC is currently not implemented, wait for a future release." 
        curl -sSf https://repo.aosc.io/get-oma.sh | sudo sh ;;
    "centos"*)
        #echo "CentOS is currently not implemented, wait for a future release." 
        echo "Root password for this is centosstream"
        curl https://ecurtin.fedorapeople.org/centos.sh | sh ;;
    "debian"*)
        # The Debian installer needs to be tested outside of this script because the documentation for it might just be wrong.
        echo "Debian is currently not implemented, wait for a future release." ;;
    "deepin"*)
        #echo "Deepin is currently not implemented, wait for a future release." 
        # More research is necessary for this one since it's in a different language
        curl https://ci.deepin.com/repo/deepin/deepin-ports/deepin-m1/deepin.install | sh;;
    "gentoo"*)
        # After reading the guide, AAAAAAAAAAAAAA
        echo "Gentoo is currently not implemented, wait for a future release." ;;
    "nixos"*)
        # Later.
        echo "NixOS is currently not implemented, wait for a future release." ;;
    "rockylinux"*)
        #echo "Rocky Linux is currently not implemented, wait for a future release." 
        echo "Root password for this is rocky" 
        curl https://leifliddy.com/rocky.sh | sh ;;
    "ubuntu"*)
        #echo "Ubuntu is currently not implemented, wait for a future release." 
        curl -sL https://ubuntuasahi.org/install | sh ;;
    "voidlinux"*)
        #echo "Void Linux is currently not implemented, wait for a future release."
        echo "Root password for this is voidlinux"
        curl -L https://tinyurl.com/void-asahi | sh ;;
    *)
        echo "The distro you have selected currently does not support Apple Silicon (or you misspelled it) and there are currently no plans to implement it." ;;
    esac
esac


# sysctl -a | grep machdep.cpu.vendor should find out if the cpu is intel or apple (DO NOT GET RID OF THIS COMMENT UNTIL WE DEFINITELY HAVE DETECTION WORKING FOR BOTH CPU TYPES)