#include <iostream>
#include <string>
#include <stdlib.h>
#include "utils/Output.h"
#include "utils/Distro.h"

#ifdef __arm__
    #define PLATFORM "arm"
#else
    #define PLATFORM "x86"
#endif           

int main(int argc, char *argv[]) {
    info("initializing the " + std::string(PLATFORM) + " build of ldm");
    info("checking if brew is installed");

    // check if brew is installed
    int is_brew_installed = system("command -v brew > /dev/null 2>&1");

    if (is_brew_installed != 0) { // command failed
        info("installing brew...");
        int brew_install_status = system("bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\"");
        int brew_install_status = 0; // for testing without installing stuff
        if (brew_install_status) {
            fail("brew install failure, please open an issue on github for more help");
            return 1;
        }
        success("brew install success");
    } else  info("brew has already been installed");

    std::cout << std::endl;

    // check for this syntax: ____ install _____
    if (argc > 2 && strcmp(argv[1], "install") == 0) {

        // find package name
        ColoredStr pkg (argv[2]);
        pkg += Prop::Bold;

        info("installing package " + pkg.color_as_string(Color::BrightMagenta) + "...");

        bool distro_is_impl = true;
        std::string install_script;
        std::string extra_info;

        switch (stringToDistro(argv[2])) {
            // switch distro
             case Distro::FEDORA: 
                install_script = "curl https://alx.sh | sh";
                break;
            case Distro::ALPINELINUX:
                install_script = "curl https://arvanta.net/asahi/aai.sh | sh";
                break;
            case Distro::ARCH: 
                extra_info += "This requires additional configuration. Visit: https://github.com/asahi-alarm/asahi-alarm/blob/main/manual-install.md for more details.\n";
                install_script = "curl -SL https://github.com/asahi-alarm/asahi-alarm/releases/download/installer/installer-bootstrap.sh | sh";
                break;
            case Distro::AOSC: 
                install_script = "curl -sSf https://repo.aosc.io/get-oma.sh | sudo sh";
                break;
            case Distro::CENTOS:
                extra_info += "Root password for this is centosstream.\n";
                install_script = "curl https://ecurtin.fedorapeople.org/centos.sh | sh";
                break;
            case Distro::DEBIAN:
                distro_is_impl = false;
                break;
            case Distro::DEEPIN: 
                install_script = "curl https://ci.deepin.com/repo/deepin/deepin-ports/deepin-m1/deepin.install | sh";
                break;
            case Distro::GENTOO: 
                distro_is_impl = false;
                break;
            case Distro::NIXOS: 
                distro_is_impl = false;
                break;
            case Distro::ROCKYLINUX: 
                extra_info += "Root password for this is rocky.\n";
                install_script = "curl https://leifliddy.com/rocky.sh | sh";
                break;
            case Distro::UBUNTU:
                install_script = "curl -sL https://ubuntuasahi.org/install | sh";
                break;
            case Distro::VOIDLINUX:
                extra_info += "Root password for this is voidlinux.\n";
                install_script = "curl -L https://tinyurl.com/void-asahi | sh";
                break;
            case Distro::UNKNOWN:
                {
                    pkg += Prop::Dim;
                    pkg += Prop::Underline;
                    fail("package " + pkg.color_as_string(Color::BrightMagenta) + " was not found, and is not planned for future releases. for more help, please open an issue on our github page");
                }
        }

        ColoredStr fmtDistro(distroToString(stringToDistro(argv[2])));
        
        if (!distro_is_impl) {
            fmtDistro += Prop::Dim;
            fmtDistro += Prop::Underline;
            warn(fmtDistro.color_as_string(Color::BrightMagenta) + " is currently not implemented, wait for a future release");
        }
        if (install_script.size() > 0) {
            success("package found successfully, installing...");
            info("running install script");

            int ret = system(install_script.c_str()); 
            int ret = 0; // for temp testing w/o install script

            if (!ret) { // if ret == 0, success
                fmtDistro += Prop::Bold;
                success("ran install successfully");
                success("distro " + fmtDistro.color_as_string(Color::BrightMagenta) + " installed");
                if (extra_info.size() > 0)  info(extra_info);
            } else {
                ColoredStr errorCode(std::to_string(ret));
                fail("failed to execute install script with error code of " + errorCode.color_as_string(Color::BrightCyan));
            }
        }
    }
}