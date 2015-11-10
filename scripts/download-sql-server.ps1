# http://stackoverflow.com/a/9949105
$ErrorActionPreference = "Stop"

$SourceUrl = "http://download.microsoft.com/download/E/A/E/EAE6F7FC-767A-4038-A954-49B8B05D04EB/ExpressAndTools%2064BIT/SQLEXPRWT_x64_ENU.exe"
$OutputFile = "C:\SQLEXPRWT_x64_ENU.exe"

if (!(test-path $OutputFile)) {
	echo "Downloading Sql Server 2014 Express R2"
	(new-object System.Net.WebClient).DownloadFile($SourceUrl, $OutputFile)
} else {
	echo "Sql Server 2014 is already downloaded"
}
