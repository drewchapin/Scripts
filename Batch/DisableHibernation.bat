@echo off

set /p pc=Computer Name/IP: 

psexec \\%pc% powercfg /change /monitor-timeout-ac 15
psexec \\%pc% powercfg /change /hibernate-timeout-ac 0
pause