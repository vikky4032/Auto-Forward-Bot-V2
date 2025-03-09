#!/bin/bash

# Update and install dependencies
apt update && apt install -y wget unzip

# Upgrade pip
pip install --upgrade pip

# Check if requirements.txt exists
REQ_FILE=$(find / -name requirements.txt 2>/dev/null | head -n 1)

if [ -f "$REQ_FILE" ]; then
    echo "✅ requirements.txt found at: $REQ_FILE"
    pip install -r "$REQ_FILE"
else
    echo "❌ ERROR: requirements.txt not found!"
    exit 1
fi

# Download and extract external ZIP file
wget -O gagantelethon.zip https://devgagan.in/wp-content/uploads/2023/12/gagantelethon.zip
unzip gagantelethon.zip

# Navigate to extracted Telethon folder
cd Telethon-1.24.0 || exit
pip install .
cd ..

# Check if main.py exists and run bot
MAIN_PATH=$(find / -name main.py 2>/dev/null | head -n 1)

if [ -f "$MAIN_PATH" ]; then
    echo "✅ main.py found at: $MAIN_PATH"
    python3 "$MAIN_PATH" &
else
    echo "❌ ERROR: main.py not found!"
    exit 1
fi

# Run Dummy Server for Koyeb Health Check
pip install flask
echo "from flask import Flask; app = Flask(__name__); @app.route('/') def home(): return 'Bot Running'; app.run(host='0.0.0.0', port=8080)" > server.py
python3 server.py &

# Keep instance alive
tail -f /dev/null
