<#
.SYNOPSIS
  PowerShell script to bootstrap installations and configure applications for Intune
.DESCRIPTION
  The script is designed to bootstrap the installation of and set configuration for apps in Intune
.PARAMETER
  None
.INPUTS
  None
.OUTPUTS
  Transcript Log file stored in C:\Programdata\IntuneApps\<AppName>
.NOTES
  Version:        1.0
  Author:         Bernard Mah - Devicie
  Creation Date:  27/06/2024
  Purpose/Change: Initial script development
.EXAMPLE
  powershell.exe -noprofile -executionpolicy bypass -file .\AppInstaller.ps1
#>
# If we are running as a 32-bit process on an x64 system, re-launch as a 64-bit process
if ("$env:PROCESSOR_ARCHITEW6432" -ne "ARM64")
{
    if (Test-Path "$($env:WINDIR)\SysNative\WindowsPowerShell\v1.0\powershell.exe")
    {
& "$($env:WINDIR)\SysNative\WindowsPowerShell\v1.0\powershell.exe" -ExecutionPolicy bypass -NoProfile -File "$PSCommandPath"
        Exit $lastexitcode
    }
}
#Script Variables
$AppName = "Uninstall Teams Classic"
$AppDir = "$($env:ProgramData)\IntuneApps\$($AppName)"
$TagFile = "$($AppDir)\$($AppName).tag"
$Transscript = "C:\Temp\IntuneLogs\Install-$AppName"
$MSILog = "C:\Temp\IntuneLogs\Install-$AppName"
# Create log directory
if (-not (Test-Path $($AppDir)))
{
    Mkdir $($AppDir)
}
# Start logging
Start-Transcript $Transscript
# Install App
$Status = (Start-Process "$($PSScriptRoot)\teamsbootstrapper.exe" -ArgumentList '-u' -wait -PassThru).ExitCode
# Set Flag file for Intune Detection
if (($Status -eq 0) -or ($Status -eq 3010))
{
Set-Content -Path $TagFile -Value "Installed"
} else {
Write-Host "Install failed with error $($Status), check  $($MSILog) for more information"
}
Stop-Transcript
Exit $Status