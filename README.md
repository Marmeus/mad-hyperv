**Discord:** [![](https://dcbadge.vercel.app/api/server/D5QTtWEwxZ)](https://discord.gg/D5QTtWEwxZ) -> Ping me if you need help setting up the environment or add new features.


# 1. Capsulecorp AD Pentest (Hyper-v)

The Capsulecorp Pentest is a small virtual network managed by Vagrant and Ansible on Hyper-V. It contains four Windows virtual machines configured with various vulnerable services. This project can be used to learn network [Active Directory penetration testing](https://the-pentesting-guide.marmeus.com/?q=Active+Directory), test Command And Control and develop software for future Active directory Audits.

This project took inspiration from the [Royce](https://twitter.com/r3dy__)'s repo [capsulecorp-pentest](https://github.com/R3dy/capsulecorp-pentest), and wanted to adapt it to an Active Directory environment using the power of Windows Hyper-V.

## Why is this cool?
Nowadays, there is no free platform where you interact with a vulnerable Activery Directory environment unless you have a beefy computer with a huge amount of RAM and CPU. Thankfully, Hyper-V solves all these problems allowing you to have an AD environment consuming very few resources.

![Virtual Machines](Images/image-20230331183304134.png)

![Resources](Images/image-20230331183121508.png)

Furthermore, I created a [small hacking path](./WRITEUP.md) to become Domain Admin in this environment in several ways, starting as a local user named "auditor".

# Requirements

- A Windows system with at least 8GB of RAM and Windows Hyper-V capabilities.

# Active Directory Vulnerabilities
- Vulnerable Service

- Unconstrained delegation

- Constrained delegation

- Abusing ACLs/ACEs

- Kerberoasting

- AS-REP Roasting

- Abuse DnsAdmins

- Password in an AD User comment

- Password Spraying

- DCSync

- Silver Ticket

- Golden Ticket 

- Pass-the-Hash 

- Pass-the-Ticket

- SMB Signing Disabled

- Bad WinRM permission

- Anonymous LDAP query

- Public SMB Share

# Installation

The installation process can be followed in the [INSTALLATION](./INSTALLATION.md) file.

# References

- [Original Repo](https://github.com/R3dy/capsulecorp-pentest/tree/master/roles)
- [The Pentesting Guide](https://the-pentesting-guide.marmeus.com/)
