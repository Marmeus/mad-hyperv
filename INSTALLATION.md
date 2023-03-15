# Installation Process

## 1. Enable Hyper-V feature

In order to enable Hyper-V on your Windows System go to `Control Panel\Programs\Turn Windows features on or off\`, and then look for "Hyper-V".

\<PICTURE OF HYPER-V\>

> :warning: If you are using VBox, after enabling Hyper-V you might experience some problems running your VBox machines. So, to solve this problem you need to enable the feature "Virtual Machines".
>
> \<PICTURE OF VIRTUAL MACHINES>

## 2. Install & Configure WSL

### WSL

As administrator
```
wsl --install -d ubuntu
```


### Ansible

```
sudo apt install python3-pip
echo 'PATH=~/.local/bin:$PATH' >> ~/.bashrc
pip install --user ansible==7.3.0
pip install pywinrm==0.4.3 --user

```


### Vagrant

```bash
echo 'export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"' >> ~/.bashrc
echo 'export VAGRANT_DEFAULT_PROVIDER=hyperv' >> ~/.bashrc
source ~/.bashrc
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant -y
```

> A few vagrant plugins are required to launch and provision all of the VMs.  If you below vagrant plugin install commands fail, open up an administrative PowerShell prompt and run the command.
> ```
Restart-Service LxssManager
> ```


```
vagrant plugin install winrm
vagrant plugin install winrm-fs
vagrant plugin install winrm-elevated
```




## 3. Setting up the AD environment 

### Goku

```
vagrant up goku --provision
```

Modify the file `/roles/joindomain/tasks/main.yml` by adding Goku's IP address as DNS Server.

### raditz

```bash
vagrant up goku --provision
```
> It will end with an error on the "Install IIS (Web-Server only)" task, but it is intended.

# Uninstall everything

```bash
vagrant destroy goku raditz -f
```

# Obtain DC IP Address

> Execute a powershell terminal as administrator

```powershell
(Get-VMNetworkAdapter  ccpt_goku).IPAddresses | select -First 1
```