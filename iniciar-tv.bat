@echo off
rem Abre la pantalla de DivoChat en el TV: Chrome en modo kiosco (pantalla completa, sin barras),
rem con el sonido de los videos permitido desde el inicio (sin tener que tocar la pantalla).
rem Para salir del modo kiosco: Alt+F4.
set "CHROME=C:\Program Files\Google\Chrome\Application\chrome.exe"
if not exist "%CHROME%" set "CHROME=C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
if not exist "%CHROME%" set "CHROME=%LOCALAPPDATA%\Google\Chrome\Application\chrome.exe"
set "PAGINA=%~dp0index.html"
set "PAGINA=%PAGINA:\=/%"
start "" "%CHROME%" --kiosk --autoplay-policy=no-user-gesture-required --no-first-run --disable-session-crashed-bubble "file:///%PAGINA%?autostart"
