function ProvisionTeams {
    param (
        [string]$ProvisionMode
    )

    # $msixPath = Join-Path -Path $PSScriptRoot -ChildPath "MSTeams-x64.msix"
    
    if ($ProvisionMode -eq "AllUsers") {
        # Assuming a specific argument or process for all users (adjust as needed)
        # Start-Process -FilePath ".\teamsbootstrapper.exe" -ArgumentList "-p -o `"$msixPath`"" -Wait -WindowStyle Hidden
        Start-Process -FilePath ".\teamsbootstrapper.exe" -ArgumentList "-p" -Wait -WindowStyle Hidden
    }
    elseif ($ProvisionMode -eq "CurrentUser") {
        # Assuming a specific argument or process for the current user (adjust as needed)
        # Start-Process -FilePath ".\teamsbootstrapper.exe" -ArgumentList "-p -o `"$msixPath`"" -Wait -WindowStyle Hidden
        Start-Process -FilePath ".\teamsbootstrapper.exe" -ArgumentList "-p" -Wait -WindowStyle Hidden
    }
    else {
        Write-Host "Invalid ProvisionMode specified. Use 'AllUsers' or 'CurrentUser'."
    }
}

# Provision for all users
ProvisionTeams -ProvisionMode "AllUsers"

# Provision for the current user
ProvisionTeams -ProvisionMode "CurrentUser"