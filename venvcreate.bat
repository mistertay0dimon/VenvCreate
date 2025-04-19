@echo off
setlocal
title Creating virtual environment...

REM Get current directory
for %%a in (.) do set "CURRENT_DIR=%%~fa"

REM Create directory for virtual environment
mkdir .venv
if not exist ".venv" (
    echo Error: Failed to create .venv directory.
    pause
    exit /b 1
)

cd .venv
mkdir Scripts
if not exist "Scripts" (
    echo Error: Failed to create Scripts directory.
    pause
    exit /b 1
)
cd..

REM Copying required files
if not exist "require" (
    echo Error: "require" directory not found.
    pause
    exit /b 1
)

cd require
copy "activate" "%CURRENT_DIR%\.venv\Scripts"
copy "activate.bat" "%CURRENT_DIR%\.venv\Scripts"
copy "activate.fish" "%CURRENT_DIR%\.venv\Scripts"
copy "Activate.ps1" "%CURRENT_DIR%\.venv\Scripts"
copy "deactivate.bat" "%CURRENT_DIR%\.venv\Scripts"
if not exist "%CURRENT_DIR%\.venv\Scripts\activate.bat" (
    echo Error: Failed to copy required files.
    pause
    exit /b 1
)
cd..

REM Test or no
title Test this?
set /p command="Do you want to test this? [y/n]: "
if /i "%command%"=="y" (
    title Activating environment...
    set VIRTUAL_ENV_PATH=.venv
    call .venv\Scripts\activate
    if "%ERRORLEVEL%"=="0" (
        cmd
    ) else (
        echo Error: Failed to activate virtual environment.
        pause
    )
) else if /i "%command%"=="n" (
    echo You can test this:
    echo set VIRTUAL_ENV_PATH=.venv
    echo call .venv\Scripts\activate
    echo cmd
    pause
    exit
) else (
    echo Enter 'y' or 'n'
    pause
    exit
)

endlocal
