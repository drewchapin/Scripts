reg add "HKLM\Software\Policies\Microsoft\Windows NT\Printers" ^
    /v RegisterSpoolerRemoteRpcEndPoint ^
    /t REG_DWORD ^
    /d 0x1 ^
	/f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" ^
    /v "ForceGuest" ^
    /t REG_DWORD ^
    /d 0x0 ^
	/f
gpupdate
net stop spooler
net start spooler
