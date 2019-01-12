#!/bin/sh -e

echo "Installing wifi reset service to /opt/tools/connmanctl-wifi-reset."
mkdir -p /opt/tools/connmanctl-wifi-reset
cp -f wifi-reset.sh /opt/tools/connmanctl-wifi-reset/wifi-reset.sh

echo "Installing systemd service to run at boot."
cp -f wifi-reset.service /lib/systemd/system/connmanctl-wifi-reset.service

echo "Enabling systemd service."
systemctl enable connmanctl-wifi-reset.service > /dev/null
