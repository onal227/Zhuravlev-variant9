@echo off
setlocal
set "PROJECT_ROOT=%~dp0"
set "TOOLS=%USERPROFILE%\tools"
set "PATH=%TOOLS%\node;%TOOLS%\git\cmd;%TOOLS%\sqlite;%PATH%"
cd /d "%PROJECT_ROOT%"
if not exist "%TOOLS%\node\node.exe" (
  echo Не найден Node.js: %TOOLS%\node\node.exe
  pause
  exit /b 1
)
if not exist "%TOOLS%\nodered\node_modules\node-red\red.js" (
  echo Не найден Node-RED в %TOOLS%\nodered
  pause
  exit /b 1
)
"%TOOLS%\node\node.exe" "%TOOLS%\nodered\node_modules\node-red\red.js" -u "%PROJECT_ROOT%"
endlocal
