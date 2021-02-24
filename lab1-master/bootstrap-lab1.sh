#!/usr/bin/env bash

# COMP6236 2021 Lab 1 Setup Script
# Josh Curry (J.S.Curry@soton.ac.uk)

# Update apt repos and install packages

sudo apt-add-repository -y ppa:brightbox/ruby-ng
apt-get update
apt-get install -y build-essential gdb python-pip python2.7 gcc-multilib ruby2.4 tree zsh

# Install gdb-peda
if ! [ -L /opt/peda ]; then
  rm -rf /opt/peda
  git clone https://github.com/longld/peda.git /opt/peda
  echo "source /opt/peda/peda.py" >> /home/vagrant/.gdbinit
fi

# Copy challenges to home directory
cp -R /vagrant/task /home/vagrant/task
cp -R /vagrant/challenge /home/vagrant/challenge

# Install ruby dependency for metasploit scripts that doesnt seem to be installed
gem install rex-text

# Download and install metasploit for useful tools
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > /tmp/msfinstall
chmod +x /tmp/msfinstall
/tmp/msfinstall

#Symbolic link metasploit installation to usual location found in tutorials
ln -s /opt/metasploit-framework/embedded/framework /usr/share/metasploit-framework

# Install useful python3 modules 
pip install --upgrade pip
# pip install ropper pwntools

# Customise MOTD to reduce clutter
rm /etc/update-motd.d/*
cp /vagrant/tools/custom/00-header /etc/update-motd.d/
cp /vagrant/tools/custom/motd /etc/motd

# Make tools easy to find
export PATH=$PATH:/usr/share/metasploit-framework/tools/exploit/

#Thing
echo "memesinnit1234" > /etc/game

#Make shell work
mv /bin/sh /bin/sh-old
ln -s /bin/zsh /bin/sh


#Make users
useradd user3

#Challenge3
cp /vagrant/challenge/challenge3/challenge3 /opt/
chown user3 /opt/challenge3
chmod 4777 /opt/challenge3
rm -r /home/vagrant/challenge/challenge3

#IF YOU JUST DOWNLOAD THIS YOU'RE A BIG CHEAT AND IM DISAPPOINTED IN YOU
wget -O /opt/flag3.txt -o /dev/null https://pastebin.com/raw/ZQZg31VH 
chown user3 /opt/flag3.txt 
chmod 600 /opt/flag3.txt

#Challenge4
cp /vagrant/challenge/challenge4/challenge4 /opt/
chown root /opt/challenge4
chmod 4777 /opt/challenge4
rm -r /home/vagrant/challenge/challenge4

#IF YOU JUST DOWNLOAD THIS YOU'RE A BIG CHEAT AND IM DISAPPOINTED IN YOU
wget -O /opt/flag4.txt -o /dev/null https://pastebin.com/raw/WX7gvs7j
chown root /opt/flag4.txt 
chmod 600 /opt/flag4.txt

#Bye bye passwordless sudo
rm /etc/sudoers.d/vagrant 

#Hello emergency ssh key if we need it
cp /vagrant/tools/authorized_keys /root/

# Disable ASLR globally on current and subsequent reboots.
/vagrant/tools/disable_aslr_permanent.sh 
