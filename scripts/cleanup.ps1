If((test-path -PathType container tmp)) {
    Remove-Item -LiteralPath "tmp" -Force -Recurse
}

If ("NATSwitch" -in (Get-VMSwitch | Select-Object -ExpandProperty Name)) {
    Remove-VMSwitch -SwitchName "NATSwitch" -Force
}

If ("10.10.10.0/24" -in (Get-NetNAT | Select-Object -ExpandProperty InternalIPInterfaceAddressPrefix)) {
    Remove-NetNat -Confirm:$false -Name "NATSwitch"
}