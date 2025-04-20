@echo off
REM Copying require files for working in virtual environment
cd require
copy "activate" "%~dp0.venv\Scripts"
copy "activate.bat" "%~dp0.venv\Scripts"
copy "activate.fish" "%~dp0.venv\Scripts"
copy "Activate.ps1" "%~dp0.venv\Scripts"
copy "deactivate.bat" "%~dp0.venv\Scripts"
