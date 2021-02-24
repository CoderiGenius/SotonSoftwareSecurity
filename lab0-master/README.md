# lab0

Introduction to Vagrant, Linux and C

### Installing software

For the laboratory sessions in this module we will be making use of Vagrant, a tool which allows virtual machines with specific configurations to be spun up from configuration files. In order to use it, you will need to download some software.

Download `Virtualbox` from https://www.virtualbox.org/wiki/Downloads

Download `Vagrant` from https://www.vagrantup.com/downloads

If you’re running windows, download `git` from https://git-scm.com/downloads. If you’re running mac or linux, you should already have this installed. When installing, **make sure you tick the option to “Add to path”**, which will allow you to run git from the terminal.

Once both of these packages have been installed, you should be able to open up a terminal on your computer (`cmd` on Windows, Terminal on Mac/Linux) and type vagrant to check it is installed and working.

If you get an output showing all supported vagrant commands, you are good to move on to the next step.

### Spin up the Lab0 VM Image

Vagrant works by reading configuration files in your current directory and using them to create VMs. Hence, in order to spin up the VM, you may need to use the cd command in your terminal to change-directory into the correct folder.

Change directory into a working folder from which you wish to complete the labs. 
You will need to make it if it doesn’t exist, and then cd into it for example:
```bash
cd Documents/comp6236-labs
```
Download the lab0 VM image from the UoS Git server by typing the following:
```bash
git clone https://git.soton.ac.uk/comp6236/lab0
```
Change into the lab0 folder so we can use vagrant:
```bash
cd lab0
```
You should now be able to run the following command to 
```bash
vagrant up
```
If you have the virtualbox window open, you will notice that a new VM appears, and vagrant begins to build it.

When the build process is complete, you can connect to a shell on your newly created VM using the following command:
```bash
vagrant ssh
```

You should now be in an `ssh` shell on your newly made VM.


### End of the lab - power off and delete the VM

To stop the VM, `cd` into this repo and run:

```bash
vagrant halt
```

To delete the VM from disk, run:

```bash
vagrant destroy
```