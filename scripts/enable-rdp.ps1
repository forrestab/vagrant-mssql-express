# http://stackoverflow.com/a/9949105
$ErrorActionPreference = "Stop";

Write-Output "Enable Rdp";
# http://networkerslog.blogspot.com.br/2013/09/how-to-enable-remote-desktop-remotely.html
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections" -Value 0;
