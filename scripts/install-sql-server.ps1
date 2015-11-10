# http://stackoverflow.com/a/9949105
$ErrorActionPreference = "Stop"
	
# http://stackoverflow.com/questions/3919798/how-to-check-if-a-cmdlet-exists-in-powershell-at-runtime-via-script
if (-Not ([bool](Get-Command -Name "Invoke-Sqlcmd" -ErrorAction SilentlyContinue))) {
	echo "Unpacking Sql Server"
	# http://www.sqltechnet.com/2013/05/powershell-script-to-install-sql-server.html
	Start-Process "C:\SQLEXPRWT_x64_ENU.exe" -ArgumentList "/q" -Wait -ErrorAction Stop -WindowStyle Hidden
	
	echo "Installing Sql Server"
	Start-Process "C:\Windows\SysWOW64\SQLEXPRWT_x64_ENU\Setup.exe" -ArgumentList '/q /Action=install /IndicateProgress /InstanceName="SQLEXPRESS" /InstanceId="SQLExpress" /IAcceptSQLServerLicenseTerms /Features=SQL,Tools /TcpEnabled=1 /SecurityMode="SQL" /SAPWD="#SAPassword!"' -Wait -ErrorAction Stop -WindowStyle Hidden
}

echo "Disabling firewall"
# http://azuregeek.com/how-to-disable-windows-firewall-with-powershell-in-windows-server-2012
Get-NetFirewallProfile | Set-NetFirewallProfile -Enabled False
