$domain = "capsulecorp.local"
$password = "PassW0rd432!" | ConvertTo-SecureString -asPlainText -Force
$username = "$domain\goku" 
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
$newname = "tien"
Add-Computer -DomainName $domain -NewName $newname -Credential $credential