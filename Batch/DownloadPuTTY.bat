@echo off
ftp -i -s:"%~f0" & goto :EOF
open ftp.chiark.greenend.org.uk
anonymous
password
cd /users/sgtatham/putty-latest/x86/
bin
mget *
bye