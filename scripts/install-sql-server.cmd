@echo off

echo Installing SQL Server 2014 Express R2, it will take a while...
C:\SQLEXPRWT_x64_ENU.exe /Q
C:\Windows\SysWOW64\SQLEXPRWT_x64_ENU\Setup.exe /Q /Action=install /INDICATEPROGRESS /INSTANCENAME="SQLEXPRESS" /INSTANCEID="SQLExpress" /IAcceptSQLServerLicenseTerms /FEATURES=SQL,Tools /TCPENABLED=1 /SECURITYMODE="SQL" /SAPWD="#SAPassword!"
echo Done!

echo Disabling firewall
netsh advfirewall set allprofiles state off
