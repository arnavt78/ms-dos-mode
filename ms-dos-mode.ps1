Add-Type -AssemblyName PresentationFramework

# [System.Windows.MessageBox]::EnableVisualStyles()

Write-Host "Checking for elevation..."

if(!([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
  try {
    Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList "-File `"$($MyInvocation.MyCommand.Path)`"  `"$($MyInvocation.MyCommand.UnboundArguments)`""
  } catch {
    [System.Windows.MessageBox]::Show("This program requires administrative privileges. On the UAC prompt, press 'Yes'.", "Failed to get Administrative Privileges", "OK", "Error")
  }

  Exit
}

Write-Host "Successfully receieved administrator privileges!"

$about = [System.Windows.MessageBox]::Show("This program opens the command prompt upon booting. It runs before the login screen is displayed and before the Task Scheduler.`n`nHowever, this program can be very dangerous, as it modifies the Registry. It is recommended to try this in a virtual machine rather than a physical computer.`n`nTL;DR CONTINUE AT YOUR OWN RISK!!!", "About Restarting in MS-DOS Mode", "OKCancel", "Information", "Cancel")

if ($about -eq "OK") {
  $warning = [System.Windows.MessageBox]::Show("Are you sure you want to restart in MS-DOS mode?`n`nPlease save any unsaved work before accepting, as it will reboot the system.", "Confirmation", "YesNo", "Warning", "No")

  if ($warning -eq "Yes") {
    Set-ItemProperty -Path "HKLM:\System\Setup" -Name "CmdLine" -Value "cmd.exe"
    Set-ItemProperty -Path "HKLM:\System\Setup" -Name "SystemSetupInProgress" -Value "1"
    Set-ItemProperty -Path "HKLM:\System\Setup" -Name "SetupType" -Value "2"
    Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableCursorSuppression" -Value "0"
    Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value "0"
    # Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "VerboseStatus" -Value "1"

    Write-Host "Restarting your computer NOW!"
    Pause "Press any key to continue . . . "

    Restart-Computer
  }
}