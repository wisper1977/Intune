

# Set Variables
$FolderPaths = @("$Env:userprofile\appdata\Local\Roblox")

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
