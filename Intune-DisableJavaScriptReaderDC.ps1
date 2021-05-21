$Path = "HKLM\SOFTWARE\WOW6432Node\Policies\Adobe\Acrobat Reader\DC\FeatureLockdown"
$Name = "bDisableJavaScript"
$value = "1"
If (!(Test-Path $Path))
 {
    New-Item -Path $Path -Force | Out-Null
    New-ItemProperty -Path $Path -Name $Name -Value $value -PropertyType DWORD -Force | Out-Null
}
  ELSE
{
    New-ItemProperty -Path $Path -Name $Name -Value $value -PropertyType DWORD -Force | Out-Null
}