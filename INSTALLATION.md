# Installation Process

Please, read the whole installation process carefully. It is not entirely a copy-and-paste installation guide :exclamation: 

## 1. Enable Hyper-V feature

To enable Hyper-V with some extra features, execute the following commands.

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
Enable-WindowsOptionalFeature -Online -FeatureName HypervisorPlatform
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
```

## 2. Install & Configure WSL

### Windows Subsystem for Linux (WSL)

Configure the WSL to version 1, so it uses the bridge Internace, instead of NAT in v2. For doing so, execute the following commands on Powershell as Administrator.

```powershell
wsl --install -d ubuntu
wsl --set-version ubuntu 1
```

### Ansible

Then, once you have set up your Ubuntu machine and created a user, execute the following commands as a user to install Ansible.

```bash
sudo apt update
sudo apt install python3-pip -y
echo 'PATH=~/.local/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
pip install --user ansible==7.3.0
pip install pywinrm==0.4.3 --user
```

Plus, you must create the file `/etc/wsl.conf` with the following content, so ansible can connect to the Linux machine through SSH.

```bash
# Enable extra metadata options by default
[automount]
enabled = true
root = /mnt/
options = "metadata,umask=77,fmask=11"
mountFsTab = false
```

Then, execute the command `Restart-Service LxssManager` within an elevated PowerShell.

### Vagrant

To install Vagrant, you need to execute the following commands:

> :information_source: It is required the vagrant version **2.4.1**

```bash
echo 'export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"' >> ~/.bashrc
echo 'export VAGRANT_DEFAULT_PROVIDER=hyperv' >> ~/.bashrc
source ~/.bashrc
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant -y
```

> A few vagrant plugins are required to launch and provision all of the VMs.  If you below vagrant plugin install commands fail, open up an administrative PowerShell prompt and run the command `Restart-Service LxssManager`.

```bash
vagrant plugin install winrm
vagrant plugin install winrm-fs
vagrant plugin install winrm-elevated
```

# Laboratory

Then, download the repository on `C:\`, so it can be accessed pretty easily through Ubuntu WSL

Once the server is running, open your Ubuntu WSL  as an Administrator, and execute the following command and wait for it to finish. After that, you can stop and remove the DHCP server.

> :information_source: There is no need to install all the virtual machines, but if you want to use the AD environment, at least you must install "kms" and "goku, reboot the machines, and then install the other AD machine you want to use.

```bash
cd /mnt/c/capsulecorp-ad-pentest-hyperv/
vagrant up kms development kali goku krillin raditz gohan tien --provision
```

Finally, you need to set the `EnhancedSessionTransportType` on each machine to take advantage of Hyper-V clipboard capabilities. To do so, execute the following commands on PowerShell as Administrator.

```powershell
Set-VM -VMName ccpt_kms,ccpt_kali -EnhancedSessionTransportType HvSocket
Set-VM -VMName ccpt_development,ccpt_goku,ccpt_krillin,ccpt_raditz,ccpt_gohan,ccpt_tien -EnhancedSessionTransportType VMBus
```

# Uninstall

In case you are tired of this lab environment or you are having problems with VirtualBox, you can get rid of everything with the following commands.

1. On your Ubuntu WSL, executed as Administrator. 

```bash
vagrant destroy kms development kali goku krillin raditz gohan tien -f
rm -rf /mnt/c/capsulecorp-pentest-hyperv/
vagrant box list | cut -d ' ' -f 1 | xargs -I {} bash -c "vagrant box remove -f {}"
```

2. Disable Hyper-V startup through a PowerShell as Administrator.

> If you want to enable it again, change `off` to `auto`.
```powershell
# To Turn it off
bcdedit /set hypervisorlaunchtype off

# To uninstall it completely
Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
Disable-WindowsOptionalFeature -Online -FeatureName HypervisorPlatform
Disable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
```



