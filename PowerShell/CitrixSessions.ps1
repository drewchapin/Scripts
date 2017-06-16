[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

$ports = 1494, 2598, 8008
$sessions = @()

foreach( $connection in Get-NetTCPConnection )
{
    if( $ports -contains $connection.RemotePort )
    {
        try
        {
            $server = [System.Net.Dns]::GetHostEntry($connection.RemoteAddress)
            if( $server.HostName -like '*ctx*' )
            {
                $sessions += $server.HostName
            }
        }
        catch
        {
        }
    }
}

$response = $null

if( $sessions.Count -gt 0 )
{
    $response = [System.Windows.Forms.MessageBox]::Show(
        $sessions,
        "Citrix Sessions",
        [System.Windows.Forms.MessageBoxButtons]::OK,
        [System.Windows.Forms.MessageBoxIcon]::Information,
        [System.Windows.Forms.MessageBoxButtons]::OK
    )
}
else
{
    $response = [System.Windows.Forms.MessageBox]::Show("No sessions found.","Citrix Sessions",[System.Windows.Forms.MessageBoxButtons]::OK,[System.Windows.Forms.MessageBoxIcon]::Error)
}

#while( $response -eq $null )
#{
#    Write-Host waiting...
#}