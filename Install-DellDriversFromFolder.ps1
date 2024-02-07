<# 
.SYNOPSIS
    A Powershell script to silently install Dell drivers from a single folder.

.DESCRIPTION 
    Download the individual drivers from dell.com/support for a particular platform to use for offline install.  Installs drivers one at a time.

.NOTES 
    Created with Bing Copilot

.LINK 
    https://www.dell.com/support/home/en-us
  
#>

# Define the path to the driver folder
$driverFolder = "C:\Drivers"

# Import the required module
Import-Module Microsoft.PowerShell.Management

# Install drivers silently
try {
    Get-ChildItem -Path $driverFolder -Filter "*.exe" | ForEach-Object {
        Start-Process -FilePath $_.FullName -ArgumentList "/s" -Wait
    }
}
catch {
    Write-Host "An error occurred while installing drivers: $_"
}

# Check if the driver folder exists
if (-not (Test-Path $driverFolder)) {
    Write-Host "Driver folder not found: $driverFolder"
    return
}

