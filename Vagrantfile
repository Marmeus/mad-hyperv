# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  
  # config.vm.network "public_network", bridge: "NATSwitch"
  
  config.vm.synced_folder '.', '/vagrant', disabled: true


  # Clodu machines
  #winsrv = "StefanScherer/windows_2019"
  winsrv = "gusztavvargadr/windows-server"
  winwstn = "StefanScherer/windows_10"
  kali_old = "elrey741/kali-linux_amd64"
  kali2023 = "marmeus/kali-2023-hyperv"
  ubuntu22 = "generic/ubuntu2204"

  # Types of connection
  com_win = "winrm"
  com_linux = "ssh"

  # VM configuration (IPs do not work for Hyper-V environments)
  vms = [{name: "kms", ip: "0.0.0.0", box: ubuntu22, communicator:com_linux},
         {name: "goku", ip: "0.0.0.0", box: winsrv, communicator:com_win},
         {name: "krillin", ip: "0.0.0.0", box: winsrv, communicator:com_win},
         {name: "raditz", ip: "0.0.0.0", box: winsrv, communicator:com_win},
	       {name: "gohan", ip: "0.0.0.0", box: winsrv, communicator:com_win},
         {name: "kali", ip: "0.0.0.0", box: kali2023, communicator:com_linux},
         {name: "kaliold", ip: "0.0.0.0", box: kali_old, communicator:com_linux},
         {name: "development", ip: "0.0.0.0", box: winwstn, communicator:com_win},
         {name: "vegeta", ip: "0.0.0.0", box: winsrv, communicator:com_win},
         {name: "trunks", ip: "0.0.0.0", box: winsrv, communicator:com_win},
         {name: "tien", ip: "0.0.0.0", box: winwstn, communicator:com_win},
         {name: "testsrv", ip: "0.0.0.0", box: winsrv, communicator:com_win}
        ]

  vms.each do |vm|
    config.vm.define vm[:name] do |box|
      box.vm.box = vm[:box]
      box.vm.hostname = vm[:name]
      box.vm.box_check_update = false

      box.winrm.transport = :plaintext
      box.winrm.basic_auth_only = true
      box.vm.communicator = vm[:communicator]
      # box.ssh.username= "vagrant"
      # box.ssh.password= "vagrant"
      # box.ssh.insert_key = false
      # box.vm.network "public_network", ip: "10.10.10.2", netmask: "24", gateway: "10.10.10.1"
      # box.vm.network "public_network", ip: vm[:ip], bridge: "NATSwitch",:mac => "00155DB001DD"
      box.vm.network "public_network", :bridge => 'NATSwitch'

      box.vm.provider "hyperv" do |hv|
        hv.vmname = "ccpt_#{vm[:name]}"
        hv.cpus = 2
        hv.memory = "2048"
        hv.enable_enhanced_session_mode = true 
      end

      box.vm.provision "ansible" do |ansible| 
        ansible.compatibility_mode = "2.0"
        ansible.playbook = "ansible/#{vm[:name]}.yml"
      end
    end
  end
  

end
