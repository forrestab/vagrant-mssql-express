# http://stackoverflow.com/a/9949105
$ErrorActionPreference = "Stop";

Write-Output "Configuring Tcp port";
# http://technet.microsoft.com/en-us/library/dd206997(v=sql.105).aspx
[reflection.assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo");
[reflection.assembly]::LoadWithPartialName("Microsoft.SqlServer.SqlWmiManagement");
# http://www.dbi-services.com/index.php/blog/entry/sql-server-2012-configuring-your-tcp-port-via-powershell
$Smo = 'Microsoft.SqlServer.Management.Smo.';
$Wmi = New-Object($Smo + 'Wmi.ManagedComputer');
$Uri = "ManagedComputer[@Name='VAGRANT-2012-R2']/ ServerInstance[@Name='SQLEXPRESS']/ServerProtocol[@Name='Tcp']";
$Tcp = $Wmi.GetSmoObject($Uri);
$Wmi.GetSmoObject($Uri + "/IPAddress[@Name='IPAll']").IPAddressProperties[1].Value="1433";
$Tcp.alter();

Write-Output "Restarting service";
# Restart service so that configurations are applied
Restart-Service -f "SQL Server (SQLEXPRESS)";
