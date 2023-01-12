@echo off
call "%~dp0\UVtools_win-x64_v3.6.0.msi" /passive
@echo off 
Setlocal enabledelayedexpansion 
for /f "skip=1 delims=: tokens=1,*" %%i in ('REG  QUERY "HKEY_CURRENT_USER\SOFTWARE\UVtools" /v "InstallDir"') do ( 
   set str=%%i
   set var=%%j
   set "var=!var:"=!"
   if not "!var:~-1!"=="=" set value="!str:~-1!:!var!"
) 
echo %value%
if not exist "%value%format"
	mkdir ""%value%format""

copy "%~dp0\format\setting.ini" "%value:"=%format"

if "%errorlevel%" == "0" (
	echo copy successfully
) else (
	echo copy failed
)
pause