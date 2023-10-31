#!/bin/bash

print_line_by_line() {
    local text="$1"
    local length=${#text}

    for ((i=0; i<length; i++)); do
        /bin/echo -n "${text:$i:1}"
        sleep 0.001 
    done
    echo
}

trap ctrl_c INT

ctrl_c() {
    echo
    echo "Interrupted. Exiting..."
    exit 1
}

print_rosetta_installer() {
    print_line_by_line " ______                                    "
    print_line_by_line "(_____ \\                   _     _         "
    print_line_by_line " _____) )___   ___ _____ _| |_ _| |_ _____ "
    print_line_by_line "|  __  // _ \\ /___) ___ (_   _|_   _|____ |"
    print_line_by_line "| |  \\ \\ |_| |___ | ____| | |_  | |_/ ___ |"
    print_line_by_line "|_|   |_|\\___/(___/|_____)  \\__)  \\__)_____|"
    print_line_by_line "                                           "
    print_line_by_line " _                        _ _                "
    print_line_by_line "| |             _        | | |               "
    print_line_by_line "| |____   ___ _| |_ _____| | | _____  ____  "
    print_line_by_line "| |  _ \\ /___|_   _|____ | | || ___ |/ ___) "
    print_line_by_line "| | | | |___ | | |_/ ___ | | || ____| |     "
    print_line_by_line "|_|_| |_(___/   \\__)_____|\_)_)_____)_|     "
}

read_with_prompt() {
    local prompt="$1"
    local input

    read -p "$prompt" -n 1 input < /dev/tty
    echo "$input"
}



print_rosetta_installer
echo "Designed for MacOS"
sleep 2

echo "1.) Install"
echo "2.) Info"
echo "3.) Uninstall"
echo "4.) Clone dir"
echo "5.) Cancel"

choice=$(read_with_prompt "Enter your choice (1-5): ")

case $choice in
    1)
        echo "Installing..."
        [ ! -x "./installchoice.sh" ] && chmod +x ./bin/installer.sh
        ./bin/installer.sh
        ;;
    2)
        echo "Displaying information..."
        open https://support.apple.com/en-au/HT211861
        ;;
    3)
        printf "\n\n"
        echo "Uninstalling..."
        exit 0
        ;;
    4)
        echo "Cloning directory..."
        if command -v git &>/dev/null; then
            git clone https://github.com/AuburnMedia/rosettaInstaller
        else
            echo "Git is not installed. Please install Git and run the script again."
        fi
        ;;
    5)
        printf "\n\n"
        echo "Canceling..."
        exit 0
        ;;
    *)
        echo "Invalid choice. Please enter a number between 1 and 5."
        ;;
esac
