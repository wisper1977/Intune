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
