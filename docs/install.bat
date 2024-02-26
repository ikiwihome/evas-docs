@echo off
chcp 65001 > NUL 2>&1

pushd %~dp0

set "zip_file=..\env\env.zip"
set "destination=..\env"

if not exist "%destination%" mkdir "%destination%"
powershell Expand-Archive -Path "%zip_file%" -DestinationPath "%destination%" -Force

echo ******************python环境已准备完毕******************

popd