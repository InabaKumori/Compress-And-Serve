#!/bin/bash

# Function to get the public IP address
get_public_ip() {
    PUBLIC_IP=$(curl -s http://ipinfo.io/ip)
    echo "$PUBLIC_IP"
}

# Default to compressing the current directory
if [ -z "$1" ]; then
    TARGET="current_directory"
    tar --exclude="$TARGET.tar.gz" -czf "$TARGET.tar.gz" .
    COMPRESSED_TARGET="$TARGET.tar.gz"
else
    # Determine whether it's a file or directory and compress accordingly
    TARGET="$1"
    if [ -f "$TARGET" ]; then
        tar -czf "$TARGET.tar.gz" "$TARGET"
        COMPRESSED_TARGET="$TARGET.tar.gz"
    elif [ -d "$TARGET" ]; then
        tar -czf "$TARGET.tar.gz" -C "$TARGET" .
        COMPRESSED_TARGET="$TARGET.tar.gz"
    else
        echo "The target is neither a file nor a directory. Exiting."
        exit 1
    fi
fi

# Check if the compressed target is created and not empty
if [ ! -f "$COMPRESSED_TARGET" ] || [ ! -s "$COMPRESSED_TARGET" ]; then
    echo "Failed to compress the target. Exiting."
    exit 1
fi

# Get public IP address
PUBLIC_IP=$(get_public_ip)

# Display the link
echo "Your target will be available at http://$PUBLIC_IP:3000/$COMPRESSED_TARGET"

# Start a simple HTTP server on port 3000
python3 -m http.server 3000
