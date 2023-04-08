Add-Type -AssemblyName PresentationFramework

# [System.Windows.MessageBox]::EnableVisualStyles()

$warning = [System.Windows.MessageBox]::Show("Are you sure you want to restart in Windows mode?`n`nPlease save any unsaved work before accepting, as it will reboot the system.", "Confirmation", "YesNo", "Warning", "No")

if ($warning -eq "Yes") {
  Set-ItemProperty -Path "HKLM:\System\Setup" -Name "CmdLine" -Value ""
  Set-ItemProperty -Path "HKLM:\System\Setup" -Name "SystemSetupInProgress" -Value "0"
  Set-ItemProperty -Path "HKLM:\System\Setup" -Name "SetupType" -Value "0"
  Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableCursorSuppression" -Value "1"
  Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value "1"
  # Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "VerboseStatus" -Value "0"

  Write-Host "Windows is ready to restart!"
  Pause "Press any key to continue . . . "

  Restart-Computer
}