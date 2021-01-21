#Registry Entry Creation
Set-ItemProperty -Path Registry::'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore' -Name AutoDownload -Type "DWord" -Value "4"
