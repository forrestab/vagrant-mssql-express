# http://stackoverflow.com/a/9949105
$ErrorActionPreference = "Stop";

$DatabaseScript = "C:\vagrant\database_creation.sql";
$DefaultValuesScript = "C:\vagrant\default_values.sql";

if (Test-Path $DatabaseScript) {
	Write-Output "Creating database";
	Invoke-Sqlcmd -InputFile $DatabaseScript;
}

if (Test-Path $DefaultValuesScript) {
	Write-Output "Populating tables";
	Invoke-Sqlcmd -InputFile $DefaultValuesScript;
}
