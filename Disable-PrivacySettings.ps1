#Registry Key Folder Creation
New-Item -Path Registry::'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OOBE' -Value ""
#Registry Entry Creation
Set-ItemProperty -Path Registry::'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OOBE' -Name DisablePrivacyExperience -Type "DWord" -Value "1"

