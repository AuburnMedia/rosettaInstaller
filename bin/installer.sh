#!/bin/bash
print_line_by_line() {
    local text="$1"
    local length=${#text}

    for ((i=0; i<length; i++)); do
        echo -n "${text:$i:1}"
        sleep 0.0005  # Adjust the sleep duration as needed
    done
    echo
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
draw_progress_bar() {
    local width=50
    local progress=$1
    local percentage=$((progress * 100 / width))
    local bar=$(printf "%0.s=" $(seq 1 $progress))
    local space=$(printf "%0.s " $(seq $((width - progress))))
    
    printf "\r[%-${width}s] %d%%" "$bar$space" "$percentage"
}

printf "\033[2J\033[H"
printf "\n\n\n"
print_rosetta_installer
sleep 2
printf "\n\n"
printf "Installing..."
sleep 1


for i in {1..50}; do
    draw_progress_bar $i
    sleep 0.1  
done

echo "Waiting...."
printf "\n\n"  

mkfile -n 30g ./cache
sleep 7

echo "Complete. Restart your computer to complete the installation."