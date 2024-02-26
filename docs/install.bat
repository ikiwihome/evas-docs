@echo off
set "zip_file=..\env\env.zip"
set "destination=..\env"

if not exist "%destination%" mkdir "%destination%"
powershell Expand-Archive -Path "%zip_file%" -DestinationPath "%destination%"

echo ******************python环境已准备完毕******************

pause