#!/usr/bin/env bash
# Installs the accelerometer mount matrix for the Minisforum V3 (screen rotation).
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/61-sensor-local.hwdb"
DST=/etc/udev/hwdb.d/61-sensor-local.hwdb

if [[ $EUID -ne 0 ]]; then
    exec sudo "$0" "$@"
fi

if [[ "${1:-}" == "--uninstall" ]]; then
    rm -f "$DST"
else
    install -Dm644 "$SRC" "$DST"
fi

systemd-hwdb update
udevadm trigger -s iio
systemctl restart iio-sensor-proxy 2>/dev/null || true

echo "Done. Check with: udevadm info /sys/bus/iio/devices/iio:device1 | grep MOUNT"
