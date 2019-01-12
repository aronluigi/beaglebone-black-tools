BeagleBone WiFi Reset for connmanctl
===

Systemd service to reset all wireless interfaces on boot.

Installation
===
This *must* be run on a BeagleBone running the Debian operating system.
Next make sure you've upgraded to the latest kernel available by executing once (be sure you device has internet access first):


```
cd /opt/scripts/tools/
./update_kernel.sh
```

Once the kernel has updated and the device restarted, install the service by entering the directory where this repository was cloned and executing:

```
sudo ./install.sh
```

uninstalling
```
sudo ./uninstall.sh
```
