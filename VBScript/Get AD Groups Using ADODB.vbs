Option Explicit
'On Error Resume Next

Const HKCU = &H80000001
Const HKLM = &H80000002
Const ForReading = 1
Const ForAppending = 8

Dim ADODBConnection, ADSystemInfo, Application, FileSystem, Network, Shell, User, Registry, RootDSE, Groups 
Set ADODBConnection = CreateObject("ADODB.Connection")
Set ADSystemInfo = CreateObject("ADSystemInfo")
Set Application = CreateObject("Shell.Application")
Set FileSystem = CreateObject("Scripting.FileSystemObject")
Set Network = CreateObject("WScript.Network")
Set Shell = CreateObject("WScript.Shell")
Set User = GetObject("LDAP://" & ADSystemInfo.UserName)
Set Registry = GetObject("winmgmts:\\.\root\default:StdRegProv")
Set RootDSE = GetObject("LDAP://RootDSE")
Set Groups = CreateObject("System.Collections.ArrayList")

ADODBConnection.Provider = "ADsDSOObject"
ADODBConnection.Open "Active Directory Provider"

Dim ADODBRecordSet 
Set ADODBRecordSet = ADODBConnection.Execute("<LDAP://" & RootDSE.Get("defaultNamingContext") & ">;(member:1.2.840.113556.1.4.1941:=" & ADSystemInfo.UserName & ");name;subtree")
Do While Not ADODBRecordSet.EOF
	If Groups.IndexOf(ADODBRecordSet.Fields("name").Value,0) = -1 Then: _
		Groups.Add ADODBRecordSet.Fields("name").Value
	ADODBRecordSet.MoveNext
Loop

Dim Group
For Each Group In Groups.ToArray
	If vbCancel = MsgBox(Group,vbOkCancel) Then: Exit For
Next