# http://stackoverflow.com/a/9949105
$ErrorActionPreference = "Stop"
	
echo "Creating database"
Invoke-Sqlcmd -InputFile "C:\vagrant\Solution\database_creation.sql"
	
echo "Populating tables"
Invoke-Sqlcmd -InputFile "C:\vagrant\Solution\default_values.sql"
