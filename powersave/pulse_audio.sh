# Add this to /etc/rc.local if pulseaudio is hogging ur battery :/

echo 1 | tee /sys/module/snd_hda_intel/parameters/power_save
echo Y | tee /sys/module/snd_hda_intel/parameters/power_save_controller
pkill pulseaudio
pulseaudio --start
exit 0
