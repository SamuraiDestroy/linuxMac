#include <string>
#include <algorithm>
#include <unordered_map>

enum class Distro {
    FEDORA,
    ALPINELINUX,
    ARCH,
    AOSC,
    CENTOS,
    DEBIAN,
    DEEPIN,
    GENTOO,
    NIXOS,
    ROCKYLINUX,
    UBUNTU,
    VOIDLINUX,
    UNKNOWN  // For unsupported or unrecognized distros
};

inline std::string toLower(const std::string& str) {
    std::string result = str;
    std::transform(result.begin(), result.end(), result.begin(), ::tolower);
    return result;
}

// Function to map string to enum
inline Distro stringToDistro(const std::string& input) {
    static const std::unordered_map<std::string, Distro> distroMap = {
        {"fedora", Distro::FEDORA},
        {"alpinelinux", Distro::ALPINELINUX},
        {"arch", Distro::ARCH},
        {"aosc", Distro::AOSC},
        {"centos", Distro::CENTOS},
        {"debian", Distro::DEBIAN},
        {"deepin", Distro::DEEPIN},
        {"gentoo", Distro::GENTOO},
        {"nixos", Distro::NIXOS},
        {"rockylinux", Distro::ROCKYLINUX},
        {"ubuntu", Distro::UBUNTU},
        {"voidlinux", Distro::VOIDLINUX}
    };

    auto it = distroMap.find(toLower(input));
    if (it != distroMap.end()) {
        return it->second;
    } else {
        return Distro::UNKNOWN;
    }
}

inline std::string distroToString(Distro distro) {
    switch (distro) {
        case Distro::FEDORA: return "Fedora";
        case Distro::ALPINELINUX: return "AlpineLinux";
        case Distro::ARCH: return "Arch";
        case Distro::AOSC: return "AOSC";
        case Distro::CENTOS: return "CentOS";
        case Distro::DEBIAN: return "Debian";
        case Distro::DEEPIN: return "Deepin";
        case Distro::GENTOO: return "Gentoo";
        case Distro::NIXOS: return "NixOS";
        case Distro::ROCKYLINUX: return "RockyLinux";
        case Distro::UBUNTU: return "Ubuntu";
        case Distro::VOIDLINUX: return "VoidLinux";
        default: return "Unknown";
    }
}