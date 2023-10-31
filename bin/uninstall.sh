#!/bin/bash

draw_progress_bar() {
    local width=50
    local progress=$1
    local percentage=$((progress * 100 / width))
    local bar=$(printf "%0.s=" $(seq 1 $progress))
    local space=$(printf "%0.s " $(seq $((width - progress))))
    
    printf "\r[%-${width}s] %d%%" "$bar$space" "$percentage"
}


printf "\033[2J\033[H"

printf "Uninstalling...\n\n"

sleep 3

printf "Working.."

sleep 1

for i in {1..50}; do
    draw_progress_bar $i
    sleep 0.1  
done

sleep 2

exit 0