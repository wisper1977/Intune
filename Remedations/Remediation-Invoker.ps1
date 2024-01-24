# Specify the path to the directory where batch files are located
$batchFilesDirectory = "C:\Path\To\Batch\Files"

# Specify the invoker code to check for in the batch file
$invokerCode = "set_COMPAT_LAYER-RUNASINVOER"

# Get all batch files in the specified directory
$batchFiles = Get-ChildItem -Path $batchFilesDirectory -Filter "*.bat"

foreach ($batchFile in $batchFiles) {
    $fileContent = Get-Content -Path $batchFile.FullName -Raw

    # Check if the invoker code is present in the batch file content
    if ($fileContent -like "*$invokerCode*") {
        Write-Host "Batch file '$($batchFile.Name)' contains the invoker code. Deleting the file..."
        
        # Delete the batch file
        Remove-Item -Path $batchFile.FullName -Force
    }
}