Be aware of important hardlinks in this repository. Use rsync's keep link option.

Use `lxappearance` to set your theme. Ammar from the past recommends Arc-Dark.

If you're on a laptop you might get some Wifi issues.. Run these

```bash
echo "options iwlwifi 11n_disable=1" | sudo tee /etc/modprobe.d/iwlwifi.conf
sudo modprobe -rfv iwldvm
sudo modprobe -rfv iwlwifi
sudo modprobe -v iwlwifi
```
