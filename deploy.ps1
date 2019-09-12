### ## KB[AP]: Runs on AppVeyor Build Agent Virual Machine
#$env:APPVEYOR_PROJECT_NAME = "LenderPortal"
#$env:RBS_DLMAS_RDSQLCI_STATUS = "Enabled"
#$env:RBS_DEPLOYMENT_PROJECT_DIRECTORY = "C:\Users\smercier\Documents\dev\LenderPortal\Database"
#$env:RBS_DLMAS_RDSQLCI_USER_NAME = "fmlp-dev"
#$env:RBS_DLMAS_RDSQLCI_USER_TOKEN = "eyJQcm92aWRlciI6eyJNb2RlIjoiQ0JDIiwiVHlwZSI6IlN5c3RlbS5TZWN1cml0eS5DcnlwdG9ncmFwaHkuQWVzQ3J5cHRvU2VydmljZVByb3ZpZGVyIiwiS2V5IjoiNUFUaXA0NHNidkRhbmdyM2twRGdDa250cXRncVZORm9aaXN4 RldVam5VND0iLCJJViI6InpZUUJCeUR4N1YxQ3ByMWR5OWZTamc9PSIsIkJsb2NrU2l6ZSI6MTI4LCJQYWRkaW5nIjoiUEtDUzciLCJGZWVkYmFja1NpemUiOjgsIlNhbHQiOiJUR1Z1WkdWeVVHOXlkR0ZzIiwiS2V5U2l6ZSI6MjU2 fSwiRW5jb2RpbmciOiJEZWZhdWx0IiwiRGF0YSI6InI4ZlhVbTVFREpwNEFWT01GS1h3ckE9PSIsIkNlcnRpZmljYXRlIjpudWxsfQ=="
#$env:RBS_DLMAS_RDSQLCI_MSSQL_DBNAME = "LenderPortal_SM"
#$env:RBS_DLMAS_RDSQLCI_MSSQL_SERVER = "EC2AMAZ-PS999CD"

# put this value to false before pushing to dev

Get-ChildItem @("env:APPVEYOR_*"; "env:APPLICATION_*"; "env:ARTIFACT_*"; "env:VERACODE_*"; "env:AVVM_*"; "env:RKPT_*"; "env:RBS_*"; "env:FNMA_*") | Sort-Object Name

						
Write-Host ""
Write-Host "========================================================"
Write-Host "CI Automation     [2]: SQLCI Pre Migration - Process Started." -back blue -fore white
Write-Host "SqlCI Release Status : $($PreMigrationItem.Status)"
Write-Host "Deployment Folder    : $($env:RBS_DEPLOYMENT_SCRIPT_FOLDER)"
Write-Host "Deployment Script    : $($PreMigrationItem.Script)"
Write-Host "--------------------------------------------------------"
