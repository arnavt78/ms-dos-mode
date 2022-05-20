Add-Type -AssemblyName PresentationFramework

# [System.Windows.MessageBox]::EnableVisualStyles()

$about = [System.Windows.MessageBox]::Show("Restarting in MS-DOS mode edits the Registry to allow the Command Prompt for showing when you log in to the system, instead of the Explorer.`n`nWhen in the Command Prompt, enter the 'win' command to reboot back into Windows. Again, this edits the Registry.`n`nIf you would like to cancel this operation, please click 'Cancel'. Otherwise, click 'OK'.", "About Restarting in MS-DOS Mode", "OKCancel", "Information", "Cancel")

if ($about -eq "OK") {
  $warning = [System.Windows.MessageBox]::Show("Are you sure you want to restart in MS-DOS mode?`n`nPlease save any unsaved work before accepting, as it will reboot the system.", "Confirmation", "YesNo", "Warning", "No")

  if ($warning -eq "Yes") {
    Set-Itemproperty -path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name 'Shell' -value "cmd.exe"

    Restart-Computer
  }
}