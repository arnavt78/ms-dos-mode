@echo off

title Restart in Windows Mode (Don't Close this Window!)

msg * "Please wait... running commands. Warning: Do not close the Command Prompt window!"

Powershell.exe -executionpolicy remotesigned -File  .\windows-mode.ps1
