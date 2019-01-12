#!/bin/sh -e

echo "Disable systemd service."
systemctl disable connmanctl-wifi-reset.service > /dev/null

echo "Removing systemd service to run at boot."
rm /lib/systemd/system/connmanctl-wifi-reset.service
rm -rf /opt/tools/connmanctl-wifi-reset
