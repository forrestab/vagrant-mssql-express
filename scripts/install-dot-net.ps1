# http://stackoverflow.com/a/9949105
$ErrorActionPreference = "Stop";

Write-Output "Installing .NET Framework";
Import-Module ServerManager;
Install-WindowsFeature Net-Framework-Core;
