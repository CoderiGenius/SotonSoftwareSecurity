#!/usr/bin/env bash

# COMP6236 2021 Lab 0 Setup Script
# Josh Curry (J.S.Curry@soton.ac.uk)

# Update apt repos and install packages
apt-get update
apt-get install -y build-essential gdb python3 python3-pip gcc-multilib tree

# Install gdb-peda
if ! [ -L /opt/peda ]; then
  rm -rf /opt/peda
  git clone https://github.com/longld/peda.git /opt/peda
  echo "source /opt/peda/peda.py" >> /home/vagrant/.gdbinit
fi

# Copy challenges to home directory
if ! [ -L /home/vagrant/lab0 ]; then
  rm -rf /home/vagrant/lab0
fi
cp -R /vagrant/lab0 /home/vagrant

chown -R vagrant:vagrant /home/vagrant/lab0

# Customise MOTD to reduce clutter
rm /etc/update-motd.d/*
cp /vagrant/tools/custom/00-header /etc/update-motd.d/
cp /vagrant/tools/custom/motd /etc/motd
