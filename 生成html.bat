chcp 65001
@echo off

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