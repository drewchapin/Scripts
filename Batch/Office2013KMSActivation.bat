@echo off
if exist "C:\Program Files (x86)\Microsoft Office\Office15" (
	cscript "C:\Program Files (x86)\Microsoft Office\Office15\ospp.vbs" /inpkey:YC7DK-G2NP3-2QQC3-J6H88-GVGXT
	cscript "C:\Program Files (x86)\Microsoft Office\Office15\ospp.vbs" /act
	goto end
)
if exist "C:\Program Files\Microsoft Office\Office15" (
	cscript "C:\Program Files\Microsoft Office\Office15\ospp.vbs" /inpkey:YC7DK-G2NP3-2QQC3-J6H88-GVGXT
	cscript "C:\Program Files\Microsoft Office\Office15\ospp.vbs" /act
	goto end
)

echo Error: Office 2013 Program Files directory not found.

:end
pause
