Dim Text

Dim Network 
Set Network = CreateObject("WScript.Network")
Text = "Computer Name: " & vbCrLf & vbCrLf & vbTab & Network.ComputerName & vbCrLf & vbCrLf

Dim NetworkAdapterConfig 
Set NetworkAdapterConfig = GetObject("winmgmts:").InstancesOf("Win32_NetworkAdapterConfiguration")
Text = Text & "IP Address(es):" & vbCrLf & vbCrLf

Dim NIC
For Each NIC in NetworkAdapterConfig
    If NIC.IPEnabled Then
        If Left(NIC.IPAddress(0),4) <> "169." Then
            Text = Text & vbTab & NIC.IPAddress(0)
        End If
    End If
Next

MsgBox Text, vbInformation, "Computer Information"