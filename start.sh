#!/bin/bash

# Debugging - Show current directory and files
echo "🔥 Current Working Directory:"
pwd

echo "📂 Listing all files in current directory:"
ls -l

# Update package list and install missing dependencies
apt update && apt install -y wget unzip

# Upgrade pip
pip install --upgrade pip

# Check if requirements.txt exists
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
else
    echo "❌ ERROR: requirements.txt not found!"
    find / -name requirements.txt
    exit 1
fi

# Download and extract external ZIP file
wget -O gagantelethon.zip https://devgagan.in/wp-content/uploads/2023/12/gagantelethon.zip
unzip gagantelethon.zip

# Navigate to the extracted Telethon-1.24.0 folder
cd Telethon-1.24.0 || exit

# Install the package inside the extracted folder
pip install .

# Return to the main directory
cd ..

# Check if main.py exists
MAIN_PATH=$(find / -name main.py 2>/dev/null)

if [ -f "$MAIN_PATH" ]; then
    echo "✅ main.py found at: $MAIN_PATH"
    python3 "$MAIN_PATH" &
else
    echo "❌ ERROR: main.py not found!"
    exit 1
fi

# Keep instance alive
tail -f /dev/null
