try {
    $appname = 'MSTeams';
    $output = 'Detected';
    $Newversion = [System.Version]'24165.1414.2987.41';
    $Currentversion = ((Get-AppxPackage -Name $appname -ErrorAction SilentlyContinue).version)

    if ($Currentversion.count -gt 1 ) {
        if ([System.Version]$Currentversion[0] -ge $Newversion) {
            return $output
        }
    }
    else {
        if ([System.Version]$Currentversion -ge $Newversion) {
            return $output
        }
    }
}

catch { exit }