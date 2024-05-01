$vmName = $Args[0]

if (Test-Path tmp/$vmName) {
    Get-VM $vmName | Get-VMNetworkAdapter | Connect-VMNetworkAdapter -SwitchName "NATSwitch"
}