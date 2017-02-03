'Script to fix [Unspecified Error] when adding Favorites in Internet Explorer
'© Ramesh Srinivasan. Created on June 04 2008
'Based on the original solution from MS-MVP Jimmy Brush
'Website: http://www.winhelponline.com
'Fix the Integrity level of the relocated Favorites folder
'http://www.winhelponline.com/blog/unspecified-error-when-adding-a-link-to-favorites-in-windows-vista/

Const FAVORITES = &H6&

Set objShell = CreateObject("Shell.Application")
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFolder = objShell.Namespace(FAVORITES)
Set objFolderItem = objFolder.Self

strFavPath = objFolderItem.Path

If objFSO.FolderExists(strFavPath) Then
	strFavPath = chr(34) & strFavPath & chr(34)
	objShell.ShellExecute "CMD.EXE", "/K ICACLS " & _
	strFavPath & " /setintegritylevel (OI)(CI)low", "", "runas", 1
Else
	Msgbox "Destination folder " & strFavPath & " is not found."
End If

Set objShell = Nothing
Set FSO = Nothing


