([ADSI]('WinNT://{0}' -f $env:COMPUTERNAME)).Children | Where { $_.SchemaClassName -eq 'user' } | ForEach { 
$user = ([ADSI]$_.Path) 
$lastLogin = $user.Properties.LastLogin.Value 
$enabled = ($user.Properties.UserFlags.Value -band 0x2) -ne 0x2 
if ($lastLogin -eq $null) { 
$lastLogin = 'Never' 
} 
Write-Host $user.Name $lastLogin $enabled 
} 
