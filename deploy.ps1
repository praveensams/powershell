[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri https://github.com/praveensams/srav/archive/master.zip -OutFile C:\inetpub\wwwroot\sam_new.zip
$new=( Get-FileHash -Path C:\inetpub\wwwroot\sam_new.zip ).hash

if ( Test-Path -Path C:\inetpub\wwwroot\srav-master )
    {
    Remove-Item -Force C:\inetpub\wwwroot\srav-master -Recurse
    }

if ( Test-Path -path C:\inetpub\wwwroot\sam_old.zip )
    {
    $old=( Get-FileHash -Path C:\inetpub\wwwroot\sam_old.zip ).hash
    if ( $new -ne $old )
        {
        rm -Path C:\inetpub\wwwroot\sam_old.zip -Force
        Rename-Item C:\inetpub\wwwroot\sam_new.zip C:\inetpub\wwwroot\sam_old.zip
        Expand-Archive -LiteralPath C:\inetpub\wwwroot\sam_old.zip -DestinationPath C:\inetpub\wwwroot\
        Copy-Item C:\inetpub\wwwroot\srav-master\index.html C:\inetpub\wwwroot\
        echo "Date of deployment $(get-date) `nChange in Hash value `nold_hash=$old `nnew_nash=$new `nCode deployed" > C:\logs_deploy
        }
    else
        {
        echo "Date of deployment $(get-date) `nNo change in code" > c:\logs_deploy
        }
    }
else
    {
      Rename-Item C:\inetpub\wwwroot\sam_new.zip C:\inetpub\wwwroot\sam_old.zip
        Expand-Archive -LiteralPath C:\inetpub\wwwroot\sam_old.zip -DestinationPath C:\inetpub\wwwroot\
        Copy-Item C:\inetpub\wwwroot\srav-master\index.html C:\inetpub\wwwroot\
         echo "Date of deployment $(get-date) `nCode deployed  `nNew deployment" > C:\logs_deploy
       }
