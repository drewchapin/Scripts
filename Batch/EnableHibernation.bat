@echo off

set /p pc=Computer Name/IP: 
set /p mt=Monitor Timeout: 
set /p ht=Hibernate Timeout: 

psexec \\%pc% powercfg /change /monitor-timeout-ac %mt%
psexec \\%pc% powercfg /change /hibernate-timeout-ac %ht%
pause