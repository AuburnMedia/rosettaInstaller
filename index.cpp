

#include <iostream>

int main() {
    std::string result;
    result = system("sh install.sh");
    if (result != "") {
        std::cout << "\n\nError, exiting... \n";
    }
}
