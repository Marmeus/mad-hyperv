# Capsulecorp Pentest

## Requirements
In order to use the Capsulecorp Pentest network you must have the following:

* VirtualBox
  * [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)
* Vagrant
* Ansible

## OSX Configuration
In order to manage Windows hosts you'll have to install `pywinrm` with pip inside the ansible virtual environment

    source ~/ansible/bin/activate
    pip install pywinrm
    deactivate

## Installation
Bring up the virtual machines using vagrant

    vagrant up

Provision the pentest machine.

    vagrant provision pentest

Setup the Capsulecorp domain controller

    vagrant provision goku


