# TODO

# General
- [X] Static IPs
- [ ] Create a confi.json with all the repited data like domain admin credentials
- [X] Install Vuln-AD-plus -> The problem was on the script :D
  - [ ] Script Output into a file
  - [ ] Make it into yml files
- [X] Disable Real Time monitoring in all the machines
  - [X] Disable cloud-delivered protection
  - [X] Disable sample submissio
- [ ] Install spanish keyboard

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

# Workstation - Vulnerable service

- [X] Create W10 WST
  - [X] Install vulnerable a service
- [X] Install virtual studio code -> Too much time
- [X] Install hacking tools
- [X] Allow Non Admin users to restart the machine
- [X] Make vuln_svc sysadmin at MSSQL service
