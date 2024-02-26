@echo off

chcp 65001 > NUL 2>&1
pushd %~dp0
if exist "%cd%\python\" (
	rmdir /s /q %cd%\python
)

if exist "%cd%\miktex\" (
	rmdir /s /q %cd%\miktex
)

if exist "%cd%\perl\" (
	rmdir /s /q %cd%\perl
)
popd