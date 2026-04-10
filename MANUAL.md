# Manual Installation

## Step 1 — Create the script

```bash
sudo nano /usr/local/bin/fix-touchscreen.sh
```

Paste this content:

```bash
#!/bin/bash
modprobe -r hid_multitouch
modprobe -r i2c_hid_acpi
sleep 2
modprobe i2c_hid_acpi
modprobe hid_multitouch
```

Make it executable:

```bash
sudo chmod +x /usr/local/bin/fix-touchscreen.sh
```

## Step 2 — Create the systemd service

```bash
sudo nano /etc/systemd/system/matebook-touchscreen.service
```

Paste this content:

```ini
[Unit]
Description=Huawei MateBook Touchscreen Fix Service
After=multi-user.target
After=suspend.target

[Service]
Type=oneshot
ExecStart=/usr/local/bin/fix-touchscreen.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target suspend.target
```

## Step 3 — Enable the service

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now matebook-touchscreen.service
```

Reboot and the touchscreen should work.
