$files = @(
    "C:\ProgramData\chocolatey\choco.exe"
)
 
$badcount = 0
foreach ($file in $files) {
    if (Test-Path $file) {
        Write-Host ("{0} was found" -f $file)
    }
    else {
        Write-Host ("{0} was not found" -f $file)
        $badcount++
    }
}
 
If ($badcount -gt 0) {
    Write-Host ("choco.exe not detected...")
    exit 1
}
else {
    Write-Host ("choco.exe detected...")
    exit 0
}