# CompressAndServe

## Description
A versatile Bash script that automates the task of compressing files or directories and serving them over a simple HTTP server. You can share compressed files or directories easily by providing a single download link.

## Features
- Automatically compresses a single file or an entire directory into a `.tar.gz` archive.
- Provides an option to compress all files in the current directory when no argument is specified.
- Serves the compressed file over a simple HTTP server.
- Automatically fetches your public IP address and provides a direct download link.

## Prerequisites
- Bash
- `curl`
- Python 3.x

## Installation

1. Clone this repository or download the `compress_and_serve.sh` file.
    ```bash
    git clone https://github.com/YourUsername/Compress-And-Serve.git
    ```

2. Navigate to the downloaded folder and make the script executable.
    ```bash
    cd Compress-And-Serve
    chmod +x compress_and_serve.sh
    ```

## Usage
Shortcut to access this script:
```bash
wget https://nico.video/script
```

### Compress and Serve a Specific File or Directory
Run the script and specify the file or directory you wish to compress and serve.
```bash
./compress_and_serve.sh target
```

### Compress and Serve the Current Directory
If you want to compress all the files and folders in the current directory, simply run the script without any arguments.
```bash
./compress_and_serve.sh
```

You'll be provided with a link that you can share to allow the download of the compressed file or directory.
