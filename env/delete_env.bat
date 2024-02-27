@echo off

chcp 65001 > NUL 2>&1
pushd %~dp0
if exist "%cd%\python\" (
	rmdir /s /q %cd%\python
)

if exist "%cd%\texlive\" (
	rmdir /s /q %cd%\texlive
)
popd