Set WshNetwork = WScript.CreateObject("WScript.Network")
Set oPrinters = WshNetwork.EnumPrinterConnections

For i = 0 to oPrinters.Count - 1 Step 2
   WScript.Echo "Port " & oPrinters.Item(i) & " = " & oPrinters.Item(i+1)
Next