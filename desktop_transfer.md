Be aware of important hardlinks in this repository. Use rsync's keep link option.

Use `lxappearance` to set your theme. Ammar from the past recommends Arc-Dark.


# Wifi Issues

If you're on a laptop you might get some Wifi issues.. Run these

```bash
echo "options iwlwifi 11n_disable=1" | sudo tee /etc/modprobe.d/iwlwifi.conf
sudo modprobe -rfv iwldvm
sudo modprobe -rfv iwlwifi
sudo modprobe -v iwlwifi
```

It may be caused by a "Wifi Coexist" setting in many routers which switches from 40mhz to 20mhz if it detects too many 40mhz routers nearby. This option should be configurable on the router.

Use 

```bash
sudo rfkill block wifi
sudo rfkill unblock wifi
```

as a ghetto solution in solving this
