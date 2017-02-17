##
## @file   ChangePassword.ps1
## @author Drew Chapin <drew@drewchapin.com>
## @brief  Script to change local password on multiple remote computers.
##

param (
	[array] $Computer
)

function Get-Password( $prompt ) 
{
	$pw = Read-Host $prompt -AsSecureString
	return [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($pw))
}

$login_username = Read-Host "Admin Username"
$login_password = Get-Password("Admin Password")
$update_username = Read-Host "Username to Update"
$update_password = Get-Password("New Password")
$confirm = Get-Password("Confirm Password")

if( $update_password -ne $confirm )
{
	Write-Host "New password confirmation failed. Please try again."
	exit
}

if( !$Computer )
{
	$Computer = @("COMPUTER1","COMPUTER2","COMPUTER3","COMPUTER4")
}

Write-Host "Updating passwords..."
	
foreach( $item in $Computer )
{
	Write-Host " [ -- ] $item" -NoNewLine
	try
	{
		$entry = New-Object System.DirectoryServices.DirectoryEntry("WinNT://$item/$update_username",$login_username,$login_password)
		$entry.Invoke("SetPassword",$update_password)
		Write-Host "`r [" -NoNewLine
		Write-Host "DONE" -ForegroundColor "green" -NoNewLine
		Write-Host "]"
	}
	catch
	{
		#Write-Host "`r [FAIL]" -ForegroundColor "red"
		Write-Host "`r [" -NoNewLine
		Write-Host "FAIL" -ForegroundColor "red" -NoNewLine
		Write-Host "]"
	}
}
