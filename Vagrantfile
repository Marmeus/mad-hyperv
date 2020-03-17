# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  config.vm.define "goku" do |system|
    system.vm.network "private_network", type: "dhcp"
    system.vm.box = "royce/capsulecorp-winsrv01"
    system.vm.guest = :windows
    system.vm.communicator = "winrm"
    system.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp1", auto_correct: true
    system.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm1", auto_correct: true
    system.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/dcpromo.yml"
    end
  end
  config.vm.define "gohan" do |system|
    system.vm.network "private_network", type: "dhcp"
    system.vm.box = "royce/capsulecorp-winsrv01"
    system.vm.guest = :windows
    system.vm.communicator = "winrm"
    system.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp2", auto_correct: true
    system.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm2", auto_correct: true
  end
  config.vm.define "vegeta" do |system|
    system.vm.network "private_network", type: "dhcp"
    system.vm.box = "royce/capsulecorp-winsrv01"
    system.vm.guest = :windows
    system.vm.communicator = "winrm"
    system.vm.network :forwarded_port, guest: 3389, host: 3389, auto_correct: true
    system.vm.network :forwarded_port, guest: 5985, host: 5985, auto_correct: true
  end
  config.vm.define "trunks" do |system|
    system.vm.network "private_network", type: "dhcp"
    system.vm.box = "royce/capsulecorp-winsrv01"
    system.vm.guest = :windows
    system.vm.communicator = "winrm"
    system.vm.network :forwarded_port, guest: 3389, host: 3389, auto_correct: true
    system.vm.network :forwarded_port, guest: 5985, host: 5985, auto_correct: true
  end

  config.vm.define "pentest" do |box|
    box.vm.box = "royce/capsulecorp-pentest"
    box.vm.network "private_network", type: "dhcp"
    box.vm.network :forwarded_port, guest: 3389, host: 3389, auto_correct: true
    box.vm.box_version = "0.0.3-alpha"
    box.ssh.username = "pentest"
    box.ssh.private_key_path = "ssh/capsulecorp_id_rsa"
    box.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/site.yml"
    end
  end

end
