##
## @file   ChangePassword.ps1
## @author Drew Chapin <drew@drewchapin.com>
## @date   September 23rd, 2016
## @brief  Script to change local password on multiple remote computers.
##

function Get-Password( $prompt ) 
{
	$pw = Read-Host $prompt -AsSecureString
	return [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($pw))
}

$login_username = Read-Host "Login Username"
$login_password = Get-Password("Login Password")
$update_username = Read-Host "Update Username"
$update_password = Get-Password("New Password")
$confirm = Get-Password("Confirm Password")

if( $update_password -ne $confirm )
{
	Write-Host "New password confirmation failed. Please try again."
	exit
}

$computers = @("HOSTNAME1","HOSTNAME2","HOSTNAME3")

foreach( $computer in $computers )
{
	Write-Host " [ -- ] $computer" -NoNewLine
	try
	{
		$entry = New-Object System.DirectoryServices.DirectoryEntry("WinNT://$computer/$update_username",$login_username,$login_password)
		$entry.Invoke("SetPassword",$update_password)
		Write-Host "`r [ OK ]" -ForegroundColor "green"
	}
	catch
	{
		Write-Host "`r [FAIL]" -ForegroundColor "red"
	}
}