#Requires -Version 3.0

New-Item -Path "c:\" -Name "OpenSSH" -ItemType "directory" -Force

Start-Transcript -Path C:\OpenSSH\log.txt -Force -noClobber -Append

Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'

# Get-NetFirewallRule -Name *ssh*

# New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22

Stop-Transcript
