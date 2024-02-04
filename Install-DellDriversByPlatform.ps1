<# 
.SYNOPSIS
    Installs Dell drivers from from folders based on model number

.DESCRIPTION 
    Installs Dell drivers for individual platforms based on model number.  Create a folder for each platform based on the results of "Get-WmiObject Win32_ComputerSystem | Select-Object -ExpandProperty Model"
 
.NOTES 
    Created with Bing Copilot

.LINK 
    https://www.dell.com/support/home
#>

# Get the computer's model number
$model = Get-WmiObject Win32_ComputerSystem | Select-Object -ExpandProperty Model

# Define the path to the driver folder
$driverFolder = "C:\Drivers\$model"

# Install drivers silently
Get-ChildItem -Path $driverFolder -Filter "*.exe" | ForEach-Object {
    Start-Process -FilePath $_.FullName -ArgumentList "/s" -Wait
}
