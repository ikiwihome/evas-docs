chcp 65001
@echo off
setlocal
pushd %~dp0

set PARENT_DIR=%~dp0..
set PATH=%PARENT_DIR%\env\miktex\texmfs\install\miktex\bin\x64;%PARENT_DIR%\env\perl\bin;%PARENT_DIR%\env\python;%PATH%

REM Command file for Sphinx documentation

if "%SPHINXBUILD%" == "" (
	set SPHINXBUILD=python -m sphinx build
)
set SOURCEDIR=source
set BUILDDIR=_build

if "%1" == "" goto all
if "%1" == "pdf" goto pdf
if "%1" == "all" goto all
if "%1" == "clean" goto clean

%SPHINXBUILD% >NUL 2>NUL
if errorlevel 9009 (
	echo.
	echo.The 'sphinx-build' command was not found. Make sure you have Sphinx
	echo.installed, then set the SPHINXBUILD environment variable to point
	echo.to the full path of the 'sphinx-build' executable. Alternatively you
	echo.may add the Sphinx directory to PATH.
	echo.
	echo.If you don't have Sphinx installed, grab it from
	echo.http://sphinx-doc.org/
	exit /b 1
)

%SPHINXBUILD% -M %1 %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O% --keep-going
goto end

:pdf
%SPHINXBUILD% -M latex %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O% --keep-going

cd %BUILDDIR%\latex
echo PDF 构建中，请稍等
cmd /c latexmk -r latexmkrc -pdf -f -dvi- -ps- -interaction=nonstopmode -g -quiet -dependents- -nodependents -rules- -rc-report- -dir-report- -outdir=..\pdf
echo PDF 文件保存在 _build\pdf 目录
goto end

:all
%SPHINXBUILD% -M html %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O% --keep-going
goto pdf

:clean
if exist "%BUILDDIR%" (
    rmdir /s /q %BUILDDIR%
	echo 已清空 %BUILDDIR% 构建目录
) else (
    echo %BUILDDIR% 构建目录不存在，使用make命令构建
)
goto end

:help
%SPHINXBUILD% -M help %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%

:end
endlocal
popd
