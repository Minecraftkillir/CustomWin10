@echo off

REM Check if the current user is an administrator
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo This script must be run as an administrator. Exiting...
    PAUSE
    EXIT /B 1
)

REM Disable Telemetry using the registry
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f

echo Windows telemetry has been disabled.
PAUSE
