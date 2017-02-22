IF EXIST "C:\Program Files\Microsoft Office\Office15\EXCEL.EXE" SET COMMAND=C:\Program Files\Microsoft Office\Office15\EXCEL.EXE
IF EXIST "C:\Program Files\Microsoft Office\Office14\EXCEL.EXE" SET COMMAND=C:\Program Files\Microsoft Office\Office14\EXCEL.EXE
IF EXIST "C:\Program Files (x86)\Microsoft Office\Office15\EXCEL.EXE" SET COMMAND=C:\Program Files (x86)\Microsoft Office\Office15\EXCEL.EXE
IF EXIST "C:\Program Files (x86)\Microsoft Office\Office14\EXCEL.EXE" SET COMMAND=C:\Program Files (x86)\Microsoft Office\Office14\EXCEL.EXE

REG add "HKCR\Excel.Sheet.8\shell\OpenInNewWindow" /ve /t REG_SZ /d "Open In New Window" /f
REG add "HKCR\Excel.Sheet.8\shell\OpenInNewWindow\command" /ve /t REG_SZ /d "\"%COMMAND%\" \"%%1\"" /f
REG add "HKCR\Excel.Sheet.8\shell" /ve /t REG_SZ /d "OpenInNewWindow" /f

REG add "HKCR\Excel.Sheet.12\shell\OpenInNewWindow" /ve /t REG_SZ /d "Open In New Window" /f
REG add "HKCR\Excel.Sheet.12\shell\OpenInNewWindow\command" /ve /t REG_SZ /d "\"%COMMAND%\" \"%%1\"" /f
REG add "HKCR\Excel.Sheet.12\shell" /ve /t REG_SZ /d "OpenInNewWindow" /f

REG add "HKCR\Excel.SheetMacroEnabled.12\shell\OpenInNewWindow" /ve /t REG_SZ /d "Open In New Window" /f
REG add "HKCR\Excel.SheetMacroEnabled.12\shell\OpenInNewWindow\command" /ve /t REG_SZ /d "\"%COMMAND%\" \"%%1\"" /f
REG add "HKCR\Excel.SheetMacroEnabled.12\shell" /ve /t REG_SZ /d "OpenInNewWindow" /f

REG add "HKCR\Excel.SheetBinaryMacroEnabled.12\shell\OpenInNewWindow" /ve /t REG_SZ /d "Open In New Window" /f
REG add "HKCR\Excel.SheetBinaryMacroEnabled.12\shell\OpenInNewWindow\command" /ve /t REG_SZ /d "\"%COMMAND%\" \"%%1\"" /f
REG add "HKCR\Excel.SheetBinaryMacroEnabled.12\shell" /ve /t REG_SZ /d "OpenInNewWindow" /f

REG add "HKCR\Excel.Template\shell\OpenInNewWindow" /ve /t REG_SZ /d "Open In New Window" /f
REG add "HKCR\Excel.Template\shell\OpenInNewWindow\command" /ve /t REG_SZ /d "\"%COMMAND%\" \"%%1\"" /f
REG add "HKCR\Excel.Template\shell" /ve /t REG_SZ /d "OpenInNewWindow" /f
