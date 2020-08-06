#Requires -Version 3.0

Param (
        [string]$url = "https://github.com/PowerShell/Win32-OpenSSH/releases/download/v8.1.0.0p1-Beta/OpenSSH-Win64.zip",
        [string]$output = "C:\OpenSSH\OpenSSH-Win64.zip"
    )

New-Item -Path "c:\" -Name "OpenSSH" -ItemType "directory" -Force

Start-Transcript -Path C:\OpenSSH\log.txt -Force -noClobber -Append
Invoke-WebRequest -Uri $url -OutFile $output
Write-Output "File Downloaded"
Expand-Archive -LiteralPath C:\OpenSSH\OpenSSH-Win64.zip -DestinationPath C:\OpenSSH\

powershell.exe -ExecutionPolicy Bypass -File C:\OpenSSH\OpenSSH-Win64\install-sshd.ps1
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
net start sshd
Set-Service sshd -StartupType Automatic

Stop-Transcript
