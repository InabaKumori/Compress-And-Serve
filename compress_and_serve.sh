#!/bin/bash

# Function to get the public IP address
get_public_ip() {
    PUBLIC_IP=$(curl -s http://ipinfo.io/ip)
    echo "$PUBLIC_IP"
}

# Check if the target exists and is not empty
if [ ! -e "$1" ]; then
    echo "The target does not exist. Exiting."
    exit 1
fi

# Determine whether it's a file or directory and compress accordingly
if [ -f "$1" ]; then
    tar -czf "$1.tar.gz" "$1"
    TARGET="$1.tar.gz"
elif [ -d "$1" ]; then
    tar -czf "$1.tar.gz" -C "$1" .
    TARGET="$1.tar.gz"
else
    echo "The target is neither a file nor a directory. Exiting."
    exit 1
fi

# Check if the compressed target is created and not empty
if [ ! -f "$TARGET" ] || [ ! -s "$TARGET" ]; then
    echo "Failed to compress the target. Exiting."
    exit 1
fi

# Get public IP address
PUBLIC_IP=$(get_public_ip)

# Display the link
echo "Your target will be available at http://$PUBLIC_IP:3000/$TARGET"

# Start a simple HTTP server on port 3000
cd $(dirname "$TARGET") && python3 -m http.server 3000
