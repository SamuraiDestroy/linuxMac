# linuxMac
A script to setup a bootable linux partition on Macbooks.

## Installing and Running
Installing the script is as easy as possible, just click on the latest release on the right side of your screen and click on the first file to download it.

Once the file is downloaded, double click on it. This will install Fedora onto your mac.

In case you want to install something other than fedora, you may enter the terminal and enter your preferred OS. Currently, the only implemented OS is Fedora, so you need not worry.

If the program asks for your password, enter your user password (the one you use to enter your computer).

It's recommended to not download the zsh file direct from the repo as it will likely be an unstable development version.

## What does this script do?
This script installs linux onto your mac, with a single click (and some typing in your password). It is not a virus (please trust us here).

## Supported Linux distros
### Intel
Currently none. Likely won't be added for a while.
### Apple Silicon
Please note that the script currently does not work on M4 CPUs.

- Fedora

More distros to be fully implemented in the future.


## TODO list
- Add more distros
- Linux partition size customisation (This is only necessary for the Intel distros since Asahi already lets you customise it.)
- Auto install useful packages? (Research if we can do this or not)
- A little more output stuff so people know what's going on
- Github wiki???? I think it would be good for helping people with what to do after installing Linux
- Turn the script into a package??? This would probably give us better output control but it'd be harder for people who are afraid of terminals to use. (Almost done I think)
- Github pages website to make it easier for people to understand??
- Expand to other platforms (This will also require renaming, I suggest LPM)
