# Even though the user should be running
# as NT AUTHORITY, check just in case
if(!([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
  Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList "-File `"$($MyInvocation.MyCommand.Path)`"  `"$($MyInvocation.MyCommand.UnboundArguments)`""
  Exit
}

# Confirm that the user wants to edit regedit
$confirm = Read-Host "Are you sure you want to edit the Registry (required to get back to Windows)? (y/N)"
if ($confirm -eq "y" -or $confirm -eq "Y") {
  Write-Host "`nEditing the Registry...`n"
  Start-Sleep -Seconds 1
} else {
  Write-Host "`nStopping...`n"
  Start-Sleep -Seconds 2

  Exit
}

Set-ItemProperty -Path "HKLM:\System\Setup" -Name "CmdLine" -Value ""
Set-ItemProperty -Path "HKLM:\System\Setup" -Name "SystemSetupInProgress" -Value "0"
Set-ItemProperty -Path "HKLM:\System\Setup" -Name "SetupType" -Value "0"
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableCursorSuppression" -Value "1"
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value "1"

# Confirm that the user wants to reboot
$confirmRestart = Read-Host "You MUST restart Windows to save the changes and enter 'Windows' mode. Restart now? (y/N)"
if ($confirmRestart -eq "y" -or $confirmRestart -eq "Y") {
  Write-Host "Restarting...`n"
  Start-Sleep -Seconds 2

  Restart-Computer
} else {
  Write-Host "Please restart manually as soon as possible!`n"
  Start-Sleep -Seconds 2

  Exit
}