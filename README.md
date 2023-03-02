**Discord:**

[![](https://dcbadge.vercel.app/api/server/D5QTtWEwxZ)](https://discord.gg/D5QTtWEwxZ)




# 1. Capsulecorp Pentest

The Capsulecorp Pentest is a small virtual network managed by Vagrant and Ansible. It contains five virtual machines, including one Linux attacking system running Xubuntu and 4 Windows 2019 servers configured with various vulnerable services. This project can be used to learn network penetration testing as a stand-alone environment but is ultimatly designed to complement my book [The Art of Network Penetration Testing](https://bit.ly/38N9S9e).


![](https://raw.githubusercontent.com/R3dy/capsulecorp-pentest/assets/windows%20environment.png)

## Why is this cool?
Setting up a virtual network to learn penetration testing can be tedious as well as time/resource consuming. Everything in the capsulecorp environment is pretty much done for you already. Once you get Vagrant, Ansible and VirtualBox installed on your machine you only need to run a couple of `vagrant` commands to have a fully functioning Active Directory domain that you can use for hacking/learning/pentesting etc.

## 1.1. Requirements
In order to use the Capsulecorp Pentest network you must have the following:

* Hyper-V
* Vagrant
  * [https://www.vagrantup.com/downloads.html](https://www.vagrantup.com/downloads.html)
* Ansible
  * [https://docs.ansible.com/ansible/latest/installation_guide/index.html](https://docs.ansible.com/ansible/latest/installation_guide/index.html)

* Quad-core CPU with 16GB RAM is recommended.  
  * With 8GB or less you could still use the project but ***only run 2 or 3 VMs at a time***.  
  * For All VMs running at once 16GB is required.

## 1.2. Current Functionality
* Active directory domain with one DC and 3 server members. All windows server have evaluation licenses, which are activated on installation (for 180 days)
  * Domain Controler: `goku.capsulecorp.local`
  * Server 01: `vegeta.capsulecorp.local`
  * Server 02: `gohan.capsulecorp.local`
  * Server 03: `trunks.capsulecorp.local`
  * Wrkstn 01: `tien.capsulecorp.local`
* Vulnerable Jenkins server on `vegeta`
* Vulnerable Apache Tomcat server on `trunks`
* Vulnerable MSSQL server on `gohan`
* Vulnerable MS17-010 on `tien`
* Xubuntu pentest system running XRDP.
  * Metasploit
  * CrackMapExec
  * Nmap
  * Remmina RDP client
  * RVM
  * Python/Pip/Pipenv
  * Impacket


# Active Directory Vulnerabilities
- Abusing ACLs/ACEs
- Kerberoasting
- AS-REP Roasting
- Abuse DnsAdmins (...)
- Password in AD User comment
- Password Spraying
- DCSync (...)
- Silver Ticket (...)
- Golden Ticket (...)
- Pass-the-Hash (...)
- Pass-the-Ticket (...)
- SMB Signing Disabled
- Bad WinRM permission
- Anonymous LDAP query
- Public SMB Share
- Unconstrained delegation

# References
