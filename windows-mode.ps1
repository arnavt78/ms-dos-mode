Add-Type -AssemblyName PresentationFramework

# [System.Windows.MessageBox]::EnableVisualStyles()

$about = [System.Windows.MessageBox]::Show("Restarting in Windows mode edits the Registry to allow the Explorer for showing when you log in to the system, instead of the Command Prompt.`n`nWhen in the Explorer, use the Win + X menu to get back into MS-DOS Mode. Again, this edits the Registry.`n`nIf you would like to cancel this operation, please click 'Cancel'. Otherwise, click 'OK'.", "About Restarting in Windows Mode", "OKCancel", "Information", "Cancel")

if ($about -eq "OK") {
  $warning = [System.Windows.MessageBox]::Show("Are you sure you want to restart in Windows mode?`n`nPlease save any unsaved work before accepting, as it will reboot the system.", "Confirmation", "YesNo", "Warning", "No")

  if ($warning -eq "Yes") {
    Set-Itemproperty -path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name 'Shell' -value "explorer.exe"

    Restart-Computer
  }
}