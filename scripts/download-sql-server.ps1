# http://stackoverflow.com/a/9949105
$ErrorActionPreference = "Stop";

$Source = "http://download.microsoft.com/download/E/A/E/EAE6F7FC-767A-4038-A954-49B8B05D04EB/ExpressAndTools%2064BIT/SQLEXPRWT_x64_ENU.exe";
$Destination = "C:\SQLEXPRWT_x64_ENU.exe";

if (!(Test-Path $Destination)) {
	Write-Output "Downloading Sql Server 2014 Express R2";
	# https://blog.jourdant.me/3-ways-to-download-files-with-powershell/
	# Wanted to use Start-BitsTransfer, but for some reason it needed special privileges
	(New-Object System.Net.WebClient).DownloadFile($Source, $Destination);
} else {
	Write-Output "Sql Server is already downloaded";
}
