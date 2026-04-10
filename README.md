# Huawei MateBook 14 (Core Ultra 125H) — Ubuntu Touchscreen Fix

Tested on Ubuntu 24.04 LTS, kernel 6.8.x.

## What's going on

Fresh Ubuntu install, touchscreen does nothing. No obvious errors either.

The actual cause: `i2c_designware` fails silently on its first communication
attempt during boot, and the FTSC1000 touchscreen just gets skipped. By the
time the system is up, the hardware was never properly initialized.

The fix is straightforward — unload and reload the relevant kernel modules
after boot. This repo automates that with a systemd service so you don't
have to think about it again.

> The modprobe reload approach is a known workaround for I2C HID race
> conditions on Linux. This repo packages it specifically for the MateBook 14
> Core Ultra, with suspend/resume support included.

## Install

```bash
git clone https://github.com/Kirpi34/matebook14-ubuntu-touchscreen-fix.git
cd matebook14-ubuntu-touchscreen-fix
chmod +x install.sh
./install.sh
```

Reboot and the touchscreen should work.

## What the installer does

1. Copies `fix-touchscreen.sh` to `/usr/local/bin/`
2. Installs a systemd service that runs it on boot and after suspend

That's it.

## Tested on

| Device | Ubuntu | Kernel | Status |
|---|---|---|---|
| MateBook 14 Core Ultra 125H | 24.04 LTS | 6.8.x | Works |

Tested on a different config? Open an issue or PR with your results.

## Manual steps

See [MANUAL.md](MANUAL.md) if you'd rather do it by hand.

## License

MIT
