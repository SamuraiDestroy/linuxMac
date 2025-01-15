case "$USER:l" in
    *"djafar"*)
    echo "Hi Djafar" ;;*)
esac
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
    else
        echo "The distro you have selected currently has not been fully implemented into this script." 
    fi
esac