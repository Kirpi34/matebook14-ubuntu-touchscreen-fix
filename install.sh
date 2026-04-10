#!/bin/bash
set -e

echo "==> MateBook 14 Touchscreen Fix - Installer"

sudo cp scripts/fix-touchscreen.sh /usr/local/bin/fix-touchscreen.sh
sudo chmod +x /usr/local/bin/fix-touchscreen.sh

sudo cp scripts/matebook-touchscreen.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now matebook-touchscreen.service

echo "==> Done! Reboot to verify."
