#Registry Entry Creation
Set-ItemProperty -Path Registry::'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WorkplaceJoin' -Name BlockAADWorkplaceJoin -Type "DWord" -Value "1"
