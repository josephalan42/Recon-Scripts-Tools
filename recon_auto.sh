#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <url>"
    exit 1
fi

url=$1

# Create output files
touch first.txt second.txt third.txt fourth.txt

# Perform the enumeration and processing
sudo amass enum -d "$url" > first.txt
cut -f1 -d' ' first.txt > second.txt
sort -u second.txt > third.txt
cat third.txt | httprobe -prefer-https > fourth.txt

# Capture screenshots
sudo gowitness file -f fourth.txt
