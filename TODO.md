# TODO

- [ ] Static IPs
- [X] Unconstrained delegation (HTTP-> RADITZ)
  - [X]  Add scheduled tasks to perform a web request from gohan  to raditz -> It doesnt matter if you use SpoolSample 
    - [X] Mount a web site with domain authentication [web](https://blog.xpnsec.com/kerberos-attacks-part-1/)
    - [ ] Resolve odd behaviour: When a user authenticates againts the machinethe user's ticket doesn't appear on the unconstrained machine
    - [ ] Probar a eliminar el win_feature "web-server" del main de raditz.
- [ ] Constrained delegation (MSSL -> DC)
- [X] Disable Real Time monitoring in all the machines
  - [X] Disable cloud-delivered protection
  - [X} Disable sample submission
- [X] Install Vuln-AD-plus -> The problem was on the script :D
- [ ] Install hacking tools
- [X] Create W10 WST
  - [X] Install vulnerable a service
- [ ] Create a confi.json with all the repited data like domain admin credentials