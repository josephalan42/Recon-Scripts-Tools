#!/bin/bash

# Check if the file exists
if [ -f "cut.txt" ]; then
  # Read domain names from the file and perform nslookup
  while IFS= read -r domain; do
    echo "Performing nslookup for \"$domain\":"
    nslookup "$domain"
    echo "--------------------------------------"
  done < "cut.txt"
else
  echo "Error: File cut.txt not found."
fi
