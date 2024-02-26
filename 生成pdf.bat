chcp 65001
@echo off

if exist "%cd%\docs\_build\latex" (
    rmdir /s /q %cd%\docs\_build\latex
)

if exist "%cd%\docs\_build\pdf" (
    rmdir /s /q %cd%\docs\_build\pdf
)

REM 执行 make pdf 命令
echo 请稍等，pdf生成中.....
cmd /c %cd%\docs\make pdf> NUL 2>&1
echo pdf文件生成完毕，在docs\_build\pdf文件夹下

REM 使用资源管理器打开 pdf 文件夹
explorer "%cd%\docs\_build\pdf"

REM 使用默认工具打开pdf

for %%i in ("%cd%\docs\_build\pdf\*.pdf") do (
    start "" "%cd%\docs\_build\pdf\%%~nxi"
)
