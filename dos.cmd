@echo off

@rem Change title
title MS-DOS Mode

@rem Execute Powershell script
@rem NOTE TO USER: You can modify the path at the end,
@rem but recommended to leave as is
powershell.exe -executionpolicy remotesigned -File %systemroot%\dos.ps1
