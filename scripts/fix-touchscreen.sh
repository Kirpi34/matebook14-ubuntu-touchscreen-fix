#!/bin/bash
modprobe -r hid_multitouch
modprobe -r i2c_hid_acpi
sleep 2
modprobe i2c_hid_acpi
modprobe hid_multitouch
