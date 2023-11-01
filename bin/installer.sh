#!/bin/bash

homedir=$(eval echo "~/")
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


create_file() {
  local name=$1
  local size=$2
  local location=${3:-./}

  if [[ -z $name ]]; then
    echo "Error: Name parameter is required."
    return 1
  fi

  local file_path="${location}/${name}"

  # Ensure the parent directory exists
  create_folder "$location"  

  mkfile -n "${size}m" "$file_path"
}


create_folder() {
  local location="$1"
  local expanded_location

  
  expanded_location=$(eval echo "$location")

  if [[ -d "$expanded_location" ]]; then
    printf "\n"
  else
    mkdir -p "$expanded_location"
  fi
}

printf "\033[2J\033[H"
printf "\n\n\n"
print_rosetta_installer
sleep 2

/bin/echo -n "Are you sure you want to continue? (y/n) : "
read answer

create_folder "~/Library/Caches/rosettaInstaller"

printf "\n\n"
printf "Installing..."
sleep 1


for i in {1..50}; do
    clear
    draw_progress_bar $i
    sleep 0.1
    clear
    random_number=$(jot -r 1 1 3)
    random_string=$(openssl rand -base64 12)
    create_file "$random_string" "$random_number" "${homedir}/Library/Caches/rosettaInstaller"
    clear
done

echo "Waiting...."
printf "\n\n"  

sleep 7

echo "Complete. Restart your computer to complete the installation."