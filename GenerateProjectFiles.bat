@echo off
REM Run Premake5 to generate Visual Studio 2022 solution
REM Adjust the path to premake5.exe if needed

set PREMAKE_PATH=Vendor\Premake\premake5.exe

if not exist "%PREMAKE_PATH%" (
    echo Could not find premake5.exe at %PREMAKE_PATH%
    pause
    exit /b 1
)

"%PREMAKE_PATH%" vs2022

echo.
echo Solution and project files generated!
pause
