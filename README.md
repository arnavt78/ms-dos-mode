# MS-DOS Mode

MS-DOS mode bought back into Windows!

**DANGER:** This software is still in a beta state. As it edits the Registry, any bugs in this program can be fatal to your device! Use with caution, preferably in a restorable virtual machine.

This tool only currently supports Windows systems running at least PowerShell 2.0.

- Windows 11
- Windows 10
- Windows 8.x
- Windows 7

_(Windows Vista and below have not been tested.)_

## How to Use

Follow these steps to use the MS-DOS mode correctly!

### Rebooting into MS-DOS Mode

To reboot into MS-DOS mode from Windows, follow these steps:

1.  Copy the following files into your `%SYSTEMROOT%` (by default, this is `C:\Windows`).
    - `dos.cmd` (optional, but recommended)
    - `dos.ps1`
    - `reboot.cmd` (optional, but recommended)
    - `reboot.ps1`
    - `win.cmd` (optional, but recommended)
    - `win.ps1`
2.  Run the `dos.cmd` file by double-clicking it in Explorer, or running it in the command prompt.
3.  Read the disclaimer properly, and then press _y_ on both prompts.
4.  After restarting, a command prompt should appear!

### Rebooting back into MS-DOS Mode

**DANGER:** Do not run `shutdown -r -t 0` or any similar command while in MS-DOS mode, as it corrupts the system. Instead, run `reboot.cmd`.

To reboot MS-DOS mode back into MS-DOS mode if you need it, follow these steps:

1.  Assuming you know the location of `reboot.cmd`, run it from the command prompt by running that file in the respective directory.
2.  Confirm the prompts and let the system restart.
3.  After restarting, the command prompt should appear!

## Rebooting into Windows Mode

To reboot into Windows from MS-DOS mode, follow these steps:

1.  Assuming you know the location of `win.cmd`, run it from the command prompt by running that file in the respective directory.
2.  Confirm the prompts and let the system restart.
3.  After restarting, the Windows GUI should appear!
