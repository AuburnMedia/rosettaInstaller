#!/bin/bash

print_rosetta_installer() {
    echo " ______                                    "
    sleep 0.1
    echo "(_____ \\                   _     _         "
    sleep 0.1
    echo " _____) )___   ___ _____ _| |_ _| |_ _____ "
    sleep 0.1
    echo "|  __  // _ \\ /___) ___ (_   _|_   _|____ |"
    sleep 0.1
    echo "| |  \\ \\ |_| |___ | ____| | |_  | |_/ ___ |"
    sleep 0.1
    echo "|_|   |_|\\___/(___/|_____)  \\__)  \\__)_____|"
    sleep 0.1
    echo "                                           "
    sleep 0.1
    echo " _                        _ _                "
    sleep 0.1
    echo "| |             _        | | |               "
    sleep 0.1
    echo "| |____   ___ _| |_ _____| | | _____  ____  "
    sleep 0.1
    echo "| |  _ \\ /___|_   _|____ | | || ___ |/ ___) "
    sleep 0.1
    echo "| | | | |___ | | |_/ ___ | | || ____| |     "
    sleep 0.1
    echo "|_|_| |_(___/   \\__)_____|\_)_)_____)_|     "
    sleep 0.1
}

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

read_with_prompt() {
    local prompt="$1"
    local input
    printf "%s" "$prompt"
    read -n1 input
    printf "%s" "$input"
}

print_rosetta_installer
echo "Designed for MacOS"
sleep 2

echo "1.) Install"
echo "2.) Info"
echo "3.) Uninstall"
echo "4.) Clone dir"
echo "5.) Cancel"

# Read the choice and discard the newline character
choice=$(read_with_prompt "Enter your choice (1-5): ")
read -n 1

echo "Your choice: $choice"

case $choice in
    1)
        echo "Installing..."
        [ ! -x "./installchoice.sh" ] && chmod +x ./installchoice.sh
        ./installchoice.sh
        ;;
    2)
        echo "Displaying information..."
        open https://support.apple.com/en-au/HT211861
        ;;
    3)
        echo "Uninstalling..."
        exit 0
        ;;
    4)
        echo "Cloning directory..."
        if command_exists git; then
            git clone https://github.com/MetalKit/metal
        else
            echo "Git is not installed. Please install Git and run the script again."
        fi
        ;;
    5)
        echo "Canceling..."
        exit 0
        ;;
    *)
        echo "Invalid choice. Please enter a number between 1 and 5."
        ;;
esac
