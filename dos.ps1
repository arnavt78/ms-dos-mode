# Check if script is running as admin
# If not, run the same script as admin
# Needed as editing regedit needs admin role
if(!([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
  Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList "-File `"$($MyInvocation.MyCommand.Path)`"  `"$($MyInvocation.MyCommand.UnboundArguments)`""
  Exit
}

# Disclaimer
Write-Host "DANGER: This software is still in BETA state. As it edits the Registry, any bugs in this program can be FATAL to your device! Use with caution, preferably in a restorable virtual machine."

# Confirm that the user wants to edit regedit
$confirm = Read-Host "Do you want to continue? (y/N)"
if ($confirm -eq "y" -or $confirm -eq "Y") {
  Write-Host "`nEditing the Registry...`n"
  Start-Sleep -Seconds 1
} else {
  Write-Host "`nStopping...`n"
  Start-Sleep -Seconds 2

  Exit
}

Set-ItemProperty -Path "HKLM:\System\Setup" -Name "CmdLine" -Value "cmd.exe"
Set-ItemProperty -Path "HKLM:\System\Setup" -Name "SystemSetupInProgress" -Value "1"
Set-ItemProperty -Path "HKLM:\System\Setup" -Name "SetupType" -Value "2"
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableCursorSuppression" -Value "0"
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value "0"

# Confirm that the user wants to reboot
$confirmRestart = Read-Host "You MUST restart Windows to save the changes and enter 'MS-DOS' mode. Make sure to save your work. Restart now? (y/N)"
if ($confirmRestart -eq "y" -or $confirmRestart -eq "Y") {
  Write-Host "Restarting...`n"
  Start-Sleep -Seconds 2

  Restart-Computer
} else {
  Write-Host "Please restart manually as soon as possible!`n"
  Start-Sleep -Seconds 2

  Exit
}