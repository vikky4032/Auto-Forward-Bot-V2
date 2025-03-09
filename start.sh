#!/bin/bash

# Update package list and install missing dependencies
apt update && apt install -y wget unzip

# Upgrade pip and install Python dependencies
pip install --upgrade pip
pip install -r requirements.txt

# Download and extract external ZIP file
wget -O gagantelethon.zip https://devgagan.in/wp-content/uploads/2023/12/gagantelethon.zip
unzip gagantelethon.zip

# Navigate to the extracted Telethon-1.24.0 folder
cd Telethon-1.24.0 || exit

# Install the package inside the extracted folder
pip install .

# Return to the main directory
cd ..

# Start the bot
python3 main.py &

# Keep instance alive
tail -f /dev/null
#!/bin/bash

# Debugging - Show all files to check if main.py exists
ls -l

# Start the bot from the correct path
python3 $(find / -name main.py 2>/dev/null) &
tail -f /dev/null
