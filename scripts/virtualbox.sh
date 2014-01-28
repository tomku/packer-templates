echo "Installing VirtualBox guest additions"
apt-get -y install build-essential dkms

VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
cd /tmp
mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt

rm /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso

