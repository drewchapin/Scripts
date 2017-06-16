$apps = @(
    "*.EclipseManager"
    "Microsoft.BingNews"
    "Microsoft.Messaging"
    "Microsoft.Office.OneNote"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftPowerBIForWindows"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.Office.Sway"
    "Microsoft.OneConnect"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.XboxApp"
    "Microsoft.XboxIdentityProvider"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
    "Pandora*"
)

foreach( $app in $apps )
{
    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage
    Get-AppxProvisionedPackage -Online | where DisplayName -EQ $app | Remove-AppxProvisionedPackage -Online
}