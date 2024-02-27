@echo off
cls
chcp 65001 > NUL 2>&1

pushd %~dp0

set /a ENV_STATUS = 0

if exist "%cd%\env\python\" (
	set /a ENV_STATUS+=1
)

if exist "%cd%\env\texlive\" (
	set /a ENV_STATUS+=1
)

if %ENV_STATUS% lss 2 (
	echo 运行环境不存在，第一次需要解压运行环境，正在解压中...
	cmd /c %cd%\env\delete_env.bat
	cmd /c %cd%\docs\install.bat
	echo 运行环境准备完毕
)

if exist "%cd%\docs\_build\latex" (
	rmdir /s /q %cd%\docs\_build\latex
)

if exist "%cd%\docs\_build\pdf" (
    rmdir /s /q %cd%\docs\_build\pdf
)

REM 执行 make pdf 命令
echo 请稍等，pdf生成中.....
cmd /c %cd%\docs\make pdf
echo pdf文件生成完毕，在docs\_build\pdf文件夹下

REM 使用资源管理器打开 pdf 文件夹
explorer "%cd%\docs\_build\pdf"

REM 使用默认工具打开pdf

for %%i in ("%cd%\docs\_build\pdf\*.pdf") do (
    start "" "%cd%\docs\_build\pdf\%%~nxi"
)

popd