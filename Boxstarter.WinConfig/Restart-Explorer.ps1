function Restart-Explorer {

    try{
        Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name AutoRestartShell -Value 1 | out-Null
        $user = Get-CurrentUser
        Get-Process -Name explorer -IncludeUserName | ? { $_.UserName -eq "$($user.Domain)\$($user.Name)"} | Stop-Process -Force -ErrorAction Stop | Out-Null
    } catch {}
}
