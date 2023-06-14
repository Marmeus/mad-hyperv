dism /online /set-edition:ServerStandard /productkey:VDYBN-27WPP-V4HQT-9VMD4-VMK7H /accepteula /NoRestart
cscript //nologo c:\windows\system32\slmgr.vbs /upk
cscript //nologo c:\windows\system32\slmgr.vbs /ipk VDYBN-27WPP-V4HQT-9VMD4-VMK7H
cscript //nologo c:\windows\system32\slmgr.vbs /skms 192.168.56.2:1688
cscript //nologo c:\windows\system32\slmgr.vbs /ato