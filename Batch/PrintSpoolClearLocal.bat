@echo off
net stop spooler
del /f /q "%WINDIR%\System32\spool\PRINTERS\*.shd"
del /f /q "%WINDIR%\System32\spool\PRINTERS\*.spl"
net start spooler
