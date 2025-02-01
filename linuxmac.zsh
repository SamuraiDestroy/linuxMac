case "$USER:l" in
    *"djafar"*)
    echo "Hi Djafar"
    sleep 0.5 ;;*)
esac
# Hi Djafar.

devmode=false

if [ "$1" = "e" ]; then
    devmode=true
fi
#You didn't see this.

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Just installs/updates brew bro trust

brew install curl git
# Use brew to install necessary packages

cpuHardware=$(sysctl -n machdep.cpu.brand_string | tr '[:upper:]' '[:lower:]')
# Finds your CPU vendor

echo "In the unlikely case of corruption and/or data loss, the developers of this script are not responsible.\nIt is recommended to make backups before running this script."
sleep 2

case $cpuHardware in
    *"intel"*)
    # Intel Distros
    echo "This script currently does not support Intel CPUs, please wait for a future release."
    if [ $devmode = true ]; then # Executes if dev mode is on since this is probably not very safe to test
        diskutil list
        # Show all the disks and info
        echo "Choose a disk to to install Linux on (Type the identifier next to it and press enter): "
        read disk
        # Get the disk to use from user input
        echo "How much space should be allocated to Linux (in GB): "
        read size
        # Get disk space to use from user input
        diskutil info /dev/$disk
        # Test to see if we can actually use the user input
    fi ;;*)
    # Apple Silicon Distros
    echo "Please type in the name of the distro from the list you want to install and then press enter [fedora, alpinelinux, arch, aosc, centos, debian, deepin, gentoo, nixos, rockylinux, ubuntu, voidlinux]: "
    read distro # Get user input of what distro they want to use
    distro=$(echo "$distro" | tr '[:upper:]' '[:lower:]')
    case $distro in 
    "fedora") 
    # Check if the user input is fedora
	    echo "Installing fedora..."
        curl https://alx.sh | sh 
        echo "Fedora has now been fully configured." ;;
	# More distro checking below this haha
    "alpinelinux"*)
        echo "The default user for this is root"
        sleep 1.5
        curl https://arvanta.net/asahi/aai.sh | sh ;;
    "arch"*)
        #echo "Arch is currently not implemented, wait for a future release." 
        echo "This one requires stupid config stuff go to https://github.com/asahi-alarm/asahi-alarm/blob/main/manual-install.md and read about it after the installer is done. (Just click the link and it should take you right there.)"
        sleep 2
        curl -SL https://github.com/asahi-alarm/asahi-alarm/releases/download/installer/installer-bootstrap.sh | sh ;;
    "aosc"*)
        #echo "AOSC is currently not implemented, wait for a future release." 
        curl -sSf https://repo.aosc.io/get-oma.sh | sudo sh ;;
    "centos"*)
        #echo "CentOS is currently not implemented, wait for a future release." 
        echo "Root password for this is centosstream"
        sleep 1.5
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
        echo "Gentoo is currently not implemented, wait for a future release." 
        if [ $devmode = true ]; then
            echo "You need a USB stick plugged in for this one"
            sleep 1.5
        fi ;;
    "nixos"*)
        # Later.
        echo "NixOS is currently not implemented, wait for a future release." 
        if [ $devmode = true ]; then
            echo "You need a USB stick plugged in for this one"
            sleep 1.5
            git clone https://github.com/tpwrules/nixos-apple-silicon/
            cd nixos-apple-silicon
            nix build --extra-experimental-features 'nix-command flakes' .#m1n1 -o m1n1
            nix build --extra-experimental-features 'nix-command flakes' .#uboot-asahi -o u-boot
            nix build --extra-experimental-features 'nix-command flakes' .#installer-bootstrap -o installer -j4 -L
            curl https://alx.sh | sh
            # From here it gets pretty complicated and I'll do it later
        fi;;
    "rockylinux"*)
        #echo "Rocky Linux is currently not implemented, wait for a future release." 
        echo "Root password for this is rocky" 
        sleep 1.5
        curl https://leifliddy.com/rocky.sh | sh ;;
    "ubuntu"*)
        #echo "Ubuntu is currently not implemented, wait for a future release." 
        curl -sL https://ubuntuasahi.org/install | sh ;;
    "voidlinux"*)
        #echo "Void Linux is currently not implemented, wait for a future release."
        echo "Root password for this is voidlinux"
        sleep 1.5
        curl -L https://tinyurl.com/void-asahi | sh ;;
    *)
        echo "The distro you have selected currently does not support Apple Silicon (or you misspelled it) and there are currently no plans to implement it." ;;
    esac
esac