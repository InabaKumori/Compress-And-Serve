#!/bin/bash

# Function to get the public IP address
get_public_ip() {
    PUBLIC_IP=$(curl -s http://ipinfo.io/ip)
    echo "$PUBLIC_IP"
}

# Default to serving the current directory
if [ -z "$1" ]; then
    TARGET="."
    SERVE_TARGET="$TARGET"
else
    # Determine whether it's a file or directory
    TARGET="$1"
    if [ -f "$TARGET" ]; then
        # If it's a single file, there's no need to compress
        SERVE_TARGET="$TARGET"
    elif [ -d "$TARGET" ]; then
        # If it's a directory, compress it
        tar -czf "$TARGET.tar.gz" -C "$TARGET" .
        SERVE_TARGET="$TARGET.tar.gz"
    else
        echo "The target is neither a file nor a directory. Exiting."
        exit 1
    fi
fi

# Get public IP address
PUBLIC_IP=$(get_public_ip)

# Display the link
echo "Your target will be available at http://$PUBLIC_IP:3000/$SERVE_TARGET"

# Start a simple HTTP server on port 3000
python3 -m http.server 3000
