#!/bin/bash

# Install missing dependencies
apt update && apt install -y wget unzip

# Install Python dependencies
pip install --upgrade pip
pip install -r requirements.txt

# Download and install external ZIP file
wget -O gagantelethon.zip https://devgagan.in/wp-content/uploads/2023/12/gagantelethon.zip
unzip gagantelethon.zip
cd gagantelethon || exit
pip install .
cd ..

# Start the bot
python3 main.py &

# Keep instance alive
tail -f /dev/null
