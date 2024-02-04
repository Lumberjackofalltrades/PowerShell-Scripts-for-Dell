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

# Install drivers silently
Get-ChildItem -Path $driverFolder -Filter "*.exe" | ForEach-Object {
    Start-Process -FilePath $_.FullName -ArgumentList "/s" -Wait
}
