cd "C:\Program Files\Microsoft Office\Office16"
for /f %%x IN ('dir /b ..\root\Licenses16\ProPlus2019VL*.xrm-ms') DO ( cscript ospp.vbs /inslic:"..\root\Licenses16\%%x")
cscript.exe .\OSPP.VBS /inpkey:NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP
cscript.exe .\OSPP.VBS /sethst:10.10.10.2
cscript.exe .\OSPP.VBS /act