#Locate installation folder
    $localAppData = "$($env:LOCALAPPDATA)\Microsoft\Teams"
    $programData = "$($env:ProgramData)\$($env:USERNAME)\Microsoft\Teams"
    If (Test-Path "$($localAppData)\Current\Teams.exe") 
    {
      unInstallTeams($localAppData)

    }
    elseif (Test-Path "$($programData)\Current\Teams.exe") {
      unInstallTeams($programData)
    }
    else {
      Write-Warning  "Teams installation not found"
    }