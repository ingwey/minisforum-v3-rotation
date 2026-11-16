# Minisforum V3: screen rotation

The V3 has an STMicroelectronics LSM6DS3TR-C accelerometer/gyro (ACPI ID `SMO8B30`).
Recent kernels (tested with 7.3.4) bind the `st_lsm6dsx` driver to it, but the
mount matrix is not provided by ACPI, so rotation is wrong or missing until it is set via hwdb.

See [awesome-minisforum-v3#2](https://github.com/mudkipme/awesome-minisforum-v3/issues/2).

## Install

    git clone <this repo>
    cd minisforum-v3-rotation
    ./install.sh

Remove with `./install.sh --uninstall`.

## Requirements

- Kernel that exposes `lsm6ds3tr-c_accel` in `/sys/bus/iio/devices/`
- `iio-sensor-proxy` (preinstalled on Bazzite/GNOME)

Works on immutable distros (Bazzite): the file goes to `/etc`, which persists across updates.
