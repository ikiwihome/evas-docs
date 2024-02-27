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

if exist "%cd%\docs\_build\html" (
    rmdir /s /q %cd%\docs\_build\html
)

REM 执行 make html 命令
echo 请稍等，html生成中.....
cmd /c %cd%\docs\make html > NUL 2>&1
echo html文件生成完毕，在docs\_build\html文件夹下

REM 使用资源管理器打开 html 文件夹
explorer "%cd%\docs\_build\html"

REM 使用浏览器打开 index.html
start "" "%cd%\docs\_build\html\index.html"

popd