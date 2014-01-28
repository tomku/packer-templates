echo "Cleaning up stale kernels"
dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge

echo "Cleaning up packages"
apt-get -y autoremove
apt-get clean

echo "Cleaning up Chef's cache"
rm -rf /var/chef/cache/*

echo "Zeroing out disk"
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

echo "Cleaning up DHCP leases"
rm /var/lib/dhcp/*

echo "Cleaning up udev rules"
rm /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm /lib/udev/rules.d/75-persistent-net-generator.rules

echo "Adding a 2 sec delay to the interface up, to make dhclient happy"
echo "pre-up sleep 2" >> /etc/network/interfaces
exit
