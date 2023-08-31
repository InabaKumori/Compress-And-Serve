# CompressAndServe

## Description
A handy Bash script that automates the task of compressing files or directories and serving them over a simple HTTP server. This makes it easy to share files and directories with others by providing a single download link.

## Features
- Automatically compresses a file or an entire directory into a `.tar.gz` archive.
- Serves the compressed file using Python's built-in HTTP server.
- Provides a direct download link.

## Prerequisites
- Bash
- `curl`
- Python 3.x

## Installation

1. Clone this repository or download the `compress_and_serve.sh` file.
    ```bash
    git clone https://github.com/YourUsername/CompressAndServe.git
    ```

2. Navigate to the downloaded folder and make the script executable.
    ```bash
    cd CompressAndServe
    chmod +x compress_and_serve.sh
    ```

## Usage

Run the script by specifying the file or directory you wish to compress and serve.
```bash
./compress_and_serve.sh target
