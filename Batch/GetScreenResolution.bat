@echo off
for /F "tokens=2* delims==" %%a in ('wmic desktopmonitor get screenwidth /value') do set screenwidth=%%a
for /F "tokens=2* delims==" %%a in ('wmic desktopmonitor get screenheight /value') do set screenheight=%%a
echo %screenwidth% x %screenheight%
pause