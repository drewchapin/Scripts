Dim Network 
Set Network = CreateObject("WScript.Network")

Dim NetworkAdapterConfig 
Set NetworkAdapterConfig = GetObject("winmgmts:").InstancesOf("Win32_NetworkAdapterConfiguration")

Dim Text
Text = "Computer Name: " & vbCrLf & vbCrLf & vbTab & Network.ComputerName & vbTab & vbTab & vbCrLf & vbCrLf
Text = Text & "IP Address(es):" & vbCrLf & vbCrLf

Dim NIC
For Each NIC in NetworkAdapterConfig
    If NIC.IPEnabled Then
        If Left(NIC.IPAddress(0),4) <> "169." Then
            Text = Text & vbTab & NIC.IPAddress(0) & vbTab & vbTab
        End If
    End If
Next

MsgBox Text, vbInformation, "Computer Information"