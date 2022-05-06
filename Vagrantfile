# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  config.vm.synced_folder '.', '/vagrant', disabled: true
  winsrv = "StefanScherer/windows_2019"
  winwks = "royce/capsulecorp-win7"
  vms = [{name: "goku", ip: "192.168.56.100", box: winsrv},
         {name: "vegeta", ip: "192.168.56.110", box: winsrv},
	 {name: "gohan", ip: "192.168.56.120", box: winsrv},
	 {name: "trunks", ip: "192.168.56.130", box: winsrv},
	 {name: "tien", ip: "192.168.56.140", box: winwks}]

  vms.each do |vm|
    config.vm.define vm[:name] do |box|
      box.vm.box = vm[:box]
      box.vm.hostname = vm[:name]
      box.vm.box_check_update = false

      box.winrm.transport = :plaintext
      box.winrm.basic_auth_only = true
      box.vm.communicator = "winrm"
      box.vm.network :private_network, ip: vm[:ip], netmask: "255.255.0.0", gateway: "192.168.56.1"

      box.vm.provider "virtualbox" do |vb, override|
        vb.gui = false
        vb.name = "ccpt_#{vm[:name]}"
        vb.customize ["modifyvm", :id, "--memory", 1024]
        vb.customize ["modifyvm", :id, "--cpus", 1]
        vb.customize ["modifyvm", :id, "--vram", 32]
        vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
        vb.customize ["setextradata", "global", "GUI/SuppressMessages", "all"]
      end

      box.vm.provision "ansible" do |ansible| 
        ansible.playbook = "#{vm[:name]}.yml"
      end
    end
  end


  config.vm.define "pentest" do |box|
    box.vm.box = "kalilinux/rolling"
    box.vm.network "private_network", ip: "192.168.56.200", netmask: "255.255.0.0", gateway: "192.168.56.1"
    box.vm.hostname = "pentest"
    box.vm.box_check_update = false

    box.vm.provider "virtualbox" do |vb, override|
      vb.gui = false
      vb.memory = "2048"
      vb.name = "ccpt_pentest"
    end
  end

end
