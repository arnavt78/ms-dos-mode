Add-Type -AssemblyName PresentationFramework

# [System.Windows.MessageBox]::EnableVisualStyles()

$warning = [System.Windows.MessageBox]::Show("Are you sure you want to restart the system?", "Restart Confirmation", "YesNo", "Warning", "Yes")

if ($warning -eq "Yes") {
  Set-ItemProperty -Path "HKLM:\System\Setup" -Name "CmdLine" -Value "cmd.exe"
  Set-ItemProperty -Path "HKLM:\System\Setup" -Name "SystemSetupInProgress" -Value "1"
  Set-ItemProperty -Path "HKLM:\System\Setup" -Name "SetupType" -Value "2"
  Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableCursorSuppression" -Value "0"
  Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value "0"

  Write-Host "Windows is ready to restart!"
  Pause "Press any key to continue . . . "

  Restart-Computer
}