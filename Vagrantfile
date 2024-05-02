# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  
  # Setup new NAT switch
  config.trigger.before :up do |trigger|
    trigger.info = "Creating 'NATSwitch' Hyper-V switch if it does not exist..."
    trigger.run = {privileged: "true", inline: "powershell.exe -ep bypass -File scripts/create-nat-hyperv-switch.ps1"}
  end

  # Clean tmp directory and NAT switch
  config.trigger.after :destroy do |trigger|
    trigger.info = "Cleaning everything else..."
    trigger.run = {privileged: "true", inline: "powershell.exe -ep bypass -File scripts/cleanup.ps1"}
  end
  
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
  vms = [{name: "kms", ip: "10.10.10.2", interface_name: "eth0", box: ubuntu22, communicator:com_linux, cpu:1, ram:1024},
         {name: "development", ip: "10.10.10.3", interface_name: "Ethernet 2", box: winwstn, communicator:com_win, cpu:2, ram:2048},
         {name: "kali", ip: "10.10.10.4", interface_name: "eth0", box: kali2023, communicator:com_linux, cpu:1, ram:2048},
         {name: "goku", ip: "10.10.10.5", interface_name: "Ethernet", box: winsrv, communicator:com_win, cpu:2, ram:2048},
         {name: "krillin", ip: "10.10.10.6", interface_name: "Ethernet", box: winsrv, communicator:com_win, cpu:1, ram:1024},
         {name: "raditz", ip: "10.10.10.7", interface_name: "Ethernet", box: winsrv, communicator:com_win, cpu:1, ram:1024},
	       {name: "gohan", ip: "10.10.10.8", interface_name: "Ethernet", box: winsrv, communicator:com_win, cpu:1, ram:1024},
         {name: "tien", ip: "10.10.10.9", interface_name: "Ethernet 2", box: winwstn, communicator:com_win, cpu:1, ram:1024}
        ]

  vms.each do |vm|
    config.vm.define vm[:name] do |box|
      box.vm.box = vm[:box]
      box.vm.hostname = vm[:name]
      box.vm.box_check_update = false

      box.winrm.transport = :plaintext
      box.winrm.basic_auth_only = true
      box.vm.communicator = vm[:communicator]
      box.vm.network "public_network", :bridge => 'Default Switch'

      box.vm.provider "hyperv" do |hv|
        hv.vmname = "mad_#{vm[:name]}"
        hv.cpus = vm[:cpu]
        hv.memory = vm[:ram]
        hv.enable_enhanced_session_mode = true 
      end

      # Hack to avoid selecting the Switch manually
      box.trigger.before :reload do |trigger|
        trigger.info = "Static IP configuration ready"
        trigger.run = {privileged: "true", inline: "powershell.exe -ep bypass -File scripts/static-ip-set.ps1 mad_#{vm[:name]}"}
      end

      box.trigger.after :"VagrantPlugins::HyperV::Action::Configure", type: :action do |trigger|
        trigger.info = "If Static IP set force VM to use NATSwitch switch"
        trigger.run = {privileged: "true", inline: "powershell.exe -ep bypass -File scripts/set-hyperv-switch.ps1 mad_#{vm[:name]}"}
      end

      if box.vm.communicator == com_win
        box.vm.provision "shell", path: "./scripts/configure-static-ip.ps1", args: ["#{vm[:ip]}", "#{vm[:interface_name]}"]
      elsif box.vm.communicator == "ssh" && box.vm.box == ubuntu22
        box.vm.provision "shell", path: "./scripts/configure-static-ip-ubuntu.sh", args: ["#{vm[:ip]}"]
      else
        box.vm.provision "shell", path: "./scripts/configure-static-ip-kali.sh", args: ["#{vm[:ip]}"]
      end
      box.vm.provision :reload

      box.vm.provision "ansible" do |ansible| 
        ansible.compatibility_mode = "2.0"
        ansible.playbook = "ansible/#{vm[:name]}.yml"
      end
    end
  end
  

end
