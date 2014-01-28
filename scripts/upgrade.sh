echo "Updating system"
apt-get -y update
apt-get -y dist-upgrade
apt-get -y install vim curl git nfs-common python-dev python-pip python-apt python-pycurl gdebi-core

echo "Adding 'vagrant' user to sudoers for passwordless sudo"
groupadd -r admin
usermod -a -G admin vagrant
echo %admin ALL=NOPASSWD:ALL > /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant

echo "Rebooting..."
reboot
sleep 60

