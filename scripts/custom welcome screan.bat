@echo off
color a
cls

echo Please enter a custom welcome message or error message:
set /p message=

echo How do you want the message to be displayed?
echo 1. Batch file-style prompt
echo 2. Friendly error message

set /p display_option=Enter your choice (1 or 2):

if "%display_option%"=="1" (
    echo Generating startup script...

    REM Here we create the startup script file
    set file=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\startup_script.bat
    echo @echo off > %file%
    echo color a >> %file%
    echo cls >> %file%
    echo echo %message% >> %file%
    echo pause >> %file%

    echo Startup script generated successfully and saved to %file%
) else if "%display_option%"=="2" (
    echo Generating startup script...

    REM Here we create the VBS file
    set file=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\startup_script.vbs
    echo msgbox "%message%",16,"Error" > %file%

    echo VBS file generated successfully and saved to %file%
) else (
    echo Invalid option. Please enter 1 or 2.
    goto end
)

echo Do you want to delete the previously generated file (if it exists)?
echo 1. Yes
echo 2. No

set /p delete_option=Enter your choice (1 or 2):

if "%delete_option%"=="1" (
    REM Here we delete the previously generated file if it exists
    if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\startup_script.bat" (
        del "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\startup_script.bat"
        echo Previously generated file deleted successfully.
    ) else if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\startup_script.vbs" (
        del "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\startup_script.vbs"
        echo Previously generated file deleted successfully.
    ) else (
        echo No previously generated file found.
    )
)

:end
pause
