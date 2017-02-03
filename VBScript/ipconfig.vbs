'' @author  Drew Chapin <drew@drewchapin.com>
'' @date    February 3rd, 2017
'' @license Public Domain

Dim WMI, Adapters, Adapter, Shell, i
Set WMI = GetObject("winmgmts:\\.\root\cimv2")
Set Adapters = WMI.ExecQuery("SELECT * FROM win32_networkadapterconfiguration WHERE ipenabled = true")
Set Shell = CreateObject("WScript.Shell")

If Not LCase(Right(WScript.FullName,12)) = "\cscript.exe" Then
	MsgBox "You must run this script with CScript.", vbExclamation, WScript.ScriptName
	WScript.Quit
End If

WScript.Echo WScript.ScriptName & " shows the configuration for all network adapters using WMI." & vbCrLf
WScript.Echo "PUBLIC DOMAIN NOTICE: " & vbCrLf & _
             "  This script is released in the Public Domain. You can freely copy," & vbCrLf & _
             "  redistribute, modify or do whatever the hell you want with it." & vbCrLf

For Each Adapter in Adapters
	If Not IsNull(Adapter.IPAddress) Then
		WScript.Echo Adapter.Description
		If Adapter.DHCPEnabled Then
			WScript.Echo "  DHCP Enabled...: Yes"
			WScript.Echo "  DHCP Server....: " & Adapter.DHCPServer
			WScript.Echo "  DHCP Lease.....: " & Adapter.DHCPLeaseObtained & " - " & Adapter.DHCPLeaseExpires
		Else
			WScript.Echo "  DHCP Enabled...: No"
		End If
		WScript.Echo "  Service Name...: " & Adapter.ServiceName
		WScript.Echo "  DNS Host Name..: " & Adapter.DNSHostName
		WScript.Echo "  DNS Domain.....: " & Adapter.DNSDomain
		For i = LBound(Adapter.DNSDomainSuffixSearchOrder) To UBound(Adapter.DNSDomainSuffixSearchOrder)
			If i = LBound(Adapter.DNSDomainSuffixSearchOrder) Then
				WScript.Echo "  Domain Suffix..: " & Adapter.DNSDomainSuffixSearchOrder(i)
			Else
				WScript.Echo "                   " & Adapter.DNSDomainSuffixSearchOrder(i)
			End If
		Next
		WScript.Echo "  MAC Address....: " & Adapter.MACAddress
		For i = LBound(Adapter.IPAddress) To UBound(Adapter.IPAddress)
			If i = LBound(Adapter.IPAddress) Then
				WScript.Echo "  IP Address.....: " & Adapter.IPAddress(i) & "/" & Adapter.IPSubnet(i)
			Else
				WScript.Echo "                   " & Adapter.IPAddress(i) & "/" & Adapter.IPSubnet(i)
			End If
		Next
		If Not IsNull(Adapter.DefaultIPGateway) Then
			For i = LBound(Adapter.DefaultIPGateway) To UBound(Adapter.DefaultIPGateway)
				If i = LBound(Adapter.DefaultIPGateway) Then
					WScript.Echo "  Default Gateway: " & Adapter.DefaultIPGateway(i)
				Else
					WScript.Echo "                   " & Adapter.DefaultIPGateway(i)
				End If
			Next
		End If
	End If
	WScript.Echo
Next