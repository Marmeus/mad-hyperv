$vmName = $Args[0]

If(!(test-path -PathType container tmp))
{
    New-Item -ItemType Directory -Path tmp
}

New-Item -ItemType File -Name tmp/$vmName