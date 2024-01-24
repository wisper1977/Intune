<#
.Synopsis
Script to create file and/or folders

.DESCRIPTION
This script can be used to create one or multiple file and/or folders. It will check if the file and/or folder already exists before creating it.

.NOTES   
Name: Create-FileAndFolder.ps1
Created By: Peter Dodemont
Version: 1.1
DateUpdated: 12/03/2022

.LINK
https://peterdodemont.com/
#>

# Set Variables
$FolderPaths = @("$Env:userprofile\appdata\Local\steam")

# Check if folders exist, if not create them.
If ($FolderPaths){
    Try {
        ForEach ($FolderPath in $FolderPaths) {
            $FolderTest = Test-Path $FolderPath

            If (!($FolderTest)){
                Write-Host "Folder $FolderPath doesn't exist"
            }
            Else {
                Remove-item -LiteralPath $FolderPaths -Force -r
                Write-Host "Folder $FolderPath Deleted Successfully."
            }
        }
        Write-Host "All Folders Deleted Successfully."
    }
    Catch {
        $ErrorMsg = $_.Exception.Message
        Write-host "Error $ErrorMsg"
        Exit 1
    }
}
