$TeamsInstalled = (Get-AppxPackage | Where-Object { $_.PackageFamilyName -eq "MSTeams_8wekyb3d8bbwe" }) -ne $null
 
if ($TeamsInstalled) {
  Write-Output "Microsoft Teams (PackageFamilyName: MSTeams_8wekyb3d8bbwe) is installed."
} else {
  Write-Output "Microsoft Teams (PackageFamilyName: MSTeams_8wekyb3d8bbwe) is not installed."
}