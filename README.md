# Capsulecorp Pentest
The Capsulecorp Pentest is a small virtual network managed by vagrant and ansible.  It contains five virtual machines, including one Linux attacking system running xubuntu and 4 Windows 2019 servers configured with various vulnerable services.  This project can be used to learn network penetration testing as a stand-alone environment but is ultimatly designed to compliment my book [The Art of Network Penetration Testing](https://www.manning.com/books/the-art-of-network-penetration-testing) 

## Current Funcionality
* Active directory domain with one DC and 3 server members
  * Domain Controler: `goku.capsulecorp.local`
  * Server 01: `vegeta.capsulecorp.local`
  * Server 02: `gohan.capsulecorp.local`
  * Server 03: `trunks.capsulecorp.local`
* Vulnerable Jenkins server on `vegeta`
* Vulnerable Apache Tomcat server on `trunks`
* Xubuntu pentest system running XRDP.
  * Metasploit
  * CrackMapExec
  * Nmap
  * Remmina RDP client

## Requirements
In order to use the Capsulecorp Pentest network you must have the following:

* VirtualBox
  * [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)
* Vagrant
  * [https://www.vagrantup.com/downloads.html](https://www.vagrantup.com/downloads.html)

* Ansible
  * [https://docs.ansible.com/ansible/latest/installation_guide/index.html](https://docs.ansible.com/ansible/latest/installation_guide/index.html)

## OSX Configuration
In order to manage Windows hosts you'll have to install `pywinrm` with pip inside the ansible virtual environment

```bash
source ~/ansible/bin/activate
pip install pywinrm
deactivate
```

# Installation

## Configure the windows hosts
The first thing you should do is bring up and provision Goku the domain controller.  This system will likely take the longest to bring up because the dcpromo stuff just takes a while.

Bring up the VM

	vagrant up goku

Provision the VM

	vagrant provision goku

Repeat the above two commands for gohan, vageta and trunks.

***...WARNING...***

This section of the provision is expected to take a while because after a dcpromo it takes a long time for the system to reboot.

```bash
TASK [promotedc : Set a static address to 172.28.128.100] **********************
changed: [goku]

TASK [promotedc : Change hostname to goku] *************************************
ok: [goku]

TASK [promotedc : Install Active Directory Services] ***************************
ok: [goku]

TASK [promotedc : Promote goku to domain controller] ***************************
changed: [goku]

TASK [promotedc : Reboot after promotion] **************************************
```

## Configure your pentest platform

Bring up the virtual machines using vagrant.  First cd into the project directory, for example: `cd ~/capsulecorp-pentes`.  Take note of the RDP port that gets forwarded to your localhost.

    vagrant up pentest

Provision the pentest machine.

    vagrant provision pentest

You can access your penitent machine either using your preferred RDP client to connect to the xrdp listener or via SSH with.

	vagrant ssh pentest
