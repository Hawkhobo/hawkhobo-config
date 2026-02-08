# How to set draglock and tap sensitivity

-----

## Install `libinput-tools`

## Test it out

- measure

```sh
# find your device file, ex: /dev/input/events12
sudo libinput list-devices

# measure
libinput measure touchpad-pressure
```

- temporary setting

```sh
# replace X, Y, Z for ex: 10, 8, 20
sudo libinput measure touchpad-pressure --touch-thresholds=X:Y --palm-threshold=Z
```

## Drag Lock (Gnome)

- use `dconf` or `gsettings` to enable `com.gnome.desktop.peripherals.touchpad.tap-and-drag-lock` enabled


## Tap sensitivity

- create: `/etc/udev/hwdb.d/99-touchpad-pressure.hwdb`

- content:

```sh
libinput:name:*Touchpad*:dmi:* LIBINPUT_ATTR_PRESSURE_RANGE=10:8 LIBINPUT_ATTR_TAP_BUTTON=1 LIBINPUT_ATTR_TAP_DRAG=1
```

- reload: `udevadm control --reload-rules` and `udevadm trigger`

- reboot

-----
