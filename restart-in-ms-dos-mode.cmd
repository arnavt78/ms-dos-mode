@echo off

title Restart in MS-DOS Mode (Don't Close this Window!)

msg * "Please wait... running commands. Warning: Do not close the Command Prompt window!"

Powershell.exe -executionpolicy remotesigned -File  C:\Users\arnav\Desktop\ms-dos-mode.ps1