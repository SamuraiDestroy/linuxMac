case "$USER:l" in
    *"djafar"*)
    echo "Hi Djafar" ;;*)
esac
# Hi Djafar.


bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Just install brew bro trust

brew install curl git
# Use brew to install necessary packages

cpuHardware=$(sysctl -n machdep.cpu.brand_string)
# Finds your CPU vendor

case ${cpuHardware,,} in
    *"apple"*)
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
        echo "The default user for this is root"
        curl https://arvanta.net/asahi/aai.sh | sh ;;
    *)
        echo "The distro you have selected currently does not support Apple Silicon (or you misspelled it) and there are currently no plans to implement it." ;;
    esac
esac