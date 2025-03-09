#!/bin/bash

# Install missing dependencies
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

# Navigate to extracted Telethon-1.24.0 folder
cd Telethon-1.24.0 || exit
pip install .
cd ..

# Check if main.py exists and run bot
MAIN_PATH=$(find / -name main.py 2>/dev/null)
if [ -f "$MAIN_PATH" ]; then
    echo "✅ main.py found at: $MAIN_PATH"
    python3 "$MAIN_PATH" &
else
    echo "❌ ERROR: main.py not found!"
    exit 1
fi

# 🟢 Run a dummy HTTP server for Koyeb Health Check
pip install flask
echo "from flask import Flask; app = Flask(__name__); @app.route('/') def home(): return 'Bot Running'; app.run(host='0.0.0.0', port=8080)" > server.py
python3 server.py &

# Keep instance alive
tail -f /dev/null
