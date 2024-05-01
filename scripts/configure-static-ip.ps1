param(
    [string]$IPAddress,
    [string]$InterfaceName
)

if (-not $IPAddress) {
    Write-Host "Please provide an IP address."
    exit
}

if (-not $InterfaceName) {
    Write-Host "Please provide an InterfaceName."
    exit
}

$ipBatContent = @"
netsh interface ipv4 set address name="$InterfaceName" static $IPAddress 255.255.255.0 10.10.10.1
netsh interface ipv4 set dns name="$InterfaceName" static 8.8.8.8
netsh interface ipv4 add dns name="$InterfaceName" 8.8.4.4 index=2
schtasks /delete /tn "FixIpScript" /f
"@

Set-Content -Path "C:\ip.bat" -Value $ipBatContent

# New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce" -Name "StaticIp" -Value "C:\ip.bat" -PropertyType "String" -Force

schtasks /create /tn "FixIpScript" /tr "C:\ip.bat" /sc onstart /ru System