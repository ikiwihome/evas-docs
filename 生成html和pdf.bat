chcp 65001
@echo off

if exist "%cd%\docs\_build\html" (
    rmdir /s /q %cd%\docs\_build\html
)

if exist "%cd%\docs\_build\latex" (
    rmdir /s /q %cd%\docs\_build\latex
)

if exist "%cd%\docs\_build\pdf" (
    rmdir /s /q %cd%\docs\_build\pdf
)

REM 执行 make all 命令
echo 请稍等，html和pdf生成中.....
cmd /c %cd%\docs\make all > NUL 2>&1
echo html文件生成完毕，在docs\_build文件夹下

REM 使用资源管理器打开生成的文件夹
explorer "%cd%\docs\_build"