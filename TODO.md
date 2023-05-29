# TODO

# General
- [X] Static IPs
- [ ] Create a config.json with all the repited data like domain admin credentials
- [X] Install Vuln-AD-plus -> The problem was on the script :D
  - [ ] Script Output into a file
  - [ ] Make it into a .yml filey
- [X] Disable Real Time monitoring in all the machines
  - [X] Disable cloud-delivered protection
  - [X] Disable sample submissio
- [ ] Fix enhanced session on Windows Machines
- [ ] Move all machines.yml to `ansible` also `roles`.
- [ ] Install spanish keyboard
```yml
- name: Windows | Add the fr keyboard layout
  win_shell: $langList = Get-WinUserLanguageList; $langList.Add("es-ES"); Set-WinUserLanguageList -LanguageList $langList -Force
```
- [X] Activate Windows permanently
```bash
# Windows Server 2022 Evaluation
dism /online /set-edition:ServerStandard /productkey:VDYBN-27WPP-V4HQT-9VMD4-VMK7H /accepteula /NoRestart
cscript //nologo c:\windows\system32\slmgr.vbs /upk
cscript //nologo c:\windows\system32\slmgr.vbs /ipk VDYBN-27WPP-V4HQT-9VMD4-VMK7H
cscript //nologo c:\windows\system32\slmgr.vbs /skms 192.168.56.6:1688
cscript //nologo c:\windows\system32\slmgr.vbs /ato

# Windows 10 Enterprise Evaluation
<Upload skus-Windows-10.zip>
Expand-Archive -Force .\skus-Windows-10.zip C:\Windows\System32\spp\tokens\skus\
cscript.exe %windir%\system32\slmgr.vbs /rilc
cscript.exe %windir%\system32\slmgr.vbs /upk >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /ckms >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /cpky >nul 2>&1
cscript.exe %windir%\system32\slmgr.vbs /ipk M7XTQ-FN8P6-TTKYV-9D4CC-J462D
sc config LicenseManager start= auto & net start LicenseManager
sc config wuauserv start= auto & net start wuauserv
clipup -v -o -altto c:\
echo
cscript //nologo c:\windows\system32\slmgr.vbs /ipk M7XTQ-FN8P6-TTKYV-9D4CC-J462D
cscript //nologo c:\windows\system32\slmgr.vbs /skms 192.168.56.6:1688
cscript //nologo c:\windows\system32\slmgr.vbs /ato
```

# Raditz - Unconstrained Delegation
- [X] Unconstrained delegation (HTTP-> RADITZ)
  - [X]  Add scheduled tasks to perform a web request from gohan  to raditz -> It doesnt matter if you use SpoolSample 
    - [X] Mount a web site with domain authentication [web](https://blog.xpnsec.com/kerberos-attacks-part-1/)
    - [ ] Resolve odd behaviour: When a user authenticates againts the machinethe user's ticket doesn't appear on the unconstrained machine
    - [ ] Probar a eliminar el win_feature "web-server" del main de raditz.

# Gohan - Constrained Delegation
- [X] Constrained delegation (MSSL -> DC)
  - [X] Install datase server
  - [X] Enable xp_cmdshell -> El usuario tiene permisos para habilitarlo
  - [X] Allow domain user to access the database
  - [X] Add constrained delegation

# Krillin - Vulnerable service

- [X] Create W10 WST
  - [X] Install vulnerable a service
- [X] Install virtual studio code -> Too much time
- [X] Install hacking tools
- [X] Allow Non Admin users to restart the machine
- [X] Make vuln_svc sysadmin at MSSQL service
- [ ] Install clamAV
- [X] Upload [Office2016](https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=ProfessionalRetail&language=es-es&platform=x64&token=NKGG6-WBPCC-HXWMY-6DQGJ-CPQVG&version=O16GA&act=1)
- [X] Activate Office With KMS
```bash
cd "C:\Program Files\Microsoft Office\Office16"
for /f %x in ('dir /b ..\root\Licenses16\ProPlus2019VL*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%x"
cscript.exe .\OSPP.VBS /sethst:192.168.56.2
cscript.exe .\OSPP.VBS /act
```
- [ ] Change from Windows Server To Workstation
  - [ ] Disable tamper monitoring
  - [X]  Install AD cmdlets
```powershell
Get-WindowsCapability -Name RSAT* -Online
Add-WindowsCapability -Online -Name 'Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0'
```

# Kali machine
- [X] Create a kali machine for Hyper-V
- [X] Set static IP
- [X] Fix sources.list keys
- [X] Fix error to install packages without upgrading the machine
- [X] Install Tools
- [X] Install apache2
- [X] Install samba server
- [ ] Allow Remote RDP

```bash
[visualstudio]
path = /var/www/html/data
browseable = yes
read only = no
writeable = yes
guest ok = yes
public = yes
force user = auditor
```

# Development Workstation
- [X] Activate KMS
- [X] Add Samba Script
```powershell
 echo net use Z: /delete > kshare.bat && echo net use Z: \\192.168.56.4\visualstudio '' /user:'' >> kshare.bat
```
- [X] Install Visual Studio Code
- [X] Install Visual Studio


# KMS Server
- [X] Install virtual machine
- [X] Install docker
- [X] Install https://github.com/SystemRage/py-kms

# Tien

- [x]  Install Offiice
