<#
.SYNOPSIS
    Installs Dell drivers from an SMB file share based on the computer's model number.

.DESCRIPTION 
    This script installs Dell drivers for individual platforms based on the model number.
    Create a folder for each platform on the SMB file share, named after the model number.

.NOTES 
    Created with Bing Copilot

.LINK 
    https://www.dell.com/support/home
#>

# Get the computer's model number
$model = Get-WmiObject Win32_ComputerSystem | Select-Object -ExpandProperty Model

# Define the UNC path to the driver folder on the SMB share
$driverFolder = "\\server\share\Drivers\$model"

# Check if the driver folder exists
if (Test-Path $driverFolder) {
    # Install drivers silently
    Get-ChildItem -Path $driverFolder -Filter "*.exe" | ForEach-Object {
        Start-Process -FilePath $_.FullName -ArgumentList "/s" -Wait
    }
}
else {
    Write-Host "Driver folder for model '$model' not found. Please ensure the correct folder structure."
}
