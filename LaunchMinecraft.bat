@echo off

if not exist "%CD%/bin" goto DOWNLOAD
if not exist "%CD%/data" goto DOWNLOAD
if not exist "%CD%/data/.minecraft" goto DOWNLOAD
if not exist "%CD%/bin/Minecraft.exe" goto DOWNLOAD

goto LAUNCH

:DOWNLOAD
if not exist "%CD%/bin" (
	color 04
	echo Files not found, downloading...
	mkdir "./bin"
	mkdir "./data"
	mkdir "./data/.minecraft"
	powershell -Command "Invoke-WebRequest https://launcher.mojang.com/download/Minecraft.exe -OutFile %CD%/bin/Minecraft.exe"
	goto LAUNCH
) 

:LAUNCH
color 02
start "" "%CD%/bin/Minecraft.exe" --workDir "%CD%/data/.minecraft"
echo Launching minecraft...
timeout /t 3 /nobreak > nul

