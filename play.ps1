
$acctKey = ConvertTo-SecureString -String "DAAppNg0uJr6/nH6ko5eKlk62hs5zSOBvLTUo1CrvcZrDmZv6F2shWTXAFI2XdX/2E1TLQ2Du57oM2z5kOYgEQ==" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential -ArgumentList "Azure\tobedeletediag433", $acctKey
New-PSDrive -Name Z -PSProvider FileSystem -Root "\\tobedeletediag433.file.core.windows.net\codestorage" -Credential $credential -Persist

Start-Sleep -Seconds 2

dir z:\  > c:\inetpub\wwwroot\index.html

echo "hiii" >> c:\inetpub\wwwroot\index.html
