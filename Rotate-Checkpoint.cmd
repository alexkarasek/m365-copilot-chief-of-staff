@echo off
setlocal
cd /d "%~dp0"

echo Chief of Staff checkpoint rotation
echo.

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\Rotate-Checkpoint.ps1"
set "EXITCODE=%ERRORLEVEL%"

echo.
if not "%EXITCODE%"=="0" (
    echo Rotation failed. Review the error above.
) else (
    echo Rotation completed successfully.
)
echo.
pause
exit /b %EXITCODE%
