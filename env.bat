@echo off
rem Окно с инструментами проекта: Git, Node.js и SQLite.
set "TOOLS=%USERPROFILE%\tools"
set "PATH=%TOOLS%\git\cmd;%TOOLS%\node;%TOOLS%\sqlite;%PATH%"
chcp 65001 >nul
cd /d "%~dp0"
cmd /k
