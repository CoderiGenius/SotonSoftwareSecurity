#!/usr/bin/env bash

# COMP6236 2021 Lab 1 Setup Script
# Josh Curry (J.S.Curry@soton.ac.uk)

# Update apt repos and install packages

apt-get update
apt-get install -y build-essential gdb python-pip python2.7 tree zsh unzip zip p7zip-full git-lfs

# Install gdb-peda
if ! [ -L /opt/peda ]; then
  rm -rf /opt/peda
  git clone https://github.com/longld/peda.git /opt/peda
  echo "source /opt/peda/peda.py" >> /home/vagrant/.gdbinit
fi

# Customise MOTD to reduce clutter
rm /etc/update-motd.d/*
cp /vagrant/tools/custom/00-header /etc/update-motd.d/
cp /vagrant/tools/custom/motd /etc/motd

#Make shell work
mv /bin/sh /bin/sh-old
ln -s /bin/zsh /bin/sh

#Hello emergency ssh key if we need it
mkdir -p /root/.ssh
cp /vagrant/tools/authorized_keys /root/.ssh/

# Disable ASLR globally on current and subsequent reboots.
/vagrant/tools/disable_aslr_permanent.sh 

#Get files for lab
#Install pip and pip packages
pip install --upgrade pip
python -m pip install pycrypto yara-python distorm3==3.4.4 

#Get volatility and install it
git clone https://github.com/volatilityfoundation/volatility.git /opt/volatility
cd /opt/volatility; python setup.py install
ln -s /usr/local/bin/vol.py /usr/local/bin/volatility

#Get memdump
wget http://files.sempersecurus.org/dumps/cridex_memdump.zip -P /tmp
unzip /tmp/cridex_memdump.zip -d /home/vagrant
chown -R vagrant:vagrant /home/vagrant/
#And we're done.
