@echo off
set /p host=Computer Name: 
set /p user=Username: 
net use Z: \\%host%\c$ /user:%user%
sc \\%host% stop spooler
Z:
cd windows\system32\spool\printers
del /f /q \\%host%\C$\WINNT\System32\Spool\PRINTERS\*.shd
del /f /q \\%host%\C$\WINNT\System32\Spool\PRINTERS\*.spl
sc \\%host% start spooler
net use Z: /delete