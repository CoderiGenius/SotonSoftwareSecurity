# make change permanent (across reboots)
echo "kernel.randomize_va_space = 0" > /etc/sysctl.d/01-disable-aslr.conf

#disable for this session
echo 0 | sudo tee /proc/sys/kernel/randomize_va_space

echo "ASLR disabled at reboot and in current session."