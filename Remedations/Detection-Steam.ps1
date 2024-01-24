<#
.Synopsis
Intune Proactive Remediations script to detect if folders exist.

.DESCRIPTION
This script can be used in Intune proactive remediations to detect if one or multiple folders exist, if they don't remediation is kicked off.

.NOTES   
Name: ProactiveRem-Path-Detection.ps1
Created By: Peter Dodemont
Version: 1.1
DateUpdated: 12/03/2022

.LINK
https://peterdodemont.com/
#>

# Set Variables
$Paths = @("$Env:userprofile\appdata\Local\steam")

# Check if paths exist, if not trigger remediation.
Try {
    ForEach ($Path in $Paths) {
        $PathTest = Test-Path $Path
        If (!($PathTest)){
            Write-host "$Path Not Found"
            Exit 0
        }
    }
    Write-host "Path Found"
    Exit 1
}
Catch {
    $ErrorMsg = $_.Exception.Message
    Write-host "Error $ErrorMsg"
    Exit 1
}