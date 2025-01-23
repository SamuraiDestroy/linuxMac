#include <string>

#define RESET "\033[0m"

// Enum for colors
enum class Color {
    Black,
    Red,
    Green,
    Yellow,
    Blue,
    Magenta,
    Cyan,
    White,
    BrightBlack,
    BrightRed,
    BrightGreen,
    BrightYellow,
    BrightBlue,
    BrightMagenta,
    BrightCyan,
    BrightWhite,
    Reset,
};

enum class Prop {
    Bold,
    Italic,
    Underline,
    Strikethrough,
    Dim,
};

std::string getAnsiCode(Prop prop) {
    switch (prop) {
        case Prop::Bold:            return "\033[1m";
        case Prop::Dim:             return "\033[2m";
        case Prop::Italic:          return "\033[3m";
        case Prop::Underline:       return "\033[4m";
        case Prop::Strikethrough:   return "\033[9m";
    }
}

// Function to get the ANSI escape code for each color
std::string getAnsiCode(Color color) {
    switch (color) {
        case Color::Black:         return "\033[30m"; // Black
        case Color::Red:           return "\033[31m"; // Red
        case Color::Green:         return "\033[32m"; // Green
        case Color::Yellow:        return "\033[33m"; // Yellow
        case Color::Blue:          return "\033[34m"; // Blue
        case Color::Magenta:       return "\033[35m"; // Magenta
        case Color::Cyan:          return "\033[36m"; // Cyan
        case Color::White:         return "\033[37m"; // White
        case Color::BrightBlack:   return "\033[90m"; // Bright Black (Gray)
        case Color::BrightRed:     return "\033[91m"; // Bright Red
        case Color::BrightGreen:   return "\033[92m"; // Bright Green
        case Color::BrightYellow:  return "\033[93m"; // Bright Yellow
        case Color::BrightBlue:    return "\033[94m"; // Bright Blue
        case Color::BrightMagenta: return "\033[95m"; // Bright Magenta
        case Color::BrightCyan:    return "\033[96m"; // Bright Cyan
        case Color::BrightWhite:   return "\033[97m"; // Bright White
        default:                   return "\033[0m";  // Reset
    }
}

class ColoredStr {
    public:
        ColoredStr (std::string raw_str) {
            this->str = raw_str;
        }

        void operator+=(Prop prop) {
            this->str = getAnsiCode(prop) + this->str;
        }

        // std::string operator+=(Prop props[]) {
        //     std::string res;

        //     for (int i = 0; i < sizeof(props) / sizeof(props[0]); i++) {
        //         res += getAnsiCode(props[i]);
        //     }

        //     return res + this->str;
        // }

        std::string color_as_string(Color color) {
            return getAnsiCode(color) + str + RESET;
        }

    private: 
        std::string str;
        bool bold;
};

void info (std::string out) {
    ColoredStr tag("[   info   ]\t");
    tag += Prop::Bold;

    std::cout << tag.color_as_string(Color::Blue) << " " << out << std::endl;
}

void success (std::string out) {
    ColoredStr tag("[   good   ]\t");
    tag += Prop::Bold;

    std::cout << tag.color_as_string(Color::Green) << " " << out << std::endl;
}

void warn (std::string out) {
    ColoredStr tag("[   warn   ]\t");
    tag += Prop::Bold;

    std::cout << tag.color_as_string(Color::Yellow) << " " << out << std::endl;
}

void fail (std::string out) {
    ColoredStr tag("[   fail   ]\t");
    tag += Prop::Bold;

    std::cout << tag.color_as_string(Color::Red) << " " << out << std::endl;
}